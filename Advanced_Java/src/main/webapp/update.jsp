<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checkFname()
{
	var f=document.frm.fname.value;
	var reg=/^[A-Za-z]+$/;
	if(f=="")
	{
		//alert("Please Enter First Name");
		document.getElementById("fname").innerHTML="Please Enter First Name";
	}
	else if(!reg.test(f))
	{
		document.getElementById("fname").innerHTML="Please Enter Only Alphabets";	
	}
	else
	{
		document.getElementById("fname").innerHTML="";
	}
}
</script>
</head>
<body>
<%
	User u=(User)request.getAttribute("u");
	if(request.getAttribute("msg")!=null)
	{
		out.println(request.getAttribute("msg"));
	}
%>
<form name="frm" method="post" action="MyController">
	<table cellpadding="5px">
		<tr>
			<td><input type="hidden" name="uid" value="<%=u.getUid()%>"></td>
		</tr>
		<tr>
			<td>First Name</td>
			<td><input type="text" name="fname" value="<%=u.getFname()%>"></td>
			<td><span id="fname"></span></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lname" value="<%=u.getLname()%>"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value="<%=u.getEmail()%>"></td>
		</tr>
		<tr>
			<td>Mobile</td>
			<td><input type="text" name="mobile" value="<%=u.getMobile()%>"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><textarea rows="5" cols="21" name="address"><%=u.getAddress() %></textarea></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<%
					if(u.getGender().equals("male"))
					{
				%>
						<input type="radio" name="gender" value="male" checked="checked">Male
						<input type="radio" name="gender" value="female">Female
				<%		
					}
					else
					{
				%>
						<input type="radio" name="gender" value="male">Male
						<input type="radio" name="gender" value="female" checked="checked">Female
				<%		
					}
				%>
				
			</td>
		</tr>
		
		<tr>
			<td>Education</td>
			<td>
				<select name="education">
					<%
						if(u.getEducation().equals("10th"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th" selected="selected">10th</option>
							<option value="12th">12th</option>
							<option value="BE">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("12th"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th" selected="selected">12th</option>
							<option value="BE">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("BE"))
						{
					%>		
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th">12th</option>
							<option value="BE" selected="selected">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("BCA"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th">12th</option>
							<option value="BE">BE</option>
							<option value="BCA" selected="selected">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("BBA"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th">12th</option>
							<option value="BE">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA" selected="selected">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("ME"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th">12th</option>
							<option value="BE">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME" selected="selected">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("MCA"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th">12th</option>
							<option value="BE">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA" selected="selected">MCA</option>
							<option value="MBA">MBA</option>
					<%		
						}
						else if(u.getEducation().equals("MBA"))
						{
					%>
							<option>---Select Education---</option>
							<option value="10th">10th</option>
							<option value="12th">12th</option>
							<option value="BE">BE</option>
							<option value="BCA">BCA</option>
							<option value="BBA">BBA</option>
							<option value="ME">ME</option>
							<option value="MCA">MCA</option>
							<option value="MBA" selected="selected">MBA</option>
					<%		
						}
					%>
										
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Password</td>
			<td><input type="password" name="password"  value="<%=u.getPassword()%>"></td>
		</tr>
		<tr>
			<td>Confirm Password</td>
			<td><input type="password" name="cpassword" value="<%=u.getPassword()%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="Update">
			</td>
		</tr>
	</table>
</form>

</body>
</html>