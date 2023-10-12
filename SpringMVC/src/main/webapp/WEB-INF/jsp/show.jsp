<%@page import="com.bean.Student"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<b style="color: blue;">
	<%
		if(request.getAttribute("msg")!=null)
		{
			out.println(request.getAttribute("msg"));
		}
	%>
</b>
<table border="5" width="100%" cellpadding="10px" cellspacing="10px">
	<tr>
		<th>UID</th>
		<th>FIRST NAME</th>
		<th>LAST NAME</th>
		<th>EMAIL</th>
		<th>MOBILE</th>
		<th>EDIT</th>
		<th>DELETE</th>
	</tr>
	<%
		ApplicationContext a=new ClassPathXmlApplicationContext("Beans.xml");
		StudentDao studentDao=a.getBean("studentDao",StudentDao.class);
		List<Student> list=studentDao.getAllStudent();
		for(Student s:list)
		{
	%>
	<tr>
		<td><%=s.getId() %></td>
		<td><%=s.getFname() %></td>
		<td><%=s.getLname() %></td>
		<td><%=s.getEmail() %></td>
		<td><%=s.getMobile() %></td>
		<td>
			<form name="edit" method="post" action="edit">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="EDIT" class="btn btn-primary">
			</form>
		</td>
		<td>
			<form name="delete" method="post" action="delete">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="DELETE" class="btn btn-danger">
			</form>
		</td>
	</tr>
	<%		
		}
	%>
</table>

<a href="index">Add New User</a>
</body>
</html>