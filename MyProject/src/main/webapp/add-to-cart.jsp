<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@ include file="header.jsp" %>
<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	int uid=u.getUid();
	Cart c=new Cart();
	c.setUid(uid);
	c.setPid(pid);
	c.setProduct_qty(1);
	Product p=ProductDao.getProductPid(pid);
	c.setProduct_price(p.getProduct_price());
	c.setTotal_price(p.getProduct_price());
	CartDao.addToCart(c);
	List<Cart> list=CartDao.getCartByUser(uid);
	session.setAttribute("cart_count", list.size());
	response.sendRedirect("cart.jsp");
%>