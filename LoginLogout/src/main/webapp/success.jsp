<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
.gradient-custom-3 {
/* fallback for old browsers */
background: #84fab0;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
}
.gradient-custom-4 {
/* fallback for old browsers */
background: #84fab0;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
}
</style>
</head>
<body>
<section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Login Here</h2>
				<%
					User u=null;
					if(request.getAttribute("msg")!=null)
					{
						out.print(request.getAttribute("msg"));
					}
					if(session!=null)
					{
						if(session.getAttribute("u")!=null)
						{
							u=(User)session.getAttribute("u");
						}
					}
				%>
              	<h3>
              		<%
              			if(u==null)
              			{
              		%>
              			Welcome Guest. Please Do <a href="login.jsp">Login</a> For More Activity.
              		<%
              			}
              			else
              			{
              		%>
              		Welcome <%=u.getName() %>.
              		<br><br>
              		
              		<%
              			out.println("Session Id : "+session.getId());
              		%>
              		<br><br>
              		<a href="profile.jsp">Profile</a> ||
              		<a href="change-password.jsp">Change Password</a> || 
              		<a href="logout.jsp">Logout</a>
              		<%
              			}
              		%>
              	</h3>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>