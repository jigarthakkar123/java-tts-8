<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      
   </head>
   <%
	int id=0;
	out.print("Id : "+id);
	try{
		id=Integer.parseInt(request.getParameter("id"));
	}catch(Exception e){
	}
	if(id!=0)
	{
		out.print("Id : "+id);
		List<Cart> list=CartDao.getCartByUser(id);
		for(Cart c:list)
		{
			CartDao.updatePaymentStatus(id);
		}
		List<Cart> list1=CartDao.getCartByUser(id);
		session.setAttribute("cart_count", list1.size());
		response.sendRedirect("cart.jsp");
	}
%>
   <body>
      <!-- fashion section start -->
      <div class="fashion_section">
         <div id="main_slider" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <h1 class="fashion_taital">My Products</h1>
                     <div class="fashion_section_2">
                        <div class="row">
                        <%
                        	List<Product> list=ProductDao.getAllProduct();
                        	for(Product p:list)
                        	{
                        %>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=p.getProduct_category() %> T -shirt</h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=p.getProduct_price() %></span></p>
                                 <div class="tshirt_img"><img src="product_images/<%=p.getProduct_image()%>"></div>
                                 <div class="btn_main">
                                    
                                    <div class="seemore_bt"><a href="product-details.jsp?pid=<%=p.getPid()%>">See More</a></div>
                                 </div>
                              </div>
                           </div>
                        <%
                        	}
                        %>   
                        </div>
                     </div>
                  </div>
               </div>
               
            </div>
            
         </div>
      </div>
      <!-- fashion section end -->
      
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="footer_logo"><a href="index.jsp"><img src="images/footer-logo.png"></a></div>
            <div class="input_bt">
               <input type="text" class="mail_bt" placeholder="Your Email" name="Your Email">
               <span class="subscribe_bt" id="basic-addon2"><a href="#">Subscribe</a></span>
            </div>
            <div class="footer_menu">
               <ul>
                  <li><a href="#">Best Sellers</a></li>
                  <li><a href="#">Gift Ideas</a></li>
                  <li><a href="#">New Releases</a></li>
                  <li><a href="#">Today's Deals</a></li>
                  <li><a href="#">Customer Service</a></li>
               </ul>
            </div>
            <div class="location_main">Help Line  Number : <a href="#">+1 1800 1200 1200</a></div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">� 2020 All Rights Reserved. Design by <a href="https://html.design">Free html  Templates</a></p>
         </div>
      </div>
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script>
         function openNav() {
           document.getElementById("mySidenav").style.width = "250px";
         }
         
         function closeNav() {
           document.getElementById("mySidenav").style.width = "0";
         }
      </script>
   </body>
</html>