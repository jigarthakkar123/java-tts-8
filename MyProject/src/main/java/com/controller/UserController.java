package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;
import com.service.Services;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("register"))
		{
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==false)
			{
				if(request.getParameter("password").equals(request.getParameter("cpassword")))
				{
					User u=new User();
					u.setUsertype(request.getParameter("usertype"));
					u.setName(request.getParameter("name"));
					u.setEmail(request.getParameter("email"));
					u.setMobile(Long.parseLong(request.getParameter("mobile")));
					u.setPassword(request.getParameter("password"));
					UserDao.registerUser(u);
					request.setAttribute("msg", "User Registered Successfully");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "Password & Confirm Password Does Not Matched");
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("login"))
		{
			User u=UserDao.loginUser(request.getParameter("email"), request.getParameter("password"));
			if(u!=null)
			{
				if(u.getUsertype().equals("buyer"))
				{
					HttpSession session=request.getSession();
					List<Wishlist> list=WishlistDao.getWishlistByUser(u.getUid());
					session.setAttribute("wishlist_count", list.size());
					List<Cart> list1=CartDao.getCartByUser(u.getUid());
					session.setAttribute("cart_count", list1.size());
					session.setAttribute("u", u);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else
				{
					HttpSession session=request.getSession();
					session.setAttribute("u", u);
					request.getRequestDispatcher("seller-index.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email Or Password Is Incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("change password"))
		{
			HttpSession session=request.getSession();
			User u=(User) session.getAttribute("u");
			if(u.getPassword().equals(request.getParameter("old_password")))
			{
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
				{
					u.setPassword(request.getParameter("new_password"));
					UserDao.changePassword(u);
					request.setAttribute("msg", "Password Changed Successfully");
					request.getRequestDispatcher("logout.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
					if(u.getUsertype().equals("buyer"))
					{
						request.getRequestDispatcher("change-password.jsp").forward(request, response);
					}
					else
					{
						request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
					}
				}
			}
			else
			{
				request.setAttribute("msg", "Old Password Does Not Matched");
				if(u.getUsertype().equals("buyer"))
				{
					request.getRequestDispatcher("change-password.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
				}
			}
		}
		else if(action.equalsIgnoreCase("update profile"))
		{
			HttpSession session=request.getSession();
			User u=(User) session.getAttribute("u");
			u.setName(request.getParameter("name"));
			u.setMobile(Long.parseLong(request.getParameter("mobile")));
			UserDao.updateProfile(u);
			session.setAttribute("u", u);
			request.setAttribute("msg", "Profile Updated Successfully");
			if(u.getUsertype().equals("buyer"))
			{
				request.getRequestDispatcher("profile.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("seller-profile.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("send otp"))
		{
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			
			if(flag==true)
			{
				Random t = new Random();
		    	int minRange = 1000, maxRange= 9999;
	        	int otp = t.nextInt(maxRange - minRange) + minRange;
	        	Services.sendMail(request.getParameter("email"), otp);
	        	request.setAttribute("email", request.getParameter("email"));
	        	request.setAttribute("otp", otp);
	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "Email Not Registered");
				request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("verify otp"))
		{
			String email=request.getParameter("email");
			int otp=Integer.parseInt(request.getParameter("otp"));
			int uotp=Integer.parseInt(request.getParameter("uotp"));
			
			if(otp==uotp)
			{
				request.setAttribute("email", email);
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("email", email);
	        	request.setAttribute("otp", otp);
	        	request.setAttribute("msg", "Invalid OTP");
	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("update password"))
		{
			String email=request.getParameter("email");
			String np=request.getParameter("new_password");
			String cnp=request.getParameter("cnew_password");
			
			if(np.equals(cnp))
			{
				UserDao.updatePassword(email, np);
				request.setAttribute("msg", "Password Updated Successfully");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("email", email);
				request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
		}
	}

}
