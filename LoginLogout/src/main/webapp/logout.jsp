<%
	session.removeAttribute("u");
	session.invalidate();
	
	if(request.getAttribute("msg")!=null)
	{
		request.setAttribute("msg",request.getAttribute("msg"));
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	
%>