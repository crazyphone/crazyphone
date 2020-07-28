<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

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

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.container {
	padding: 16px;
}

.modal {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	border: 1px solid #888;
	width: 40%;
}
</style>
</head>
<body>
	<div class="modal">
		<form:form class="modal-content animate" method="post"
			modelAttribute="BrandBean" enctype="multipart/form-data">
			<div class="container">
				<label for="Brandname"><b>廠商名稱:</b></label>&nbsp;<small><Font
					color='red' size="-3">${Errorb.namespace}</Font></small>
				<form:input type="text" path="BrandName" id="Brandname" />
			</div>
			<div class="container">
				<label for="Brandinfo"><b>廠商資訊:</b></label>&nbsp;<small><Font
					color='red' size="-3">${Errorb.infospace}</Font></small>
				<div>
					<form:textarea style="resize:none" type="text" path="BrandInfo"
						id="Brandinfo" />
				</div>
			</div>
			<div class="container">
				<label for="Brandcountry"><b>廠商地址:</b></label>&nbsp;<small><Font
					color='red' size="-3">${Errorb.countryspace}</Font></small>
				<form:input type="text" path="BrandCountry" id="Brandcountry" />
			</div>
			<div class="container">
				<div>
					<small><Font color='red' size="-3">${Errorb.imgspace}</Font></small>
				</div>
				<label for="BImage"><b>廠商Logo:</b></label>
				<form:input type="file" path="BImage" accept="image/*" id="bchaimg"/>
			</div>
			<img id="bchimg" src="" />
			<div class="container">
				<button type="submit" style="margin-top: 50px">送出</button>
				<input type="button" class="cancelbtn" value='一鍵輸入'> <a
					class="cancelbtn" href="<c:url value='/'/> ">回前頁</a>
			</div>
		</form:form>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			$(".cancelbtn").click(function() {
				$("#Brandname").val("acer");
				$("#Brandinfo").val("宏碁（英語譯名暨品牌名稱：acer）是源自臺灣的跨國科技公司，成立於1976年");
				$("#Brandcountry").val("台灣");
			})
		})
		$("#bchaimg").change(function() {
			readURL(this);
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#bchimg").attr('src', e.target.result);
					$("#bchimg").css('width', '250px').css('height', '100px')
				}
				reader.readAsDataURL(input.files[0]);
				console.log()
			}
		}
	</script>
</body>
</html>