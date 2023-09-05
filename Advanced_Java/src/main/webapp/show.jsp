<%@page import="com.dao.UserDao"%>
<%@page import="com.bean.User"%>
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
		<th>ADDRESS</th>
		<th>GENDER</th>
		<th>EDUCATION</th>
		<th>PASSWORD</th>
		<th>EDIT</th>
		<th>DELETE</th>
	</tr>
	<%
		List<User> list=UserDao.getAllUser();
		for(User u:list)
		{
	%>
	<tr>
		<td><%=u.getUid() %></td>
		<td><%=u.getFname() %></td>
		<td><%=u.getLname() %></td>
		<td><%=u.getEmail() %></td>
		<td><%=u.getMobile() %></td>
		<td><%=u.getAddress() %></td>
		<td><%=u.getGender() %></td>
		<td><%=u.getEducation() %></td>
		<td><%=u.getPassword() %></td>
		<td>
			<form name="edit" method="post" action="MyController">
				<input type="hidden" name="uid" value="<%=u.getUid()%>">
				<input type="submit" name="action" value="EDIT" class="btn btn-primary">
			</form>
		</td>
		<td>
			<form name="delete" method="post" action="MyController">
				<input type="hidden" name="uid" value="<%=u.getUid()%>">
				<input type="submit" name="action" value="DELETE" class="btn btn-danger">
			</form>
		</td>
	</tr>
	<%		
		}
	%>
</table>

<a href="index.jsp">Add New User</a>
</body>
</html>