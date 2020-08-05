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
	background: #515873;
	color: white;
}

table {
	background: #ffffff;
}

.button {

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
<body style="background: #e1e1e8">
<div class="col-md-3 "
		style="width: 15%; background-color: #363636; height: 750px; position: fixed;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="backIndex"
				style="text-align: center;">商城管理系統</a></li>
			<li><a href="addCarousel" style="color: #5d76cf">輪播牆管理</a></li>
			<li><a href="test" style="color: #5d76cf">會員管理</a></li>
			<li><a href="Brand" style="color: #5d76cf">品牌管理</a></li>
			<li><a href="Product" style="color: #5d76cf">商品管理</a></li>
			<li><a href="OOrders" style="color: #5d76cf">訂單管理</a></li>
			<li><a href="webwebBack" style="color: #5d76cf">客服</a></li>
			<li><a href="statistic" style="color: #5d76cf">統計</a></li>


			<div>
				<a href="<c:url value='/' />"
					style="color: #5d76cf; box-sizing: border-box; position: absolute; bottom: 0; margin-bottom: 50px; padding-left: 50px; padding-bottom: 30px">回購物首頁
				</a>
			</div>
		</ul>
	</div>
	
	<div align='center'  style="position: absolute;
	left: 300px; right:50px" >
		<h3>品牌資料</h3>
		<a href='addBrand'>新增品牌資料</a> &nbsp;&nbsp;&nbsp; <a
			href="<c:url value='/'/> ">回商品首頁</a>
		<hr>
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>
		<table border='2' cellpadding="3" cellspacing="1">
			<tr>
				<th>品牌編號</th>
				<th>品牌名稱</th>
				<th width='350'>品牌資訊</th>
				<th>品牌國家</th>
				<th width='200'>品牌Logo</th>
				<th width='70'>選項</th>
			</tr>
			<c:forEach var='brand' items='${Brands}'>
				<tr>
					<td style="text-align: center">${brand.brandID}</td>
					<td>${brand.brandName}</td>
					<td>${brand.brandInfo}</td>
					<td>${brand.brandCountry}</td>
					<td><img width='200' height='100'src="<c:url value='/getBrandImg/${brand.brandID}'/>" /></td>
					<td>
				<a href="upBrand/${brand.brandID}"><button type="button" class="btn btn-primary button">編輯</button></a>
				<a href="<c:url value='/deb/${brand.brandID}'/>"><button type="button" class="btn btn-primary button" onclick="return delForm()">刪除</button></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
	</div>
	<script type="text/javascript">
	function delForm() {
		if (confirm("確定刪除嗎?")) {
			return true;
		}
		return false;
	}
	</script>
</body>
</html>