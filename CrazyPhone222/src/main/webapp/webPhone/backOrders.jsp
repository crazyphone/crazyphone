<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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
border-radius: 10px;
margin-top: 10px;
}
.search{
background-color: #4CAF50;
/* border-radius: 10px 10px 10px 10px; */
/* margin-left: -20px;  */
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
<div align='center' style="position: absolute;
	left: 300px; right:50px">
<h3>訂單資料</h3>
<%-- <a href="<c:url value='/'/> " >回商品首頁</a> --%>
<a href="<c:url value='OOrders'/> " >顯示全部訂單</a>
<form method='POST' action="<c:url value='searchOOrders' />" >
	搜尋訂單人:<input type='text' name='search1' placeholder='Search...' class="icon"><br>
	搜尋訂單電話:<input type='text' name='phone1' placeholder='Search...' class="icon"><br>
	
	狀態:<select name="status1">
　	<option value="下單中">下單中</option>
　	<option value="運送中">運送中</option>
　	<option value="已完成">已完成</option>
	</select>
	
	<button type="submit" class="search">送出</button>
	
	
</form>

<hr>

		<c:choose>
			<c:when test="${empty Orders}">
	    		沒有搜尋到訂單資料<br>
			</c:when>
			<c:otherwise>

				<table border='2' cellpadding="3" cellspacing="1">
					<tr>
						<th width='30'>訂單編號</th>
						<th width='20'>訂單日期</th>
						<th width='50'>訂單人</th>
						<th width='40'>訂單電話</th>
						<th width='50'>送貨地址</th>
						<th width='50'>總價</th>
						<th width='50'>狀態</th>
						<th width='70'>功能</th>

					</tr>
					<c:forEach var='Order' items='${Orders}'>
					 <c:choose>
					
	                    <c:when	test="${Order.orderID== number1}"  >
	                    </c:when>
	                   <c:otherwise>
						<tr>
							<td style="text-align: center">${Order.orderID}</td>
							<td style="text-align: center">${Order.orderDate}</td>
							<td style="text-align: center">${Order.receiver}</td>
							<td style="text-align: center">${Order.receiverPhone}</td>
							<td style="text-align: center">${Order.shipAddress}</td>
							<td style="text-align: center">${Order.finalPrice}</td>
							<td style="text-align: center">${Order.goodsStatus}</td>
							<td style="text-align: center">
							<a href="<c:url value='/ororor1/${Order.ID}'/>"><button type="button" class="button" >下單中</button></a>
							<a href="<c:url value='/ororor2/${Order.ID}'/>"><button type="button" class="button" >運送中</button></a>
							<a href="<c:url value='/ororor3/${Order.ID}'/>"><button type="button" class="button" >已完成</button></a>
							</td>
<%--  								<c:choose>  --%>
<%-- 								<c:when test="${  seal.mapaa  !=  Order.memberID}">  --%>
<%-- 							    <td> <a href="<c:url value='/seal/${member.memberID}'/>"><button type="button" class="button" >封鎖</button></a>  --%>
<%-- 							</c:when>  --%>
<%--  								<c:when test="${ empty seal }">  --%>
<%-- 										<td> <a href="<c:url value='/seal/${member.memberID}'/>"><button type="button" class="button" >封鎖</button></a> --%>
<%--  								</c:when>  --%>
<%--  								<c:when test="${  seal.mapaa  ==  member.memberID }"> --%>
<%-- 								<td> <a href="<c:url value='/sealOn/${member.memberID}'/>"><button type="button" class="button" >解鎖</button></a>  --%>
<%-- 								</c:when> --%>
<%-- 								</c:choose> --%>
<%-- 										<a href="<c:url value='/debu/${member.memberID}'/>"><button --%>
<!-- 										type="button" class="button" class='deletelink'>刪除</button></a></td> -->
				
						</tr>
						<c:set var="number1" value="${Order.orderID}"/>
						 </c:otherwise>
						   </c:choose>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<hr>
</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type='text/javascript'>

// 	function sealoff() {
// 		setInterval(go, 5000);
// 	};
	
// 	function go() {
// 		$(".${member.memberID}").click()
// 	};

// 	$("#a1").click(function(){
// 		$("#a1").css("display","none");
// 		$("#a2").css("display","block");
// 	})
// 	$("#a2").click(function(){
// 		$("#a1").css("display","block");
// 		$("#a2").css("display","none");
// 	})
	
	
	
</script>
</body>
</html>