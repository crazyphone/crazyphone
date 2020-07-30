<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Phone人苑 | 訂單確認</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<jsp:useBean id="today" class="java.util.Date" scope="session" />
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
	width: 750px;
	/* 	height: 650px; */
	border: 2px solid;
	border-color: gray white;
	float: left;
	position: relative;
	left: 400px;
	/* 	top: 10px; */
}

.tb2 {
	width: 750px;
	/* 	height: 650px; */
	border: 2px solid;
	border-color: gray white;
	float: left;
	position: absolute;
	left: 400px;
	top: 500px;
	text-align: center;
}

th, td {
	border-bottom: 1px solid gray;
	height: 40px;
}

th {
	text-align: center;
}

.tac {
	text-align: center;
}

.sub {
	position: absolute;
	right: 400px;
	top: 320px;
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
					<li><a href="showCartContent">回前頁</a></li>
					<li class="active">訂單確認</li>
				</ol>
			</div>
		</div>
	</div>

	<c:set var="funcName" value="CHE" scope="session" />
	<div>
		<!-- <div style="text-align:center"> -->
		<hr>
		<h4 align="center">請確認下列訊息：</h4>
		<form action='orderToDB' method='POST' class='sub'>
			<!--//ProductController-->
			<input type='hidden' name='MemberID' value='${LoginOK.memberID}'>
			<input type='hidden' name='Receiver' value='${LoginOK.memberName}'>
			<input type='hidden' name='ReceiverPhone'
				value='${LoginOK.memberPhone}'> <input type='hidden'
				name='ShipAddress' value='${LoginOK.memberAddress}'> <input
				type='hidden' name='page' value='check2'> <input
				type='submit' class="btn btn-primary" value='確定送出'>
			<!--    		 <button><a href='orderList1'>確定送出</a></button>		 -->
			<!--    		 ------------------------------------------------------------------ -->
			<c:set var="sum" value="0"></c:set>
			<c:forEach items='${ShoppingCart.content}' var='entry'>

				<input type='hidden' name='productID'
					value='${entry.value.bean.productID}'>
				<input type='hidden' name='productName'
					value='${entry.value.bean.productName}'>
				<input type='hidden' name='unitPrice'
					value='${entry.value.bean.unitPrice}'>
				<input type='hidden' name='quantity' value='${entry.value.quantity}'>
				<c:set var="sum"
					value='${sum+(entry.value.bean.unitPrice*entry.value.quantity)}'></c:set>

			</c:forEach>
			<!--    		 paypal參數 -->
			<input type="hidden" name="product" value="OrderNumber" /> <input
				type="hidden" name="subtotal" value="${sum} " /> <input
				type="hidden" name="shipping" value="0" /> <input type="hidden"
				name="tax" value="0" /> <input type="hidden" name="total"
				value="${sum}" />
			<!--    		 ------------------------------------------------------------- -->
		</form>

		<br>
	</div>
	<div>
		<%-- <FORM style="margin: 0 auto; width:750px;" action="<c:url value='ProcessOrder.do' />" method="POST" > --%>
		<form action="<c:url value='ProcessOrder.do' />" method="POST">
			<table class="tb1">
				<!-- <table style="border:2px #cccccc solid;margin:0 auto; width:600;border-style: ridge;" cellpadding="10"  border='1'> -->
				<tr>
					<td width=100px><b>會員編號：</b></td>
					<td width=200px>${LoginOK.memberID}</td>
					<td width=100px><b>訂單日期：</b></td>
					<td width=200px><fmt:formatDate value="${today}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td><b>客戶姓名：</b></td>
					<td>${LoginOK.memberName}</td>
					<td><b>會員電話：</b></td>
					<td>${LoginOK.memberPhone}</td>
				</tr>
				<tr>
					<td><b>出貨地址：</b></td>
					<td colspan="3"><Input style="background: #ECFFCD;" size="60"
						type="text" id='ShippingAddress' name="ShippingAddress"
						value='${LoginOK.memberAddress}'> <font color='red'>${errorMsg.ShippingAddress}</font></td>
				</tr>
			</table>
		</form>
	</div>
	<!--          <TD colspan='3'> -->
	<div>
		<Form>
			<table class="tb2" action="<c:url value='ProcessOrder.do' />"
				method="POST">
				<%--      <table style="border:2px #cccccc solid;margin:0 auto; width:600;border-style: ridge;" cellpadding="10" action="<c:url value='ProcessOrder.do' />" method="POST" ;border='1'> --%>
				<!--    <TABLE border='1' style="background:#FFE7CD; border-color:rgb( 100, 100, 255); " > -->
				<tr>
					<th width='100'>手機編號</th>
					<th width='150'>手機名稱</th>
					<th width='100'>單價</th>
					<th width='50'>數量</th>
					<th width='200'>金額</th>
				</tr>
				<c:set var="sum" value="0"></c:set>
				<c:forEach items='${ShoppingCart.content}' var='entry'>
					<tr>
						<td class='tac'>${entry.value.bean.productID}</td>
						<td class='tac'>${entry.value.bean.productName}</td>
						<td class='tac'>${entry.value.bean.unitPrice}</td>
						<td class='tac'>${entry.value.quantity}</td>
						<td class='tac'>${entry.value.bean.unitPrice*entry.value.quantity}</td>
					</tr>
					<c:set var="sum"
						value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set>
				</c:forEach>
				<tr>
					<td colspan='4' align='right'>合計金額(含稅):</td>
					<td class='tac'>${sum}元</td>
				</tr>

			</table>
			<!--    <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()"> -->
		</FORM>
	</div>


</body>
</html>