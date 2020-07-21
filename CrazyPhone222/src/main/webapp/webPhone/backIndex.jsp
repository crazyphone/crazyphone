<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>後台</title>
<style type="text/css">
th{
background: #ff2f24;
}
table{
background: #ffffff;
}
.button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 0px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 90%;
  border-radius: 10px;
}
input[type=text]{
outline: none;
border-radius: 5px;
margin-top: 10px;
}
.search{
background-color: #4CAF50;
/* border-radius: 10px 10px 10px 10px; */
margin-left: -20px; 
font-size: 13px;
padding: 3px
}

/* .menu {width:100px; background:#0099FF; height:210px; font-size:14px; font-family: "微軟雅黑";}   */
/* .menu ul {padding:0px; list-style-type:none;}   */
/* .menu ul li {width:100px; height:35px; line-height:35px; text-align:center;}   */
/* .menu ul li a {text-decoration:none; color:#fff; display:block;}   */
/* .menu ul li a:hover {background:#fff; color:#000;}   */
/* .menu ul li a:active {background:#fff; color:#000;}   */
/* .menu ul li a:focus {background:#fff; color:#000;}   */


</style>
</head>
<body style="background: #e1e1e8">
  
  
   <div class="col-md-3 "  style="width: 15% ; background-color:#363636 ;height: 600px">
      <ul class="nav nav-pills nav-stacked">
        <li class="active" ><a href="backIndex" style="text-align:center;">商城管理系統</a></li>
        <li><a href="addCarousel" style="color:#5d76cf">輪播牆管理</a></li>
        <li><a href="test" style="color:#5d76cf">會員管理</a></li>
        <li><a href="Brand" style="color: #5d76cf">廠商管理</a></li>
		<li><a href="Product" style="color: #5d76cf">商品管理</a></li>
        <li><a href="webwebBack" style="color:#5d76cf">客服</a></li>
        
        
        
<div><a href="<c:url value='/' />"style="color:#5d76cf;box-sizing: border-box;position: absolute;bottom: 0;margin-bottom: 50px;" >回購物首頁</a></div>
      </ul>
    </div>


<div align='center' >
<h3>後台首頁</h3>


<hr>



				

		<hr>
</div>
	
	

</body>
</html>