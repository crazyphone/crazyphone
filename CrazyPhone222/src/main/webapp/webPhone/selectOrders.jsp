
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<title>Luxury Watches A Ecommerce Category Flat Bootstarp Resposive Website Template | Contact :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--start-menu-->
<script src="js/simpleCart.min.js"> </script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>	
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>	


<style>
.container2 {
  padding: 16px;
  background-color: #ebe8e8;
  margin: auto; 
  border: 2px solid #888;
  width: 60%; 
}		
input[type=text] {
  width: 70%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
button { 
   background-color: #4860a8; 
   color: white; 
   padding: 5px 5px; 
   margin: 8px 0; 
   border: none; 
   cursor: pointer; 
  
 } 
.ddd{
margin:0px auto;
width:60%;

}



</style>

</head>
<body> 
<!-- 標頭開始 -->
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<!-- <div class="drop">
						<div class="box">
							<select tabindex="4" class="dropdown drop">
								<option value="" class="label">Dollar :</option>
								<option value="1">Dollar</option>
								<option value="2">Euro</option>
							</select>
						</div>
						<div class="box1">
							<select tabindex="4" class="dropdown">
								<option value="" class="label">English :</option>
								<option value="1">English</option>
								<option value="2">French</option>
								<option value="3">German</option>
							</select>
						</div>
						<div class="clearfix"></div>
					</div> -->
				</div>
				<div class="col-md-6 top-header-left">
				
					<div class="cart box_1">
									
				
				
						<a href="check">
							<div class="total">
								<span class="simpleCart_total"></span>
							</div> <img src="images/cart-1.png" alt="" />
						</a>
						<p>
							<a href="javascript:;" class="simpleCart_empty">清空購物車</a>
						</p>
						<div class="clearfix"></div>
					</div>
					<div class="cart box_1">
						
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--start-logo-->
	<div class="logo">
		<a href="home"><h1>Phone人苑</h1></a>
		<c:if test="${! empty LoginSuperOK }"> 
		<span  style="position: absolute; right: 0; margin-right: 250px;font-size:22px"><a  href="test" >後台</a></span>
		</c:if>
	</div>
	<!--start-logo-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
					<div class="top-nav">
						<ul class="memenu skyblue">
							<li class="active"><a href="<c:url value = '/' />">首頁</a></li>
							<li class="grid"><a href="products.html">商城</a>
								<div class="mepanel">
									<div class="row">
										<div class="col1 me-one">
											<h4>Shop</h4>
											<ul>
												<li><a href="products.html">New Arrivals</a></li>
												<li><a href="products.html">Blazers</a></li>
												<li><a href="products.html">Swem Wear</a></li>
												<li><a href="products.html">Accessories</a></li>
												<li><a href="products.html">Handbags</a></li>
												<li><a href="products.html">T-Shirts</a></li>
												<li><a href="products.html">Watches</a></li>
												<li><a href="products.html">My Shopping Bag</a></li>
											</ul>
										</div>
										<div class="col1 me-one">
											<h4>Style Zone</h4>
											<ul>
												<li><a href="products.html">Shoes</a></li>
												<li><a href="products.html">Watches</a></li>
												<li><a href="products.html">Brands</a></li>
												<li><a href="products.html">Coats</a></li>
												<li><a href="products.html">Accessories</a></li>
												<li><a href="products.html">Trousers</a></li>
											</ul>
										</div>
										<div class="col1 me-one">
											<h4>Popular Brands</h4>
											<ul>
												<li><a href="products.html">499 Store</a></li>
												<li><a href="products.html">Fastrack</a></li>
												<li><a href="products.html">Casio</a></li>
												<li><a href="products.html">Fossil</a></li>
												<li><a href="products.html">Maxima</a></li>
												<li><a href="products.html">Timex</a></li>
												<li><a href="products.html">TomTom</a></li>
												<li><a href="products.html">Tin</a></li>
											</ul>
										</div>
									</div>
								</div></li>
<!-- 							<li class="grid"><a href="#">活動課程</a> -->
							<li class="grid"><a href="products2">小商城</a>
							<li class="grid"><a href="#">車拚</a></li>
							<li class="grid"><a href="contact">聯絡我們</a></li>
							<li class="grid"><a href="register">註冊</a></li>
							<c:if test="${  empty LoginOK &&  empty LoginSuperOK}">
							<li class="grid"><a href="lognin">登入</a></li>
							</c:if>
							<c:if test="${ ! empty LoginOK ||  ! empty LoginSuperOK}">
							<li class="grid" ><a href="lognout" onclick="signOut()">登出</a></li>
							</c:if>
							<c:if test="${! empty LoginOK }"> 
 								<span style="margin:50px">Hello <a  href="up1">${LoginOK.memberName}</a></span>
								<img width='60' height='60' style="margin-left: -50px;margin-top: -20px"
									src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" />
							</c:if> 
							<c:if test="${! empty LoginSuperOK }"> 
 								<span style="margin:50px">Hello <a  href="up1">${LoginSuperOK.supervisorName}</a>(管理人員)</span>
<!-- 								<img width='60' height='60' style="margin-left: -50px;margin-top: -20px" -->
<%-- 									src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" /> --%>
							</c:if> 
							
						</ul>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3 header-right">
					<div class="search-bar">
						<input type="text" value="Search" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}">
						<input type="submit" value="">
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
<!-- 	標頭結束 -->
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="<c:url value = '/' />">Home</a></li>
					<li class="active">歷史訂單</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--contact-start-->
