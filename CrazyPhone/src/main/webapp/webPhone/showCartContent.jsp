<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' type='text/css' />
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type='text/css' />
<title>購物車清單</title>
</head>
<body>
<div align='center'>
	<h2>顯示購物車</h2>
	
會員: <font color='red'>${LoginOK.memberName}</font>
	<hr>	
		<table border='1'>
			<tr>
				<td width='100' align='center'><a href='index'>回首頁</a></td>
				<td width='200' align='center'><a href='products2'>回上一頁</a></td>
				<td width='200' align='center'><a href='removeCart'>取消購物</a></td>
				<td align='center'><a href='orderList'>結帳</a></td>
			</tr>
			<tr>
<%-- 				<td colspan='2' width='200' align='center'>${ShoppingCart.creteTime}</td> --%>
<%-- 				<td colspan='2' width='200' align='center'>${requestScope.ShoppingCart.creteTime}</td> --%>
<%-- 				<td colspan='2' width='200' align='center'>${sessionScope.ShoppingCart.creteTime}</td> --%>
			</tr>
		</table>
		<hr>
			<table border='1'>
			   <c:choose>
			   	<c:when test='${ShoppingCart.itemNumber > 0 }'>
			   			<tr>
							<th width='100'>手機編號</th>
							<th width='200'>手機名稱</th>							
							<th width='60'>單價</th>							
							<th width='60'>數量</th>	
							<th width='60'>金額</th>				
						</tr>	
				   	<c:set var="sum" value="0"></c:set>					
			   		<c:forEach items='${ShoppingCart.content}' var='entry'>
						<tr>
							<td align='center'>${entry.value.bean.productID}</td>
							<td align='center'>${entry.value.bean.productName}</td>							
							<td align='center'>${entry.value.bean.unitPrice}</td>							
							<td align='center'>${entry.value.quantity}</td>					
											<td align='center'>${entry.value.bean.unitPrice*entry.value.quantity}</td>					
						</tr>	
					<c:set var="sum" value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set>
					</c:forEach>
					<tr height='16'>
						<td colspan='4' align='right'>合計金額(含稅):</td>>
						<td align='right'>${sum}元</td>
						
					</tr>
			
			   	</c:when>
				<c:otherwise>
					<tr colspan='5'>
						<td>您尚未購買任何商品</td>
					</tr>	
				</c:otherwise>
			</c:choose>
			</table>	
		<hr>
	</div>
</body>
</html>