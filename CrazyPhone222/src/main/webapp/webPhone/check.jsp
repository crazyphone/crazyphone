<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%-- <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %> --%>
<%-- <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>購物車清單</title>
<meta charset="UTF-8">
<link rel='stylesheet' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' type='text/css' />
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type='text/css' />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.11.0.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-6 top-header-left">
					<div class="drop">
						<div class="box">	
						</div>
					</div>
				</div>
				<div class="col-md-6 top-header-left">
					<div class="cart box_1">
							<div class="total">
								<span class="simpleCart_total"></span></div>
								<img src="images/cart-1.png" alt="" />
						<a href='removeCart'>
						<br>
						取消購物</a>
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="logo">
		<a href='/'><h1>phone人苑</h1></a>
	</div>
	<div align='center'/>
	會員: <font color='red'>${LoginOK.memberName}</font>
<title>訂單明細資訊確認</title>
</head>
<c:set var="funcName" value="CHE" scope="session"/>
<div style="text-align:center">
<hr>
<h5>請確認下列訊息：</h5>
   <form action='orderToDB' method='POST'><!--//ProductController-->
         <input type='hidden' name='MemberID' value='${LoginOK.memberID}'>
     	 <input type='hidden' name='Receiver' value='${LoginOK.memberName}'>
   	     <input type='hidden' name='ReceiverPhone' value='${LoginOK.memberPhone}'> 
    	 <input type='hidden' name='ShipAddress' value='${LoginOK.memberAddress}'>
   	     <input type='hidden' name='page' value='check2'>
         <input type='submit' class="btn btn-primary" value='確定送出'>
<!--    		 <button><a href='orderList1'>確定送出</a></button>		 -->
   		 
<!--    		 ------------------------------------------------------------------ -->
   		 	<c:forEach items='${ShoppingCart.content}' var='entry'>
<!-- 		<tr> -->
<%-- 			<td align='center'>${entry.value.bean.productID}</td> --%>
<%-- 			<td align='center'>${entry.value.bean.productName}</td>							 --%>
<%-- 			<td align='center'>${entry.value.bean.unitPrice}</td>							 --%>
<%-- 			<td align='center'>${entry.value.quantity}</td>					 --%>
<%-- 			<td align='center'>${entry.value.bean.unitPrice*entry.value.quantity}</td>							 --%>
<!-- 		</tr>	 -->
<%-- 	<c:set var="sum" value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set> --%>
	
   		 
   		 <input type='hidden' name='productID' value='${entry.value.bean.productID}'>
   		 <input type='hidden' name='productName' value='${entry.value.bean.productName}'>
   		 <input type='hidden' name='unitPrice' value='${entry.value.bean.unitPrice}'>
   		 <input type='hidden' name='quantity' value='${entry.value.quantity}'>
   		 
   		 <input type='hidden' name='sum1' value='${sum+(entry.value.bean.unitPrice*entry.value.quantity)}'>
   		 </c:forEach>
<!--    		 ------------------------------------------------------------- -->
   </form>
   
   <!--<input type="hidden" name="finalDecision"  value="">-->
   <!--<input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">-->
   
   <ul class="pager">
	   <!--//ProductController-->
	   <li class="previous"><a href='showCartContent'>&larr; 上一頁</a></li>
   </ul>
	
<%-- <FORM style="margin: 0 auto; width:750px;" action="<c:url value='ProcessOrder.do' />" method="POST" > --%>
<form action="<c:url value='ProcessOrder.do' />" method="POST">
<table style="border:2px #cccccc solid;margin:0 auto; width:600;border-style: ridge;" cellpadding="10"  border='1'>
<tr><td>會員編號：${LoginOK.memberID}</td><td>
<tr><td>客戶姓名：${LoginOK.memberName}</td><td>
<tr><td>訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></td><td>
<tr><td>會員地址：${LoginOK.memberAddress}</td><td>
<tr><td> 出貨地址：<Input style="background:#ECFFCD;" size="60" type="text" id='ShippingAddress' 
                  name="ShippingAddress" value='${LoginOK.memberAddress}'>
                 <font color='red'>${errorMsg.ShippingAddress}</font></td><td>
<tr><td>會員電話：${LoginOK.memberPhone}</td><td>
</table>
</form>
<br>


<%-- <FORM style="margin:0 auto; width:1000;"action="<c:url value='ProcessOrder.do' />" method="POST" >   --%>

<!--    <TABLE border='1'> -->
<!--       <tr><td> -->
<!--       <TR > -->
<!--          <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	會員編號：${LoginOK.memberID} --%>
<!--          </TD> -->
<!--          <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	客戶姓名：${LoginOK.memberName} --%>
<!--          </TD> -->
<!--           <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/> --%>
<%-- 			<jsp:useBean id="date" class="java.util.Date"></jsp:useBean> --%>
<%-- 			<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>         --%>
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	會員地址：${LoginOK.memberAddress} --%>
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<!--                              出貨地址： -->
<!--                    <Input style="background:#ECFFCD;" size="60" type="text" id='ShippingAddress'  -->
<%--                    name="ShippingAddress" value='${LoginOK.memberAddress}'> --%>
<%--                    <font color='red'>${errorMsg.ShippingAddress}</font> --%>
<!--          </TD> -->
<!--        <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<%--          	會員電話：${LoginOK.memberPhone} --%>
<!--          </TD> -->
<!--        </TR> -->
<!--       <TR> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<!--                                    統一編號：<Input style="background:#ECFFCD;" size="10" type="text"  -->
<!--                       name="BNO" value=""> -->
<!--          </TD> -->
<!--       </TR> -->
<!--       <TR> -->
<!--          <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;"> -->
<!--                                    發票抬頭：<Input style="background:#ECFFCD;" size="50" type="text"  -->
<!--                       name="InvoiceTitle" value="" > -->
<!--          </TD> -->
<!--       </TR> -->
      <TR>
<!--          <TD colspan='3'> -->
  <Form>
     <table style="border:2px #cccccc solid;margin:0 auto; width:600;border-style: ridge;" cellpadding="10" action="<c:url value='ProcessOrder.do' />" method="POST" ;border='1'>
         
<!--    <TABLE border='1' style="background:#FFE7CD; border-color:rgb( 100, 100, 255); " > -->
      <tr>
			<th width='80'>手機編號</th>
			<th width='200'>手機名稱</th>							
			<th width='70'>單價</th>							
			<th width='70'>數量</th>	
			<th width='80'>金額</th>	
	  </tr>                                                    
       <c:set var="sum" value="0"></c:set>					
	<c:forEach items='${ShoppingCart.content}' var='entry'>
		<tr>
			<td align='left'>${entry.value.bean.productID}</td>
			<td align='left'>${entry.value.bean.productName}</td>							
			<td align='left'>${entry.value.bean.unitPrice}</td>							
			<td align='left'>${entry.value.quantity}</td>					
			<td align='left'>${entry.value.bean.unitPrice*entry.value.quantity}</td>							
		</tr>	
	<c:set var="sum" value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set>
	</c:forEach>
	<tr height='16'>
	<td colspan='4' align='right'>合計金額(含稅):</td>>
	<td align='left'>${sum}元</td>					
	</tr>
				     
<!--    <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()"> -->
</FORM>
</div>
</body>
</html>