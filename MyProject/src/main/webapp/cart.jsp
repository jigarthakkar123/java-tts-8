<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.bttnStyle {
	background-color: lightblue;
	border-radius: 0.50rem;
	border: 1px solid transperent;
}
</style>
</head>
<body>
	<!-- fashion section start -->
	<div class="fashion_section">
		<div id="main_slider" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<%
						List<Cart> list = CartDao.getCartByUser(u.getUid());
						if (list.size() > 0) {
						%>
						<h1 class="fashion_taital">My Cart</h1>
						<%
						} else {
						%>
						<h1 class="fashion_taital">No Products In Cart</h1>
						<%
						}
						%>
						<div class="fashion_section_2">
							<div class="row">
								<%
								int net_price = 0;
								for (Cart c : list) {
									net_price = net_price + c.getTotal_price();
									Product p = ProductDao.getProductPid(c.getPid());
								%>
								<div class="col-lg-4 col-sm-4">
									<div class="box_main">
										<h4 class="shirt_text"><%=p.getProduct_category()%>
											T -shirt
										</h4>

										<div class="tshirt_img">
											<img src="product_images/<%=p.getProduct_image()%>">
										</div>
										<p>
											Price <span style="color: #262626;"><%=c.getProduct_price()%></span>
										</p>
										<form name="qty" method="post"
											action="change-qty.jsp?cid=<%=c.getCid()%>">
											Product Qty : <input type="number" name="product_qty"
												value="<%=c.getProduct_qty()%>" min="1" max="10"
												onchange="this.form.submit();">
										</form>
										<p>
											Total Price <span style="color: #262626;"><%=c.getTotal_price()%></span>
										</p>
										<div class="btn_main">

											<div class="seemore_bt">
												<a href="product-details.jsp?pid=<%=p.getPid()%>">See
													More</a>
											</div>
										</div>
									</div>
								</div>
								<%
								}
								%>
							</div>
						</div>
						<h1>
							Net Price :
							<%=net_price%></h1>
						<form>
							<input type="text" id="amount" name="amount"
								value="<%=net_price%>">

						</form>
						<button id="payButton" onclick="CreateOrderID()" class="bttnStyle">Pay
							Now</button>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- fashion section end -->

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
	<script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		alert("1");
		xhttp.open("GET","http://localhost:8081/MyProject/OrderCreation",false);
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		alert("2");
		OpenCheckOut();
	}
</script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script type="text/javascript">
	
	
	function OpenCheckOut()
	{
		alert("3");
		var net_amount=document.getElementById("amount").value;
		var amount=net_amount*100;
		var options={
				"key":"rzp_test_M2570fHzxsVczK",
				"amount":amount,
				"currency":"INR",
				"name":name,
				"description":"Test",
				"callback_url":"http://localhost:8081/MyProject/index.jsp?id=<%=u.getUid()%>",
				"prefill":{
					"name":"Jigar Thakkar",
					"email":"jigar.thakkar.tops@gmail.com",
					"contact":"9377614772"
				},
				"notes":{
					"address":"Gandhinagar"
				},
				"theme":{
					"color":"#3399cc"
				}
				
				
		};
		var rzp1=new Razorpay(options);
		rzp1.on('payment.failed',function (response){
			alert(response.error.code);
	        alert(response.error.description);
	        alert(response.error.source);
	        alert(response.error.step);
	        alert(response.error.reason);
	        alert(response.error.metadata.order_id);
	        alert(response.error.metadata.payment_id);
		});
		rzp1.open();
	    e.preventDefault();
	}
</script>
</body>
</html>