<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  margin: 10% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
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

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}


.a{
	text-align:center;
	background-color:#f1f1f1;
	padding:20px;
	border-bottom:solid 1px black;
	font-size:150%;
	font-weight:800
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
.onekey {
	float: right;
	margin-top: 10px;
	padding: 9px;
	width: auto;
	border: none;
}
</style>
</head>
<body>

<div id="id03" class="modal">
 
  <form class="modal-content animate" action="<c:url value='updatePwd111' />" method="post"  >
 <div class="a">更改密碼</div>
    <div class="container">

      <label for="newPwd"><b>新的密碼</b></label>
      <input type="password"  name="newPwd" id="qwe" autocomplete="off">
	
	  <label for="newPwd2"><b>確認密碼</b></label>
      <input type="password"  name="newPwd2" id="ewq" autocomplete="off">
      
      
      <button type="submit"  id="buttonMail" >送出</button>
      
    <div class="container" style="background-color:#f1f1f1">
     <a href=<c:url value='/'/> style="text-decoration:none;"> 
    <button type="button" class="cancelbtn">回首頁</button>
    </a>
    <span><input type="button" class="onekey" id='demo' value='1'></span>
      
    </div>
    </div>
  </form>
</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script >
	$(function() {
		$("#demo").click(function() {
			$("#qwe").val("sa123456");
			$("#ewq").val("sa123456");
		})
	})
	</script>
</body>

</html>