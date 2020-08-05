<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Phone人苑 | Compare</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<!--Custom-Theme-files-->
<!--theme-style-->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Luxury Watches Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
		 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!--start-menu-->
<script src="${pageContext.request.contextPath}/js/simpleCart.min.js">
	
</script>
<link href="${pageContext.request.contextPath}/css/memenu.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<!--dropdown-->
<script
	src="${pageContext.request.contextPath}/js/jquery.easydropdown.js"></script>
<style>
.tbC {
	width: 340px;
	height: 380px;
	border: 2px solid gray;
	border-radius: 30px;
	margin: 2px;
	float: left;
	position: absolute;
	left: 200px;
	top: -100px;
}

/* .tb2 { */
/* 	width: 250px; */
/* 	height: 400px; */
/* 	border: 2px solid; */
/* 	border-color: gray white; */
/* 	margin: 2px; */
/* 	float: left; */
/* 	position: relative; */
/* 	left: -100px; */
/* 	top: -100px; */
/* } */
td, th {
	border: 1px solid gray;
	text-align: center;
}

th {
	height: 50px;
	font-size: larger;
}

.botD {
	position: fixed;
	left: 200px;
	top: 800px;
	/* left:-600px; */
	/* top: 400px; */
}

.botD2 {
	position: fixed;
	left: 200px;
	top: 900px;
	/* position:absolute; */
	/* left:-600px; */
	/* top: 600px; */
}

.cri {
	position: absolute;
	right: 185px;
	top: 315px;
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
						<a href="checkout"> <!-- 							<div class="total"> --> <!-- 								<span class="simpleCart_total"></span> -->
							<!-- 							</div> --> <a href='showCartContent'> <img
								src="images/cart-1.png" alt="" /></a>
						</a>
						<p>
							<!-- 							<a href="javascript:;" class="simpleCart_empty">清空購物車</a> -->
						</p>
						<td width='130' align='center'>
							<!-- 						<a href='showCartContent'>購物車明細</a>&nbsp;&nbsp; --> <a
							href='removeCart'>移除購物車項目</a>
						</td>
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
			<span
				style="position: absolute; right: 0; margin-right: 250px; font-size: 22px"><a
				href="backIndex">後台</a></span>
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
								<li class="grid"><a href="lognout" onclick="signOut()">登出</a></li>
							</c:if>
							<c:if test="${! empty LoginOK }">
								<span style="margin: 50px">Hello <a href="up1">${LoginOK.memberName}</a></span>
								<img width='60' height='60'
									style="margin-left: -50px; margin-top: -20px"
									src="<c:url value='/getmemImg/${LoginOK.memberID}'/>" />
							</c:if>
							<c:if test="${! empty LoginSuperOK }">
								<span style="margin: 50px">Hello <a
									href="<c:url value='/'/>">${LoginSuperOK.supervisorName}</a>(管理人員)
								</span>
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

							<input type="text" name="searchP" value="Search"
								onfocus="this.value = '';"
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
					<li><a href="index.html">Home</a></li>
					<li class="active">車拚</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--typo-starts-->
	<div>
		<div class="pages" id="pages">
			<div class="container">
				<div class="typo-top heading">
					<h2 style="position: relative; top: -50px">評論</h2>
				</div>
				<div>
					<a
						href="<spring:url value='criticism/add?productID=3' />"
						class="btn btn-secondary cri"> <span
						class="glyphicon-info-sigh glyphicon cri"></span>撰寫評論
					</a>
				</div>
			</div>
		</div>
		<!-- 		<table class="tb1"> -->
		<!-- 			<tbody> -->
		<c:forEach var='criticism' items='${criticism}'>
			<div class="col-sm-6 col-md-3" style="width: 390px; height: 400px">
				<!-- 					<div class="col-sm-6 col-md-3" > -->
				<!-- 					<div class="col-sm-4 wthree-crd widgettable"> -->

				<div class="card">
					<div class="card-body">
						<div class="agileinfo-cdr">

							<table class="tbC">
								<!-- 								<thead> -->
								<!-- 									<tr> -->
								<%-- 										<th colspan="2">no.${criticism.criticismID}</th> --%>
								<!-- 									</tr> -->
								<!-- 								</thead> -->
								<tbody>
									<tr>
										<td rowspan="2"><img width='60' height='60'
											src="<c:url value='/getmemImg/${criticism.memberBean.memberID}'/>" /></td>
										<td>${criticism.memberBean.memberName}</td>
									</tr>
									<tr>
										<td>給 <span style="font-size: 20px">${criticism.score}
										</span>分
										</td>
									</tr>

									<tr>
										<td colspan="2" style="text-align: left">${criticism.textContent}</td>

									</tr>
									<tr>
										<td colspan="2"><img height='160'
											src="<c:url value='/getPicture2/${criticism.criticismID}' />" /></td>
									</tr>

									<tr>
										<c:if
											test="${LoginOK.memberID == criticism.memberBean.memberID}">
											<td><a
												href="<c:url value='/dCri/${criticism.criticismID}'/>">刪除</a>
											</td>
											<td><a
												href="<c:url value='/updateCriticism/${criticism.criticismID}'/>">編輯</a>
											</td>

										</c:if>

									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>

		<!-- 		</table> -->

		<!-- 			</tbody> -->
		<!-- 		</table> -->
	</div>
	<!-- 	<hr> -->
	<!--typo-ends-->
	<!--information-starts-->

	<!-- 	<div class="information" > -->
	<div class="botD">
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
	<div class="botD2">
		<hr>
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
	</div>
	<!--footer-end-->
</body>
</html>