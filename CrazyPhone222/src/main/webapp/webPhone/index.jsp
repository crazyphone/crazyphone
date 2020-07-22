<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>Phone人苑 | Home</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Phone人苑 Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 








</script>
<!--start-menu-->
<script src="js/simpleCart.min.js">
	
</script>
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<!--dropdown-->
<script src="js/jquery.easydropdown.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
 <meta name="google-signin-client_id" 
	content='110794926966-tvl8m24boaqav34ifoh4fe3fh3egsusg.apps.googleusercontent.com'> 
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
					</div>
					-->
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout">
							<div class="total">
								<span class="simpleCart_total"></span>
							</div> <img src="images/cart-1.png" alt="" />
						</a>
						<p>
							<a href="javascript:;" class="simpleCart_empty">清空購物車</a>
						</p>
						<div class="clearfix"></div>
					</div>
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
		<a href="<c:url value='/'/>"><h1>Phone人苑</h1></a>
		<c:if test="${! empty LoginSuperOK }"> 
		<span  style="position: absolute; right: 0; margin-right: 250px;font-size:22px"><a  href="backIndex" >後台</a></span>
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
							<li class="grid"><a href="products">商城</a> <!--  
								<div class="mepanel">
									<div class="row">
										<div class="col1 me-one">
											<h4>智慧型手機</h4>
											<ul>
												<li><a href="products">SAMSUNG</a></li>
												<li><a href="products">Apple</a></li>
												<li><a href="products">ASUS</a></li>
												<li><a href="products">HTC</a></li>
												<li><a href="products">SONY</a></li>
												<li><a href="products">Google</a></li>
											</ul>
										</div>
										<div class="col1 me-one">
											<h4>穿戴式配件</h4>
											<ul>
												<li><a href="products">SAMSUNG</a></li>
												<li><a href="products">Apple</a></li>
												<li><a href="products">ASUS</a></li>
												<li><a href="products">HTC</a></li>
												<li><a href="products">SONY</a></li>
												<li><a href="products">Google</a></li>
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
												<li><a href="products.html">Titan</a></li>
											</ul>
										</div>
										
									</div>
								</div>
								--></li>
							<li class="grid"><a href="showPKCartContent">車拚</a></li>
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
 								<span style="margin:50px">Hello <a  href="<c:url value='/'/>">${LoginSuperOK.supervisorName}</a>(管理人員)</span>
