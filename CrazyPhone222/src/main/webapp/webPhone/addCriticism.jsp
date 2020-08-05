
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 加兩行taglib -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- for bootstrap送出/清除按鈕用的四個連結 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<!-- 加_開始 -->
<c:set var="baseurl" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript">
	
<%--to record pronect Name (contextPath=/jwxt)--%>
	contextPath = "${pageContext.request.contextPath}";
</script>
<link rel="stylesheet" href="${baseurl}/css/font.css">
<link rel="stylesheet" href="${baseurl}/css/xadmin.css">
<script type="text/javascript" src="${baseurl}/js/jquery.min.js"></script>
<script type="text/javascript" src="${baseurl}/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript" src="${baseurl}/js/xadmin.js"></script>
<!-- 從index.jsp複製58-62行 -->
<script src="js/jquery.easydropdown.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
 <meta name="google-signin-client_id" 
	content='110794926966-tvl8m24boaqav34ifoh4fe3fh3egsusg.apps.googleusercontent.com'> 
<!--     加_結束 -->
<title>Luxury Watches A Ecommerce Category Flat Bootstarp
	Resposive Website Template | Contact :: w3layouts</title>
<link href="${baseurl}/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="${baseurl}/js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="${baseurl}/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Phone人苑 Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!--start-menu-->
<script src="${baseurl}/js/simpleCart.min.js">
	
</script>
<link href="${baseurl}/css/memenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="${baseurl}/js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<!--dropdown-->
<script src="${baseurl}/js/jquery.easydropdown.js"></script>

<style>
.container2 {
	padding: 16px;
	background-color: #fefefe;
	margin: auto;
	border: 2px solid #888;
	width: 60%;
}

input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4860a8;
	color: white;
	padding: 10px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
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
					</div>
					-->
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
						<a href="checkout">
<!-- 							<div class="total"> -->
<!-- 								<span class="simpleCart_total"></span> -->
<!-- 							</div> -->
							<a href='showCartContent'> <img src="images/cart-1.png" alt="" /></a>
						</a>
						<p>
<!-- 							<a href="javascript:;" class="simpleCart_empty">清空購物車</a> -->
						</p>
						<td width='130' align='center'>
<!-- 						<a href='showCartContent'>購物車明細</a>&nbsp;&nbsp; -->
						<a	href='removeCart'>移除購物車項目</a></td>
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
	<!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="<spring:url value='single?productID=${productID}' />"  >回前頁</a></li>
<%-- 					<li><a href="<spring:url value='single?productID=${productID}' />" class="mask" >回前頁</a></li> --%>
					<li class="active">撰寫評論</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--contact-start-->
	<div class="contact">
		<div class="container">
			<div class="contact-top heading">
				<h2 style="position: relative; top: -50px">撰寫評論</h2>
			</div>
			<div class="contact-text">

				<div class="container2" style="position: relative; top: -50px">
					<%-- 						<form action="<c:url value='contact' />" method="post"> --%>
					<form:form method='POST' modelAttribute="criticismBean"
						enctype="multipart/form-data">
						<c:if test="${! empty LoginOK }">
							<img width='60' height='60'
								style="margin:5px"
								src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" />
							<span style="margin: 5px"> <a href="up1">${LoginOK.memberName}</a>的評論
							
							</span>

						</c:if>
						<div style="margin-top:10px">
							<label for="giveScore" ><b>給分</b></label>
<!-- 						</div> -->
<!-- 						<div class='col-lg-10'> -->
							<form:radiobutton path="score" value="1" label="1" />
							<form:radiobutton path="score" value="2" label="2" />
							<form:radiobutton path="score" value="3" label="3" />
							<form:radiobutton path="score" value="4" label="4" />
							<form:radiobutton path="score" value="5" label="5" />
						</div>

						<div style="margin-top:5px">
							<label for="criText"><b>評論</b></label>
						</div>
						<!-- 						<input type="text" placeholder="信箱" name="mail"> -->
						<form:input id="textContent" path="textContent" type='text'
							class='form:input-large' />
						<label for="addCriticismImage" style="margin-top:5px"><b>加照片</b></label>
						<!-- 						<input type="text" placeholder="標題" name="title"> -->
						<form:input id="addCriticismImage" path="addCriticismImage"
							type='file' class='form:input-large' />
						<!-- 							<div style="font-weight: 800">訊息</div> -->
						<!-- 						<textarea rows="9" cols="88" placeholder="輸入您的訊息" name="message"></textarea> -->
						<div style="margin-top:5px">
							<input type='hidden' name='memberId' value='${LoginOK.memberID}'>
						
<!-- 							<input id="btnAdd" type='submit'  value="送出" class="btn btn-outline-dark"/> <input -->
<!-- 								id="btnReset" type='reset' value="清除" class="btn btn-outline-dark"/> -->
						<button id="btnAdd" type="submit" class="btn btn-outline-secondary" >送出</button>
						<button id="btnAdd" type="reset" class="btn btn-outline-secondary" style="align:right">清除</button>
						</div>

					</form:form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--contact-end-->
	<!--map-start-->
	<!-- 	<div class="map"> -->
	<!-- 		<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe> -->

	<!-- 		<iframe -->
	<!-- 			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d225.93837800922856!2d121.54236744924873!3d25.033597317002624!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abd4825ecdf1%3A0xa9479a36fc6b99d0!2sDigital%20Education%20Institute%2C%20III!5e0!3m2!1szh-TW!2stw!4v1592843106856!5m2!1szh-TW!2stw" -->
	<!-- 			style="border: 0;"></iframe> -->
	<!-- 		<!-- width="600" height="450" frameborder="0"  allowfullscreen="" aria-hidden="false" tabindex="0" -->
	
	<!-- 	</div> -->
	<!--map-end-->
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
					<form>
						<input type="text" value="Enter Your Email"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Enter Your Email';}">
						<input type="submit" value="Subscribe">
					</form>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script>
		// 	$("#bbb").onclick(function(){
		// 		Swal.fire({
		// 			  icon: 'success',
		// 			  title: '已寄送信件，稍後會有專人與您聯繫!',
		// 			  showConfirmButton: false,
		// 			  timer: 1500
		// 			})
		// 	})

		window.onload = function() {
			if ('${msg}' == "ok") {
				Swal.fire({
					icon : 'success',
					title : '已寄送信件，稍後會有專人與您聯繫!',
					showConfirmButton : false,
					timer : 3000
				});
			}
		}
	</script>
</body>
</html>