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
	if(request.getAttribute("msg")!=null)
	{
		out.println(request.getAttribute("msg"));
	}
%>
<form name="frm" method="post" action="MyController">
	<table cellpadding="5px">
		<tr>
			<td>First Name</td>
			<td><input type="text" name="fname" onblur="checkFname();"></td>
			<td><span id="fname"></span></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lname"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>Mobile</td>
			<td><input type="text" name="mobile"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><textarea rows="5" cols="21" name="address"></textarea></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<input type="radio" name="gender" value="male">Male
				<input type="radio" name="gender" value="female">Female
			</td>
		</tr>
		
		<tr>
			<td>Education</td>
			<td>
				<select name="education">
					<option>---Select Education---</option>
					<option value="10th">10th</option>
					<option value="12th">12th</option>
					<option value="BE">BE</option>
					<option value="BCA">BCA</option>
					<option value="BBA">BBA</option>
					<option value="ME">ME</option>
					<option value="MCA">MCA</option>
					<option value="MBA">MBA</option>					
				</select>
			</td>
		</tr>
		
		<tr>
			<td>Password</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>Confirm Password</td>
			<td><input type="password" name="cpassword"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" name="action" value="INSERT">
			</td>
		</tr>
	</table>
</form>
<a href="show.jsp">Show All User</a>
</body>
</html>