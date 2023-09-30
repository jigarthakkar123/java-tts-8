<%@page import="com.dao.CartDao"%>
<%@page import="com.dao.WishlistDao"%>
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
                        	Product p=ProductDao.getProductPid(Integer.parseInt(request.getParameter("pid")));
                        	boolean wishlist_flag=WishlistDao.checkWishlist(u.getUid(), Integer.parseInt(request.getParameter("pid")));
                        	boolean cart_flag=CartDao.checkCart(u.getUid(), Integer.parseInt(request.getParameter("pid")));
                        %>
                           <div class="col-lg-4 col-sm-4">
                              <div class="box_main">
                                 <h4 class="shirt_text"><%=p.getProduct_category() %> T -shirt</h4>
                                 <p class="price_text">Price  <span style="color: #262626;"><%=p.getProduct_price() %></span></p>
                                 <div class="tshirt_img"><img src="product_images/<%=p.getProduct_image()%>"></div>
                                 <p class="price_text">Detail  : <span style="color: #262626;"><%=p.getProduct_desc() %></span></p>
                                 <br><br>
                                 <div class="btn_main">
                                 	<%
                                 		if(u!=null)
                                 		{
                                 	%>
                                 			<%
                                 				if(cart_flag==false)
                                 				{
                                 			%>
                                    			<div class="seemore_bt"><a href="add-to-cart.jsp?pid=<%=p.getPid()%>"><input type="button" class="btn btn-primary" value="Add To Cart"></a></div>
                                    		<%
                                 				}
                                 				else
                                 				{
                                    		%>
                                    			<div class="seemore_bt"><a href="remove-from-cart.jsp?pid=<%=p.getPid()%>"><input type="button" class="btn btn-danger" value="Remove From Cart"></a></div>
                                    		<%
                                 				}
                                    		%>
                                 			<%
                                 				if(wishlist_flag==false)
                                 				{
                                 			%>
                                    			<div class="seemore_bt"><a href="add-to-wishlist.jsp?pid=<%=p.getPid()%>"><input type="button" class="btn btn-primary" value="Add To Wishlist"></a></div>
                                    		<%
                                 				}
                                 				else
                                 				{
                                    		%>
                                    			<div class="seemore_bt"><a href="remove-from-wishlist.jsp?pid=<%=p.getPid()%>"><input type="button" class="btn btn-danger" value="Remove From Wishlist"></a></div>
                                    		<%
                                 				}
                                    		%>
                                 	<%			
                                 		}
                                 		else
                                 		{
                                 	%>
                                 			<div class="seemore_bt"><a href="login.jsp"><input type="button" class="btn btn-primary" value="Login"></a></div>
                                 	<%		
                                 		}
                                 	%>
                                 	
                                 </div>
                              </div>
                           </div>
                        <%
                        	
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
            <p class="copyright_text">© 2020 All Rights Reserved. Design by <a href="https://html.design">Free html  Templates</a></p>
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