package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bean.User;
import com.dao.UserDao;

public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			User u=new User();
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setEmail(request.getParameter("email"));
			u.setMobile(request.getParameter("mobile"));
			u.setAddress(request.getParameter("address"));
			u.setGender(request.getParameter("gender"));
			u.setEducation(request.getParameter("education"));
			u.setPassword(request.getParameter("password"));
			UserDao.insertUser(u);
			request.setAttribute("msg", "Data Inserted Successfully");
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("edit"))
		{
			int uid=Integer.parseInt(request.getParameter("uid"));
			User u=UserDao.getUser(uid);
			request.setAttribute("u", u);
			request.getRequestDispatcher("update.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("update"))
		{
			User u=new User();
			u.setUid(Integer.parseInt(request.getParameter("uid")));
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setEmail(request.getParameter("email"));
			u.setMobile(request.getParameter("mobile"));
			u.setAddress(request.getParameter("address"));
			u.setGender(request.getParameter("gender"));
			u.setEducation(request.getParameter("education"));
			u.setPassword(request.getParameter("password"));
			UserDao.updateUser(u);
			request.setAttribute("msg", "Data Updated Successfully");
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			int uid=Integer.parseInt(request.getParameter("uid"));
			UserDao.deleteUser(uid);
			request.setAttribute("msg", "Data Deleted Successfully");
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
	}

}
