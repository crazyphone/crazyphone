<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	border: 1px solid rgb(255, 232, 57);
	width: 400px;
	margin: auto;
}
</style>
<title>AddCriticism</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
</head>
<body>
	<section>
		<div class="container">
			<h1 style="text-align: center">撰寫評論</h1>
		</div>
	</section>
	<hr
		style="height: 1px; border: none; color: #333; background-color: #333;">
	<section class="container">
		<!--       三個地方要完全一樣 -->
		<form:form method='POST' modelAttribute="criticismBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-2" for='title'> -->
<!-- 						memberID </label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						<form:input id="memberID" path="memberID" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="form-group"> -->
<!-- 					<label class="control-label col-lg-2 col-lg-2" for='author'> -->
<!-- 						productID </label> -->
<!-- 					<div class="col-lg-10"> -->
<%-- 						<form:input id="productID" path="productID" type='text' --%>
<%-- 							class='form:input-large' /> --%>
<!-- 					</div> -->
<!-- 				</div> -->

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						score </label>
					<div class='col-lg-10'>



						<form:input id="score" path="score" type='text'
							class='form:input-large' />

					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						textContent </label>
					<div class='col-lg-10'>
						<form:input id="textContent" path="textContent" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2'
						for="addCriticismImage"> addCriticismImage </label>
					<div class='col-lg-10'>
						<form:input id="addCriticismImage" path="addCriticismImage"
							type='file' class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
							<input id="btnReset" type='reset' class='btn btn-primary'
							value="清除" />
					</div>
					
				</div>
<!-- 				<div> -->
<!-- 					<a href="single" >回商品頁</a> -->
<!-- 					</div> -->
						
			</fieldset>
		</form:form>
	</section>
</body>
</html>
