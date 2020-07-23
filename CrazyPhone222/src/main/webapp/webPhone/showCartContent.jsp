<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>購物車清單</title>
<meta charset="UTF-8">
<link rel='stylesheet' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' type='text/css' />
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type='text/css' />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.11.0.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
						<div class="box">	
						</div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
							<div class="total">
								<span class="simpleCart_total"></span></div>
								<img src="images/cart-1.png" alt="" />
						<a href='removeCart'>
						<br>
						取消購物</a>
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="logo">
		<a href='index'><h1>phone人苑</h1></a>
	</div>
<div align='center'>
<!-- <th><label>顯示購物車</label></th> -->
	會員: <font color='red'>${LoginOK.memberName}</font>
		
		
<!-- 		<table border='1'> -->

<!-- 			<tr>			 -->
<!-- 				<td width='100' align='center'><a href='index'>回首頁</a></td> -->
<!-- 				<td width='200' align='center'><a href='products2'>回上一頁</a></td> -->
<!-- 				<td width='200' align='center'><a href='removeCart'>取消購物</a></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
		<hr>
			<h5>購物清單</h5>
		
			<table border='0'>
			   <c:choose>
			   	<c:when test='${ShoppingCart.itemNumber > 0 }'>
			   
<!-- 			   	<table cellpadding="10" border='1'> -->

			   			<tr>
			   			    <th width='180'>圖片</th>
							<th width='180'>手機編號</th>
							<th width='180'>手機名稱</th>							
							<th width='150'>單價</th>	
							<th width='10'></th>						
							<th width='50'>數量</th>	
							<th width='80'></th>
							<th width='150'>金額</th>	
						</tr>	
				   	<c:set var="sum" value="0"></c:set>					
			   		<c:forEach items='${ShoppingCart.content}' var='entry'>
						<tr>
							<td><img width='90' height='70'  src="<c:url value='/getPicture/${entry.value.bean.productID}' /> " />
							<td>${entry.value.bean.productID}</td>
							<td>${entry.value.bean.productName}</td>							
							<td>${entry.value.bean.unitPrice}</td>							
						
						    <td><form action='DelQtyToCart' method='POST'><!--//ProductController-->
                                <input type='hidden' name='phoneId'	value='${entry.value.bean.productID}'>
							    <input type='hidden' name='phoneName' value='${entry.value.bean.productName}'>
							    <input type='hidden' name='phonePrice' value='${entry.value.bean.unitPrice}'>
							    <input type='hidden' name='qty'  value='${entry.value.quantity}'> 
							    <input type='hidden' name='page' value='showCartContent'> 
							    <input type='submit' class="btn-xs btn-primary" value='-'>
						    </form></td>
						    <td>${entry.value.quantity}</td>
						    <td><form action='addQtyToCart' method='POST'><!--//ProductController-->
                                <input type='hidden' name='phoneId'	value='${entry.value.bean.productID}'>
							    <input type='hidden' name='phoneName' value='${entry.value.bean.productName}'>
							    <input type='hidden' name='phonePrice' value='${entry.value.bean.unitPrice}'>
							    <input type='hidden' name='qty' value='${entry.value.quantity}'> 
							    <input type='hidden' name='page' value='showCartContent'> 
							    <input type='submit' class="btn-xs btn-primary" value='+'>	    
						    </form></td>
                          	
                          	<td>${entry.value.bean.unitPrice*entry.value.quantity}</td>							
						</tr>	
					<c:set var="sum" value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set>
					</c:forEach>
					<tr height='16'>
						<td colspan='7' align='right'>合計金額(含稅):</td>>
						<td colspan='8' align='left'>${sum}元</td>
					</tr>
					
		<ul class="pager">
			<!--//ProductController-->
			<li class="previous"><a href='products'>&larr; 上一頁</a></li>
<!-- 			<li class="next"><a href="#">下一頁 &rarr;</a></li> -->
		</ul>
				<tr height='14'>
				<td colspan='7' align='right'>
				<button><a href='orderList'>結帳</a></button>		
				</td></tr>
		
			   	</c:when>
			   	
				<c:otherwise>
					<tr colspan='5'>
						<td>您尚未購買任何商品</td>
					</tr>
					<ul class="pager">
					<!--//ProductController-->
					<li class="previous"><a href='products'>&larr; 上一頁</a></li>
					</ul>	
				</c:otherwise>
			</c:choose>
			</table>	
		<hr>
	</div>
</body>
</html>