<!-- 	----------------------------------------------------------------------- -->
	
		
			

	
<!-- 	--------------------------------------------------------------------- -->
	

		
	<div class="contact">
		<div class="container">
			<div class="contact-top heading">
				<h2>歷史訂單</h2>
			</div>
				<div class="ddd">

					<table border='2' cellpadding="3" cellspacing="1">
				<tr style="background-color:#787dcc;">
						<th width='150' style="text-align: center">訂單編號</th>
						<th width='200' style="text-align: center">訂單日期</th>
						<th width='200' style="text-align: center">狀態</th>
						<th width='150' style="text-align: center">總價</th>
						<th width='50' style="text-align: center">明細</th>

					</tr>
					<c:forEach var='orderSelectMember1' items='${orderSelectMember}'>
						<tr>
							<td style="text-align: center">${orderSelectMember1.orderID}</td>
							
<%-- 							<td><img width='250' height='150' src="<c:url value='/getcarImg/${carousel.carouselID}'/>" /></td> --%>
							
							<td style="text-align: center" height="50">${orderSelectMember1.orderDate}</td>
							<td style="text-align: center;font-weight:bold;">${orderSelectMember1.goodsStatus}</td>
							<td style="text-align: center">${orderSelectMember1.finalPrice}</td>
<%-- 							<td style="text-align: center"><a href="<c:url value='/deCar/${orderSelectMember1.orderID}'/>">查看</a></td> --%>
							<td style="text-align: center">
							
							 <a data-toggle="collapse"
								data-parent="#accordion" href="#collapse${orderSelectMember1.ID}">
									查看 </a>

</td>
								<div id="collapse${orderSelectMember1.ID}" class="panel-collapse collapse">
									<div class="panel-body" style="margin-left: 60%; border: 1.5px solid transparent ;
									border-radius: 10px ;background-color: #d3ddeb;position: relative;font-weight:bold;">
									
									<div style="color:red;text-align:center;font-weight:bold;">訂單編號:${orderSelectMember1.orderID}</div><br>
									發票編號:${orderSelectMember1.invoiceNum}<br>
									商品名稱:${orderSelectMember1.productName}<br>
									數量:${orderSelectMember1.quantity}<br>
									出貨地點:${orderSelectMember1.shipAddress}<br>
									</div>
									<div style="width: 0;height: 0;border-style: solid;
border-width: 20px 15.5px 0 15.5px;border-color: #d3ddeb transparent transparent transparent;margin-left: 91.5%"></div>
								</div>
								
								
									
						</tr>
					</c:forEach>
				</table>
					
					</div>	
					<div class="clearfix"></div>
				</div>
		</div>
	
<hr>
	<!--contact-end-->
	<!--map-start-->
	<div class="map">
		<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe> -->
<!-- 		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d225.93837800922856!2d121.54236744924873!3d25.033597317002624!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd4825ecdf1%3A0xa9479a36fc6b99d0!2sDigital%20Education%20Institute%2C%20III!5e0!3m2!1szh-TW!2stw!4v1592843106856!5m2!1szh-TW!2stw" style="border:0;"></iframe> -->
		<!-- width="600" height="450" frameborder="0"  allowfullscreen="" aria-hidden="false" tabindex="0" -->
	</div>
	<!--map-end-->
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>追蹤我們</h3>
					<ul>
						<li><a href="#"><span class="fb"></span><h6>Facebook</h6></a></li>
						<li><a href="#"><span class="twit"></span><h6>Twitter</h6></a></li>
						<li><a href="#"><span class="google"></span><h6>Google+</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>相關資訊</h3>
					<ul>
						<li><a href="#"><p>熱銷商品</p></a></li>
						<li><a href="#"><p>新進商品</p></a></li>
						<!-- <li><a href="#"><p>Our Stores</p></a></li> -->
						<!-- <li><a href="contact.html"><p>Contact Us</p></a></li> -->
						<!-- <li><a href="#"><p>Top Sellers</p></a></li> -->
					</ul>
				</div>
				<!-- <div class="col-md-3 infor-left">
					<h3>My Account</h3>
					<ul>
						<li><a href="account.html"><p>My Account</p></a></li>
						<li><a href="#"><p>My Credit slips</p></a></li>
						<li><a href="#"><p>My Merchandise returns</p></a></li>
						<li><a href="#"><p>My Personal info</p></a></li>
						<li><a href="#"><p>My Addresses</p></a></li>
					</ul>
				</div> -->
				<div class="col-md-3 infor-left">
					<h3>品牌總覽</h3>
					<ul>
						<li><a href="account.html"><p>SAMSUNG</p></a></li>
						<li><a href="#"><p>Apple</p></a></li>
						<li><a href="#"><p>ASUS</p></a></li>
						<li><a href="#"><p>HTC</p></a></li>
						<li><a href="#"><p>SONY</p></a></li>
						<li><a href="#"><p>Google</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>商店資訊</h3>
					<h4>The company name,
						<span>Lorem ipsum dolor,</span>
						Glasglow Dr 40 Fe 72.</h4>
					<h5>+955 123 4567</h5>	
					<p><a href="mailto:example@email.com">contact@example.com</a></p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--information-end-->
	<!--footer-starts-->
	<div class="footer">
		<div class="container">
			<div class="footer-top">
				<div class="col-md-6 footer-left">
					<form>
						<input type="text" value="Enter Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Your Email';}">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="col-md-6 footer-right">					
					<p>© 2020 Phone人苑. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-end-->	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	 <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script type="text/javascript">

	</script>
</body>
</html>