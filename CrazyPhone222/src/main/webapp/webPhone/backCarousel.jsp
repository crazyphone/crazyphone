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
      </ul>
    </div>


<div align='center' >
<h3>輪播圖管理</h3>

<!-- ------------------------------------新增-------------------------------------- -->
<div>
	<button type="button"  class="btn btn-primary" id="add" onclick="showModal()">新增</button>
</div>


<div class="modal" tabindex="-1" role="dialog" id="111">
<form:form   method="post" modelAttribute="CarouselBean" enctype="multipart/form-data">
     <div class="modal-dialog" role="document"> 
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">新增輪播圖</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button> 
            </div>
            <div class="modal-body">
            
      	<span ><b >圖片:</b></span>
      	<form:input type="file"  path="CImage" id="CImage"  />
         <span ><b >超連結:</b></span><br>
         <form:input type="text"  path="CarouselUrl" id="CarouselUrl"   />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
                <button  type="submit" class="btn btn-primary">新增</button>
            </div>
            
       </div>
   </div>
   </form:form>
</div>
<!-- ------------------------------------------------------------------------------- -->
<hr>



				<table border='2' cellpadding="3" cellspacing="1">
					<tr>
						<th width='150'>編號</th>
						<th width='200'>圖片</th>
						<th width='200'>超連結</th>
						<th width='200'>修改時間</th>
						<th width='50'>功能</th>

					</tr>
					<c:forEach var='carousel' items='${carousels}'>
						<tr>
							<td style="text-align: center">${carousel.carouselID}</td>
							
							<td><img width='250' height='150'
								src="<c:url value='/getcarImg/${carousel.carouselID}'/>" /></td>
							
							<td style="text-align: center">${carousel.carouselUrl}</td>
							<td style="text-align: center">${carousel.createDate}</td>
							<td style="text-align: center"><a href="<c:url value='/deCar/${carousel.carouselID}'/>"><button
							type="button" class="button" class="btn btn-primary">刪除</button></a></td>
									
						</tr>
					</c:forEach>
				</table>

		<hr>
</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	
<script type='text/javascript'>


function showModal() {
    $('#111').modal('show'); 
}

	
	
</script>
</body>
</html>