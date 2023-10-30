package com.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.client.ClientConfig;

import com.bean.Student;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String WebURL="http://localhost:8088/RestServer/";
	ClientConfig clientConfig=null;
	Client client=null;
	Gson gson=new Gson();
	WebTarget target=null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Response rs=target.path("student").path("selectall").request().get();
		String result=rs.readEntity(String.class);
		if(rs.getStatus()==200)
		{
			List<Student> list=gson.fromJson(result, new TypeToken<List<Student>>() {}.getType());
			request.setAttribute("list", list);
			request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		else
		{
			System.out.println("Server Error");
		}
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		clientConfig=new ClientConfig();
		client=ClientBuilder.newClient(clientConfig);
		target=client.target(WebURL).path("rest");
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			Student s=new Student();
			s.setFname(request.getParameter("fname"));
			s.setLname(request.getParameter("lname"));
			s.setEmail(request.getParameter("email"));
			String student=gson.toJson(s);
			Response rs=target.path("student").path("insert").request().post(Entity.json(student));
			String result=rs.readEntity(String.class);
			if(rs.getStatus()==200)
			{
				showAll(request, response);
			}
			else
			{
				System.out.println(result);
			}
		}
		else if(action.equalsIgnoreCase("edit"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			String sid=gson.toJson(id);
			Response rs=target.path("student").path("getstudent").request().post(Entity.json(sid));
			String result=rs.readEntity(String.class);
			if(rs.getStatus()==200)
			{
				Student s=gson.fromJson(result, Student.class);
				request.setAttribute("s", s);
				request.getRequestDispatcher("update.jsp").forward(request, response);
			}
			else
			{
				System.out.println("Server Error");
			}
			
		}
		else if(action.equalsIgnoreCase("update"))
		{
			Student s=new Student();
			s.setId(Integer.parseInt(request.getParameter("id")));
			s.setFname(request.getParameter("fname"));
			s.setLname(request.getParameter("lname"));
			s.setEmail(request.getParameter("email"));
			String student=gson.toJson(s);
			Response rs=target.path("student").path("update").request().post(Entity.json(student));
			String result=rs.readEntity(String.class);
			if(rs.getStatus()==200)
			{
				showAll(request, response);
			}
			else
			{
				System.out.println(result);
			}
		}
		else if(action.equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			String sid=gson.toJson(id);
			Response rs=target.path("student").path("delete").request().post(Entity.json(sid));
			String result=rs.readEntity(String.class);
			if(rs.getStatus()==200)
			{
				showAll(request, response);
			}
			else
			{
				System.out.println(result);
			}
		}
	}
}
