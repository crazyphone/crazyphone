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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台</title>
<style type="text/css">
.body1 {
font-family: Arial, Helvetica, sans-serif;
background-image: url("http://pic.netbian.com/uploads/allimg/190324/170928-1553418568e1ef.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed; 
            background-position: center;
            background-size: cover;
 }
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

.ml16 {
  color: #402d2d;
  padding: 40px 0;
  font-weight: bold;
  font-size: 2em;
  text-transform: uppercase;
  letter-spacing: 0.5em;
  overflow: hidden;
  font-family: KaiTi;
}

.ml16 .letter {
  display: inline-block;
  line-height: 1em;
}
</style>
</head>
<body class="body1" >
  
  
 	<div class="col-md-3 "
		style="width: 15%; background-color: #363636; height: 680px; position:fixed">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="backIndex"
				style="text-align: center;">商城管理系統</a></li>
			<li><a href="addCarousel" style="color: #5d76cf">輪播牆管理</a></li>
			<li><a href="test" style="color: #5d76cf">會員管理</a></li>
			<li><a href="Brand" style="color: #5d76cf">品牌管理</a></li>
			<li><a href="Product" style="color: #5d76cf">商品管理</a></li>
			<li><a href="OOrders" style="color: #5d76cf">訂單管理</a></li>
			<li><a href="webwebBack" style="color:#5d76cf">客服</a></li>
	
        
        
	<div><a href="<c:url value='/' />"style="color:#5d76cf;box-sizing: border-box;position: absolute;bottom: 0;margin-bottom: 50px;" >回購物首頁
	</a></div>
      </ul>
    </div>


<div align='center' style="position: absolute;
	left: 300px; right:50px" >
<h3 style="font-weight: bold;">後台首頁</h3>


<hr>

		<hr>
</div>

	<div style="position: absolute; left: 300px; right: 50px">
	<h4 class="ml16" style="margin-top: 250px;margin-left: 50px;font-weight: bold">您好關禮源，歡迎進入Phone人苑後台系統</h4>
		<!-- 		<h1 class="ml9" style="margin-top: 250px;margin-left: 50px;font-weight:800"> -->
<!-- 			<span class="text-wrapper">  -->
<!-- 			<span class="letters" style="font-family:_GB2312 FangSong_GB2312">您好關禮源，歡迎進入Phone人苑後台系統</span> -->
<!-- 			</span> -->
<!-- 		</h1> -->
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
	
<script type="text/javascript">
var textWrapper = document.querySelector('.ml16');
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline({loop: false})
  .add({
    targets: '.ml16 .letter',
    translateY: [-100,0],
    easing: "easeOutExpo",
    duration: 1400,
    delay: (el, i) => 30 * i
  })
</script>
</body>
</html>