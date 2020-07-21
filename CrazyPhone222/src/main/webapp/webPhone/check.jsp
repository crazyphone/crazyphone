<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script type="text/javascript">

// function cancelOrder() {
// 	if (confirm("確定取消此份訂單 ? ") ) {
// 		// 接收此資料的Servlet會使用 finalDecision 參數的值
// 		document.forms[0].finalDecision.value = "CANCEL";
// 		document.forms[0].action="<c:url value='ProcessOrder.do' />";
// 		document.forms[0].method="POST";
// 		document.forms[0].submit();
// 		return;
// 	} else {
// 		return;
// 	}
// }

// function reconfirmOrder() {
// 	var sa = document.getElementById('ShippingAddress').value;
// 	if  (sa === "") {
// 		window.alert ('出貨地址不能是空白');
// 		return ; 
// 	}
// 	if (confirm("確定送出此份訂單 ? ") ) {
// 		// 接收此資料的Servlet會使用 finalDecision 參數的值
// 		document.forms[0].finalDecision.value = "ORDER";
// 		document.forms[0].action="<c:url value='ProcessOrder.do' />";
// 		document.forms[0].method="POST";
// 		document.forms[0].submit();
// 		return;
// 	} else {
// 		return;
// 	}
// }
//</script>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 取得今天的日期，今天的日期應當在最後確認時才取得 -->
<jsp:useBean   id="today"  class="java.util.Date" scope="session"/> 
<title>訂單明細資訊確認</title>
</head>
<body style="background:#EBFFEB;">
<c:set var="funcName" value="CHE" scope="session"/>
<div style="text-align:center">
<h3>請確認下列訊息：</h3>
<FORM style="margin: 0 auto; width:750px;" action="<c:url value='ProcessOrder.do' />" method="POST" >
   <TABLE border='1' style="background:#F5EBFF; border-color:rgb( 100, 100, 255); border-style: outset; width:810;">
      <TR >
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	會員編號：${LoginOK.memberID}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	客戶姓名：${LoginOK.memberName}
         </TD>
         <TD style="text-align:left; border-color: #FFBD32; border-style: ridge;">
         	訂單日期：<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
<%--          	會員地址：${LoginOK.address} --%>
         </TD>
      </TR>
      <TR>
         <TD colspan='3' style="text-align:left; border-color: #FFBD32; border-style: ridge;">
                             出貨地址：<Input style="background:#ECFFCD;" size="60" type="text" id='ShippingAddress' 
                   name="ShippingAddress" value="">
                   <font color='red'>${errorMsg.ShippingAddress}</font>
         </TD>
      </TR>
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
         <TD colspan='3'>
         
   <TABLE border='1' style="background:#FFE7CD; border-color:rgb( 100, 100, 255); " >
      <tr>
			<th width='100'>手機編號</th>
			<th width='200'>手機名稱</th>							
			<th width='60'>單價</th>							
			<th width='60'>數量</th>	
			<th width='60'>金額</th>	
	  </tr>                                                    
       <c:set var="sum" value="0"></c:set>					
	<c:forEach items='${ShoppingCart.content}' var='entry'>
		<tr>
			<td align='center'>${entry.value.bean.productID}</td>
			<td align='center'>${entry.value.bean.productName}</td>							
			<td align='center'>${entry.value.bean.unitPrice}</td>							
			<td align='center'>${entry.value.quantity}</td>					
			<td align='center'>${entry.value.bean.unitPrice*entry.value.quantity}</td>							
		</tr>	
	<c:set var="sum" value="${sum+(entry.value.bean.unitPrice*entry.value.quantity)}"></c:set>
	</c:forEach>
	<tr height='16'>
	<td colspan='4' align='right'>合計金額(含稅):</td>>
	<td align='right'>${sum}元</td>					
	</tr>
			     
   <input type="hidden" name="finalDecision"  value="">   
   <input type="button" name="OrderBtn"  value="確定送出" onclick="reconfirmOrder()">
   <input type="button" name="CancelBtn" value="取消訂單" onclick="cancelOrder()">
</FORM>
</div>

</body>
</html>