<!-- 								<img width='60' height='60' style="margin-left: -50px;margin-top: -20px" -->
<%-- 									src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" /> --%>
							</c:if> 
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-3 header-right">
					<div class="search-bar">
					<form method='POST' action="<c:url value='searchProduct' />">
					
						<input type="text" name="searchP" value="Search" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}">
						<input type="submit" value="">
					</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--bottom-header-->
	<!-- 	標頭結束 -->
	<!--banner-starts-->
	<div class="bnr" id="home">
		<div id="top" class="callbacks_container">
			<ul class="rslides" id="slider4">
				<c:forEach var='carousel' items='${carousels11}'>
					<li><a href="${carousel.carouselUrl}"><img
						src="<c:url value='/getcarImg/${carousel.carouselID}'/>" alt="" /></a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--banner-ends-->
	<!--Slider-Starts-Here-->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider4").responsiveSlides({
				auto : true,
				pager : true,
				nav : true,
				speed : 500,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!--End-slider-script-->
	<!--about-starts-->
	<div class="about">
		<div class="container">
			<div class="about-top grid-1">
				<div class="col-md-4 about-left">
					<figure class="effect-bubba">
						<img class="img-responsive" src="images/abt-1.jpg" alt="" />
						<figcaption>
							<h2>Nulla maximus nunc</h2>
							<p>In sit amet sapien eros Integer dolore magna aliqua</p>
						</figcaption>
					</figure>
				</div>
				<div class="col-md-4 about-left">
					<figure class="effect-bubba">
						<img class="img-responsive" src="images/abt-2.jpg" alt="" />
						<figcaption>
							<h4>Mauris erat augue</h4>
							<p>In sit amet sapien eros Integer dolore magna aliqua</p>
						</figcaption>
					</figure>
				</div>
				<div class="col-md-4 about-left">
					<figure class="effect-bubba">
						<img class="img-responsive" src="images/abt-3.jpg" alt="" />
						<figcaption>
							<h4>Cras elit mauris</h4>
							<p>In sit amet sapien eros Integer dolore magna aliqua</p>
						</figcaption>
					</figure>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--about-end-->
	<!--product-starts-->
	<div class="product">
		<div class="container">
			<div class="product-top">

				<div class="product-one">
					<c:forEach var='product' items='${products}' varStatus="status"
						begin="1" end="8">
						<div class="col-md-3 product-left">
							<div class="product-main simpleCart_shelfItem">
								<a href="<spring:url value='product?id=${product.productID}'/>"
									class="mask"> <img class="img-responsive zoom-img"
									src="<c:url value='/getPicture/${product.productID}' />" alt="" /></a>
								<div class="product-bottom">
									<h3>${product.productName}</h3>
									<p>Explore Now</p>
									<h4>
										<a class="item_add" href="#"><i></i></a> <span
											class=" item_price">$ ${product.unitPrice}</span>
									</h4>
								</div>
								<div class="srch">
									<span>-50%</span>
								</div>
							</div>
						</div>



						<c:if test="${status.count==4}">
							<div class="clearfix"></div>
							</div>
							<div class="product-one">
					</c:if>

					<c:if test="${status.count==8}">
						<div class="clearfix"></div>
						</div>
				</c:if>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--product-end-->
	<!--information-starts-->
	<div class="information">
		<div class="container">
			<div class="infor-top">
				<div class="col-md-3 infor-left">
					<h3>追蹤我們</h3>
					<ul>
						<li><a href="#"><span class="fb"></span>
								<h6>Facebook</h6></a></li>
						<li><a href="#"><span class="twit"></span>
								<h6>Twitter</h6></a></li>
						<li><a href="#"><span class="google"></span>
								<h6>Google+</h6></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>相關資訊</h3>
					<ul>
						<li><a href="#"><p>熱銷商品</p></a></li>
						<li><a href="#"><p>新進商品</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>品牌總覽</h3>
					<ul>
						<li><a href="products"><p>SAMSUNG</p></a></li>
						<li><a href="products"><p>Apple</p></a></li>
						<li><a href="products"><p>ASUS</p></a></li>
						<li><a href="products"><p>HTC</p></a></li>
						<li><a href="products"><p>SONY</p></a></li>
						<li><a href="products"><p>Google</p></a></li>
					</ul>
				</div>
				<div class="col-md-3 infor-left">
					<h3>商店資訊</h3>
					<h4>
						The company name, <span>Lorem ipsum dolor,</span> Glasglow Dr 40
						Fe 72.
					</h4>
					<h5>+955 123 4567</h5>
					<p>
						<a href="mailto:example@email.com">contact@example.com</a>
					</p>
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
<!-- 					<form> -->
<!-- 						<input type="text" value="Enter Your Email" -->
<!-- 							onfocus="this.value = '';" -->
<!-- 							onblur="if (this.value == '') {this.value = 'Enter Your Email';}"> -->
<!-- 						<input type="submit" value="Subscribe"> -->
<!-- 					</form> -->
					<ul>
					<c:if test="${  empty LoginOK &&  empty LoginSuperOK}">
						<li class="grid"><a href="super">管理員登入</a></li>
					</c:if>
<!-- 						<li class="grid"><a href="test">測試會員顯示</a></li> -->
<!-- 						<li class="grid"><a href="addCarousel">測試輪播顯示</a></li> -->
<!-- 							<li class="grid"><a href="ck">測試</a></li> -->
						<li class="grid"><a href="webweb">測試聊天</a></li>
					</ul>
				</div>
				<div class="col-md-6 footer-right">
					<p>
						© 2020 Phone人苑. All Rights Reserved | Design by <a
							href="http://w3layouts.com/" target="_blank">W3layouts</a>
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--footer-end-->
	<script >
		
    function signOut() {
  	    var auth2 = gapi.auth2.getAuthInstance();
  	    auth2.signOut().then(function () {
  	      console.log('User signed out.');
  	    });
  	  }
	</script>
	
</body>
</html>