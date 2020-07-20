<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
			
		</div>
	</section>
	<section class="container">
		<div class="row">
			<img height='150'
				src="<c:url value='/getPicture/${product.productID}'/>" />
			<div class="col-md-5">
				<h3>${product.productName}</h3>
				<p>${product.productIntro}</p>
				<p>單價:${product.unitPrice}元</p>

				<p>規格：</p>
				<!-- 				OS和RAM抓不到 -->
				<%-- 			<p>OS: ${product.specBean.oS}</p> --%>
				<p>processor: ${product.specBean.processor}</p>
				<p>displaySize: ${product.specBean.displaySize}</p>
				<p>displayResolution: ${product.specBean.displayResolution}</p>
				<p>frontCamera: ${product.specBean.frontCamera}</p>
				<p>rearCamera: ${product.specBean.rearCamera}</p>
				<%-- 			抓不到???	<p>rAM: ${product.specBean.rAM}</p> --%>
				<p>storage: ${product.specBean.storage}</p>
				<p>batteryCapacity: ${product.specBean.batteryCapacity}</p>
				
					<a href="<spring:url value='/products2' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					
						<form action='addToCart' method='POST'>
							<input type='hidden'  name='phoneId' value='${product.productID}'> 
							<input type='hidden'  name='phoneName' value='${product.productName}'>
							<input type='hidden'  name='phonePrice' value='${product.unitPrice}'>
							<input type='hidden'  name='qty' value=1>
							<input type='hidden'  name='page' value='products2'> 
							<input type='submit' class="btn btn-primary" value='加入購物車'>
					</form>
				<form action='addToPKCart' method='POST'>
							<input type='hidden'  name='productID' value='${product.productID}'> 
							<input type='hidden'  name='productName' value='${product.productName}'>
							<input type='hidden'  name='UnitPrice' value='${product.unitPrice}'>
							<input type='hidden'  name='qty' value=1>
							<input type='hidden'  name='page' value='products2'> 
							<input type='submit'  class="btn btn-primary" value='加入車拚'>
					</form>	
					
	
				<p>
				
<%-- 				<a href='criticism/${productID}'>${productID}</a><br> --%>
					<a
						href="<spring:url value='criticism?productID=${product.productID}' />"
						class="btn btn-primary"> <span
						class="glyphicon-info-sigh glyphicon"></span>看評論
					</a> <a
						href="<spring:url value='criticism/add?productID=${product.productID}' />"
						class="btn btn-primary"> <span
						class="glyphicon-info-sigh glyphicon"></span>撰寫評論
					</a> 
					
				</p>
			</div>
		</div>
	</section>
</body>
</html>
