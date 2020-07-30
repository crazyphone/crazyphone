<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Phone人苑 | 購物車清單</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!--jQuery(necessary for Bootstrap's JavaScript plugins)-->
<script src="js/jquery-1.11.0.min.js"></script>
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

<style>
.tb1 {
	width: 1000px;
	/* 	height: 650px; */
	border: 2px solid;
	border-color: gray white;
	float: left;
	position: relative;
	left: 275px;
	top: 10px;
}

.tb2 {
	width: 250px;
	height: 650px;
	border: 2px solid;
	border-color: gray white;
	margin: 2px;
	float: left;
	position: relative;
	left: -100px;
	top: -100px;
}

th {
	border-bottom: 1px solid gray;
	text-align: center;
	height: 40px;
}

td {
	border-bottom: 1px solid gray;
	text-align: center;
	height: 100px;
}
</style>


</head>
<body>
	<!-- 標頭開始 -->
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left"></div>
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
							<li class="grid"><a href="products">商城</a></li>
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
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="products">回前頁</a></li>
					<li class="active">購物清單</li>
				</ol>
			</div>
		</div>
	</div>

	<div align='center'>
		<h2 style="position: relative; top: 0px; text-align: center">購物清單</h2>
		<!-- 以下為原始 -->
		<table class="tb1">
			<c:choose>
				<c:when test='${ShoppingCart.itemNumber > 0 }'>


					<tr>
						<th width='150'>圖片</th>
						<th width='100'>手機編號</th>
						<th width='150'>手機名稱</th>
						<th width='150'>單價</th>
						<th width='50'></th>
						<th width='50'>數量</th>
						<th width='50'></th>
						<th width='100'>金額</th>
						<th width='100'>&nbsp</th>
					</tr>
					<c:set var="sum" value="0"></c:set>
					<c:forEach items='${ShoppingCart.content}' var='entry'>
						<tr>
							<td><img width='90' height='70'
								src="<c:url value='/getPicture/${entry.value.bean.productID}' /> " />
							<td>${entry.value.bean.productID}</td>
							<td>${entry.value.bean.productName}</td>
							<td>${entry.value.bean.unitPrice}</td>

							<td><form action='DelQtyToCart' method='POST'>
									<!--//ProductController-->
									<input type='hidden' name='phoneId'
										value='${entry.value.bean.productID}'> <input
										type='hidden' name='phoneName'
										value='${entry.value.bean.productName}'> <input
										type='hidden' name='phonePrice'
										value='${entry.value.bean.unitPrice}'> <input
										type='hidden' name='qty' value='${entry.value.quantity}'>
									<input type='hidden' name='page' value='showCartContent'>
									<input type='submit' class="btn-xs btn-primary" value='-'>
								</form></td>
							<td>${entry.value.quantity}</td>
							<td><form action='addQtyToCart' method='POST'>
									<!--//ProductController-->
									<input type='hidden' name='phoneId'
										value='${entry.value.bean.productID}'> <input
										type='hidden' name='phoneName'
										value='${entry.value.bean.productName}'> <input
										type='hidden' name='phonePrice'
										value='${entry.value.bean.unitPrice}'> <input
										type='hidden' name='qty' value='${entry.value.quantity}'>
									<input type='hidden' name='page' value='showCartContent'>
									<input type='submit' class="btn-xs btn-primary" value='+'>
								</form></td>

							<td>${entry.value.bean.unitPrice*entry.value.quantity}</td>
							<!--H0725 -->
							<td>
								<form action='DelProductToCart' method='POST'>
									<input type='hidden' name='phoneId'
										value='${entry.value.bean.productID}'> <input
										type='hidden' name='page' value='showCartContent'> <input
										type='submit' class="btn btn-secondary" value='刪除'>
								</form>
							</td>
						</tr>

						<c:set var="sum"
							value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set>


					</c:forEach>

					<tr>
						<td>&nbsp</td>
						<td>&nbsp</td>
						<td>&nbsp</td>
						<td>&nbsp</td>
						<td colspan="3">合計金額(含稅):</td>
						<td>${sum}元</td>
						<td><a href='orderList' class="btn btn-primary">結帳 </a></td>
					</tr>

				</c:when>

				<c:otherwise>
					<tr colspan='5'>
						<td>您尚未購買任何商品</td>
					</tr>

				</c:otherwise>
			</c:choose>
		</table>

	</div>

</body>
</html>