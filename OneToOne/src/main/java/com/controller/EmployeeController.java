package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Employee;
import com.bean.EmployeeInfo;
import com.dao.EmployeeDao;

public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			EmployeeInfo einfo=new EmployeeInfo();
			einfo.setFname(request.getParameter("fname"));
			einfo.setLname(request.getParameter("lname"));
			einfo.setEmail(request.getParameter("email"));
			EmployeeDao.insertEmployeeInfo(einfo);
			
			Employee e=new Employee();
			e.setUname(request.getParameter("uname"));
			e.setPassword(request.getParameter("password"));
			e.setEinfo(einfo);
			EmployeeDao.insertEmployee(e);
			response.sendRedirect("emp.jsp");
		}
	}

}
