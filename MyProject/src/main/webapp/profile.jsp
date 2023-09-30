<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<!-- jewellery  section start -->
	<div class="jewellery_section">
		<div id="jewellery_main_slider" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<h1 class="fashion_taital">Update Profile</h1>
						<div class="fashion_section_2">
							<div class="row justify-content-center">
							<%
					if(request.getAttribute("msg")!=null)
					{
						out.print(request.getAttribute("msg"));
					}
				%>
								<form method="post" action="UserController">

									<div class="form-outline mb-12">
										<input type="text" id="form3Example1cg"
											class="form-control form-control-lg" name="name" value="<%=u.getName()%>"/> <label
											class="form-label" for="form3Example1cg">Your Name</label>
									</div>

									<div class="form-outline mb-12">
										<input type="email" id="form3Example3cg"
											class="form-control form-control-lg" name="email" value="<%=u.getEmail()%>" readonly="readonly"/> <label
											class="form-label" for="form3Example3cg">Your Email</label>
									</div>

									<div class="form-outline mb-12">
										<input type="text" id="form3Example3cg"
											class="form-control form-control-lg" name="mobile" value="<%=u.getMobile()%>" /> <label
											class="form-label" for="form3Example3cg">Your Mobile</label>
									</div>

									
									<div class="d-flex justify-content-center">
										<button type="submit" name="action" value="update profile"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Update Profile</button>
									</div>


								</form>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!-- jewellery  section end -->
	<!-- footer section start -->
	<div class="footer_section layout_padding">
		<div class="container">
			<div class="footer_logo">
				<a href="index.jsp"><img src="images/footer-logo.png"></a>
			</div>
			<div class="input_bt">
				<input type="text" class="mail_bt" placeholder="Your Email"
					name="Your Email"> <span class="subscribe_bt"
					id="basic-addon2"><a href="#">Subscribe</a></span>
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
			<div class="location_main">
				Help Line Number : <a href="#">+1 1800 1200 1200</a>
			</div>
		</div>
	</div>
	<!-- footer section end -->
	<!-- copyright section start -->
	<div class="copyright_section">
		<div class="container">
			<p class="copyright_text">
				© 2020 All Rights Reserved. Design by <a href="https://html.design">Free
					html Templates</a>
			</p>
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