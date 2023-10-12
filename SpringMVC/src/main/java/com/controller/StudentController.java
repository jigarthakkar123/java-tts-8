package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Student;
import com.dao.StudentDao;

@Controller
public class StudentController {

	ApplicationContext a=new ClassPathXmlApplicationContext("Beans.xml");
	StudentDao studentDao=a.getBean("studentDao",StudentDao.class);
	
	
	@RequestMapping(value = "index",method = RequestMethod.GET)
	public String home()
	{
		return "index";
	}
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String index()
	{
		return "index";
	}
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(HttpServletRequest request,HttpServletResponse response)
	{
		Student s=new Student();
		s.setFname(request.getParameter("fname"));
		s.setLname(request.getParameter("lname"));
		s.setEmail(request.getParameter("email"));
		s.setMobile(request.getParameter("mobile"));
		studentDao.insertOrUpdateStudent(s);
		return "show";
	}
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	public String edit(HttpServletRequest request,HttpServletResponse response)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		Student s=studentDao.getStudent(id);
		request.setAttribute("s", s);
		return "update";
	}
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(HttpServletRequest request,HttpServletResponse response)
	{
		Student s=new Student();
		s.setId(Integer.parseInt(request.getParameter("id")));
		s.setFname(request.getParameter("fname"));
		s.setLname(request.getParameter("lname"));
		s.setEmail(request.getParameter("email"));
		s.setMobile(request.getParameter("mobile"));
		studentDao.insertOrUpdateStudent(s);
		return "show";
	}
	@RequestMapping(value = "delete",method = RequestMethod.POST)
	public String delete(HttpServletRequest request,HttpServletResponse response)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		studentDao.deleteStudent(id);
		return "show";
	}
	@RequestMapping(value = "show",method = RequestMethod.GET)
	public String show()
	{
		return "show";
	}
}
