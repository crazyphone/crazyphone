<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>後台</title>
<style type="text/css">
th {
	background: #ff2f24;
}

table {
	background: #ffffff;
}

.button {
	background-color: #4CAF50;
	color: white;
	padding: 15px 10px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 90%;
	border-radius: 10px;
}

input[type=text] {
	outline: none;
	border-radius: 10px;
	margin-top: 10px;
}

.search {
	background-color: #4CAF50;
	/* border-radius: 10px 10px 10px 10px; */
	margin-left: -20px;
	font-size: 13px;
	padding: 3px
}
</style>
</head>
<body>
	 	<div class="col-md-3 "
		style="width: 15%; background-color: #363636; height: 600px; position:fixed">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="backIndex"
				style="text-align: center;">商城管理系統</a></li>
			<li><a href="addCarousel" style="color: #5d76cf">輪播牆管理</a></li>
			<li><a href="test" style="color: #5d76cf">會員管理</a></li>
			<li><a href="Brand" style="color: #5d76cf">廠商管理</a></li>
			<li><a href="Product" style="color: #5d76cf">商品管理</a></li>
			<li><a href="webwebBack" style="color:#5d76cf">客服</a></li>
	
        
        
	<div><a href="<c:url value='/' />"style="color:#5d76cf;box-sizing: border-box;position: absolute;bottom: 0;margin-bottom: 50px;" >回購物首頁
	</a></div>
      </ul>
    </div>
	<div align='center' style="position: absolute;
	left: 300px; right:50px">
		<h3>商品資料</h3>
		<a href='addProduct'>新增產品資料</a> &nbsp;&nbsp;&nbsp; <a
			href="<c:url value='/'/> ">回商品首頁</a>
		<hr>
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>
		<table border='2' cellpadding="3" cellspacing="1" >
			<tr>
				<th>產品編號</th>
				<th>產品名稱</th>
				<th>產品類型</th>
				<th>產品品牌</th>
				<th>產品資訊</th>
				<th>產品照片</th>
				<th>產品價錢</th>
				<th>上架時間</th>
				<th>產品庫存</th>
				<th>選項</th>
			</tr>
			<c:forEach var='product' items='${Products}'>
				<tr>
					<td style="text-align: center">${product.productID}</td>
					<td>${product.productName}</td>
					<td style="text-align: center">${product.typeBean.typeName}</td>
					<td style="text-align: center">${product.brandBean.brandName}</td>
					<td>${product.productIntro}</td>
					<td height='300'>
					
					<img style="display:block" width='100' height='100' src="<c:url value='/getproductimg/${product.productID}'/>" />
					<img style="display:block" width='100' height='100' src="<c:url value='/getproductimg2/${product.productID}'/>" />
					<img style="display:block" width='100' height='100' src="<c:url value='/getproductimg3/${product.productID}'/>" />
					</td>
					<td>${product.unitPrice}元</td>
					<td>${product.releasedDate}</td>
					<td>${product.stockQuantity}</td>
					<td>
					<a href="<c:url value=''/>"><button type="button" class="button">編輯</button></a>
					<a href="<c:url value='/peb/${product.productID}'/>"><button type="button" class="button">刪除</button></a>			
					<a href="<c:url value=''/>"><button type="button" class="button">查看詳細資訊</button></a> 
					<a href="<c:url value=''/>"><button type="button" class="button">編輯詳細資訊</button></a> 
					<a href="<c:url value=''/>"><button type="button" class="button">刪除詳細資料</button></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
	</div>
</body>
</html>