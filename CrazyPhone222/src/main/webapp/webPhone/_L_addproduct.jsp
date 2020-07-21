<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
/* Full-width input fields */
input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

textarea[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
/* Set a style for all buttons */
button {
	background-color: #4860a8;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}
/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}
/* Center the image and position the close button */
.container {
	padding: 16px;
}
/* The Modal (background) */
.modal {
	/*   display: none; */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	/*   background-color: rgb(0,0,0);  */
	/*   background-color: rgba(0,0,0,0.4);  */
	padding-top: 60px;
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	border: 1px solid #888;
	width: 40%;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
</head>
<body>
	<div class="modal">
		<form:form class="modal-content animate" method="post"
			modelAttribute="ProductBean" enctype="multipart/form-data">
			<div class="container">
				<label for="Productname"><b>商品名稱:</b></label> &nbsp;<small><Font
					color='red' size="-3">${Errorp.namespace}</Font></small>
				<form:input type="text" path="ProductName" id="Productname" />
			</div>
			<div class="container">
				<div>&nbsp;<small><Font color='red' size="-3">${Errorp.nochoosep}</Font></small></div>
				<label for="brandBean"><b>商品品牌:</b></label>
				<form:select path="brandBean.BrandID" id="brand">
					<form:option value="-1" label="請挑選品牌" />
					<form:options items="${BrandMap}" />
				</form:select>
			</div>
			<div class="container">
				<div>&nbsp;<small><Font color='red' size="-3">${Errorp.nochooset}</Font></small></div>
				<label for="type"><b>商品類型:</b></label>
				<form:select path="typeBean.TypeID" id="type">
					<form:option value="-1" label="請挑選類型"  />
					<form:options items="${TypeMap}" />
				</form:select>
			</div>
			<div class="container">
				<label for="Productintro"><b>廠商資訊:</b></label>
				&nbsp;<small><Font color='red' size="-3">${Errorp.introspace}</Font></small>
				<div>
					<form:textarea style="resize:none" type="text" path="ProductIntro"
						id="Productintro" />
				</div>
			</div>
			<div class="container">
				<label for="Unitprice"><b>商品價錢:</b></label> 
				&nbsp;<small><Font color='red' size="-3">${Errorp.pricespace}</Font></small>
				<form:input type="text" path="UnitPrice" id="Unitprice" />
			</div>
			<div class="container">
				<div>&nbsp;<small><Font color='red' size="-3">${Errorp.sqspace}</Font></small></div>
				<label for="Stockquantity"><b>商品庫存:</b></label> 
				<form:input type="number" path="StockQuantity" id="Stockquantity"
					min="0" />
			</div>
			<div class="container">
				<div>
					<small><Font color='red' size="-3">${Errorp.pimgspace}</Font></small>
				</div>
				<label for="pImage"><b>商品照片:</b></label>
				<form:input type="file" path="PImage" accept="image/*" />
			</div>
			<div class="container">
				<div>
					<small><Font color='red' size="-3">${Errorp.pimgspace2}</Font></small>
				</div>
				<label for="pImage2"><b>商品照片2:</b></label>
				<form:input type="file" path="PImage2" accept="image/*" />
			</div>
			<div class="container">
				<div>
					<small><Font color='red' size="-3">${Errorp.pimgspace3}</Font></small>
				</div>
				<label for="pImage3"><b>商品照片3:</b></label>
				<form:input type="file" path="PImage3" accept="image/*" />
			</div>
			<div class="container">
				<button type="submit" style="margin-top: 50px">下一步</button>
				<input type="button" class="cancelbtn" value='一鍵輸入'>
			</div>
		</form:form>
	</div>
	<script>
		$(function() {
			$(".cancelbtn").click(function() {
				$("#Productname").val("Liquid Z410");
				$("#brand").val(5);
				$("#type").val(1);
				$("#Productintro").val("畫面銳利、速度一流");
				$("#Unitprice").val("9000");
				$("#Stockquantity").val("50");
			})
		})
	</script>
</body>
</html>