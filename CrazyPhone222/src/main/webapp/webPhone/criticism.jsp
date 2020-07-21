<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Criticisms</title>
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>評論</h1>
			</div>

			<a href="single" class="mask" >回商品頁</a>

		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<div class="row">
			<c:forEach var='criticism' items='${criticism}'>
			<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<img width='100' height='200'
							src="<c:url value='/getPicture2/${criticism.criticismID}' />" />
				<div class="caption">
					<p>
						<b style='font-size: 16px;'>${criticism.criticismID}</b>
					</p>
					
<%-- 					<p>product ${criticism.productID}</p> --%>
<%-- 					<p>member ${criticism.memberID}</p> --%>
					<p>給${criticism.score}分</p>
					<p>${criticism.textContent}</p>
					<p>${criticism.createDate}</p>
					<p>
						<a
							href="<spring:url value='criticism?id=${criticism.criticismID}' />"
							class="btn btn-primary"> <span
							class="glyphicon-info-sigh glyphicon"></span>
						</a>
					</p>
				</div>
				
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<hr>

</body>
</html>
