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
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
</head>
<body>
	<div class="modal">
		<form:form class="modal-content animate" method="post"
			modelAttribute="SpecBean1">
			<div class="container">
				<label for="os"><b>OS:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.osspace}</Font></small>
				<form:input type="text" path="OS" id="os"  value ="${SpecBean.oS}"/>
			</div>
			<div class="container">
				<label for="processor"><b>CPU:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.cpuspace}</Font></small>
				<form:input type="text" path="Processor" id="processor" />
			</div>
			<div class="container">
				<label for="displaySize"><b>螢幕大小:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.dsspace}</Font></small>
				<form:input type="text" path="DisplaySize" id="displaySize" />
			</div>
			<div class="container">
				<label for="displayResolution"><b>解析度:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.drspace}</Font></small>
				<form:input type="text" path="DisplayResolution" id="displayResolution" />
			</div>
			<div class="container">
				<label for="frontCamera"><b>前鏡頭:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.fcspace}</Font></small>
				<form:input type="text" path="FrontCamera" id="frontCamera" />
			</div>
			<div class="container">
				<label for="rearCamera"><b>後鏡頭:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.rcspace}</Font></small>
				<form:input type="text" path="RearCamera" id="rearCamera" />
			</div>
			<div class="container">
				<label for="ram"><b>RAM:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.ramspace}</Font></small>
				<form:input type="text" path="RAM" id="ram" />
			</div>
			<div class="container">
				<label for="storage"><b>儲存容量:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.ssspace}</Font></small>
				<form:input type="text" path="Storage" id="storage" />
			</div>
			<div class="container">
				<label for="batterycapacity"><b>電池容量:</b></label>&nbsp;<small><Font
					color='red' size="-3">${errorS.bsspace}</Font></small>
				<form:input type="text" path="BatteryCapacity" id="batterycapacity" />
			</div>
			<div class="container">
				<button type="submit" style="margin-top: 50px">送出</button>
				<input type="button" class="cancelbtn" value='一鍵輸入'> <a
					class="cancelbtn" href="<c:url value='/'/> ">回前頁</a>
			</div>
		</form:form>
	</div>
<script>
		$(function() {
			$(".cancelbtn").click(function() {
				$("#os").val("Android 4.4");
				$("#processor").val("MT6732M");
				$("#displaySize").val(" 4.5 inch");
				$("#displayResolution").val("245 ppi ");
				$("#frontCamera").val("500 萬畫素");
				$("#rearCamera").val("無");
				$("#ram").val("1 GB");
				$("#storage").val("8 GB");
				$("#batterycapacity").val("2000 mAh");
			})
		})
	</script>
</body>
</html>