<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products2</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>產品清單</h1>
				
				<td colspan='2' width='260' align='center'>${ShoppingCart.creteTime}</td>
				<td colspan='2' width='260' align='center'>${pageContext.request.contextPath}</td>
				<td width='130' align='center'><a href='showCartContent'>購物車明細</a>&nbsp;&nbsp;<a href='removeCart'>移除購物車項目</a></td>
			    <td width='130' align='center'><a href='showPKCartContent'>車拚</a>&nbsp;&nbsp;<a href='removePKCart'>結束車拚</a></td>
			</div>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var='product' items='${product}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<img width='100' height='200'
							src="<c:url value='/getPicture/${product.productID}' />" />
						<div class="caption">
							<p>
								<b style='font-size: 16px;'>${product.productName}</b>
							</p>
							<p>${product.productIntro}</p>
							<p>單價:${product.unitPrice}元</p>
<%-- 							<p>${product.companyBean.name}</p> --%>
							
								<a href="<spring:url value='product?productID=${product.productID}' />"
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料
								</a>
								<p>
								<form action='addToCart' method='POST'>
									<input type='hidden'  name='phoneId' value='${product.productID}'> 
									<input type='hidden'  name='phoneName' value='${product.productName}'>
									<input type='hidden'  name='phonePrice' value='${product.unitPrice}'>
									<input type='hidden'  name='qty' value='1'>
									<input type='hidden'  name='page' value='products2'> 
							<input type='submit' class="btn btn-primary" value='加入購物車'>  		
								</form>
								<form action='addToPKCart' method='POST'>
								<input type='hidden' name='productID' value='${product.productID}'> 
								<input type='hidden' name='productName' value='${product.productName}'> 
								<input type='hidden' name='UnitPrice' value='${product.unitPrice}'>
								<input type='hidden' name='qty' value=1> 
								<input type='hidden' name='page' value='products2'> 
								<input type='submit' class="btn btn-primary" value='加入車拚'>
						     	</form>
								</P>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<hr>
	
</body>
</html>
