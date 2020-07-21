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


   <div class="col-md-3 "  style="width: 15% ; background-color:#363636 ;height: 600px">
      <ul class="nav nav-pills nav-stacked">
        <li class="active" ><a href="backIndex" style="text-align:center;">商城管理系統</a></li>
        <li><a href="addCarousel" style="color:#5d76cf">輪播牆管理</a></li>
        <li><a href="test" style="color:#5d76cf">會員管理</a></li>
        <li><a href="#" style="color:#5d76cf">商品管理</a></li>
        <li><a href="#" style="color:#5d76cf">xxxx</a></li>
      </ul>
    </div>
    
    
    
<div align='center' >
<h3>會員資料</h3>
<a href="<c:url value='/'/> " >回商品首頁</a>
<a href="<c:url value='test'/> " >顯示全部會員</a>
<form method='POST' action="<c:url value='searchMember' />" >
	搜尋會員:<input type='text' name='search1' placeholder='Search...' class="icon">
	
	狀態:<select name="status1">
　	<option value="正常">正常</option>
　	<option value="封鎖中">封鎖中</option>
	</select>
	
	<button type="submit" class="search">送出</button>
	
	
</form>

<hr>
				<table border='2' cellpadding="3" cellspacing="1">
			
					
						<tr>
							<td style="text-align: center">${pk1.productName}</td>
							<td style="text-align: center">${pk2.productName}</td>
							<td style="text-align: center">${pk3.productName}</td>
						</tr>
				</table>

			
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