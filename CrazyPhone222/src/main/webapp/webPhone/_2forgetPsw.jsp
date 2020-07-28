<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Microsoft JhengHei, Arial, Helvetica, sans-serif;
	background-image:
		url("https://images.unsplash.com/photo-1497864768494-78100d1ddf01?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}

/* Full-width input fields */
input[type=text], input[type=password] {
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
	font-family: Microsoft JhengHei;
	font-size: 15px;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #6A6AFF;
	font-family: Microsoft JhengHei;
	font-size: 15px;
}

/* Center the image and position the close button */
.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 10% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 25%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

.a {
	text-align: center;
	background-color: #f1f1f1;
	padding: 20px;
	border-bottom: solid 1px black;
	font-size: 150%;
	font-weight: 800
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>



	<div id="id02" class="modal">

		<form class="modal-content animate" action="<c:url value='forget' />"
			method="post">
			<div class="a">重製密碼</div>
			<div class="container">
				<div
					style="text-align: center; padding-top: 20px; padding-bottom: 20px">
					請輸入您的信箱以取得信件來修改您的密碼</div>
				<label for="mail"><b>信箱</b></label> <input type="text" name="mail">

				<button type="submit" id="buttonMail">寄送信件</button>
				<div>
					<a href=<c:url value='/'/> style="text-decoration: none;">
						<button type="button" class="cancelbtn">回首頁</button>
					</a>

				</div>
			</div>
		</form>
	</div>

</body>
</html>