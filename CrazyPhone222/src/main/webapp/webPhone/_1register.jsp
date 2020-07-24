<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
body {font-family:Microsoft JhengHei;
/* font-family: Arial, Helvetica, sans-serif; */
background-image: url("https://images.pexels.com/photos/3568520/pexels-photo-3568520.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940") ;
/*  background-image: url("https://images.pexels.com/photos/1581687/pexels-photo-1581687.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500") ; */
/*  background-image: url("https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940") ; */
           
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
			
}

/* Full-width input fields */
input[type=text], input[type=password],input[type=date] {
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
  font-family:Microsoft JhengHei;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #6A6AFF;
  font-family:Microsoft JhengHei;
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
.modal {
/*   display: none; */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
/*   background-color: rgb(0,0,0);  */
/*   background-color: rgba(0,0,0,0.4);  */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; 
  border: 1px solid #888;
  width: 40%; 
  box-shadow:3px 3px 3px 3px #2e2e2e;
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

/* Add Zoom Animation */
/* .animate { */
/*   -webkit-animation: animatezoom 0.6s; */
/*   animation: animatezoom 0.6s */
/* } */

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
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


.demo{
margin-left:365px;
padding: 9px;
width: auto;
background-color: #6A6AFF;
font-family:Microsoft JhengHei;
}

 .demo1{ 

 padding: 9px; 
 width: auto; 
 background-color: #7df5f1; 
 } 
.h2h2{

}

</style>

</head>
<body>
<body>



<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">登入</button> -->



<div id="id01" class="modal">

  <h1  style="text-align: center; margin-bottom: -50px; color:white;">  註冊會員</h1>
  <form:form class="modal-content animate"  method="post" modelAttribute="MemberBean" enctype="multipart/form-data" >
  

    
    <div class="container">
    
    
      <label for="MemberEmail"><b>帳號</b></label>
           &nbsp;<small><Font color='red' size="-3">${ErrorKey.AccountEmptyError}
           </Font></small>
           &nbsp;<small><Font color='red' size="-3">${ErrorKey.mailError}
           </Font></small>
      <form:input type="text"  path="MemberEmail" id="MemberEmail" />


      <label for="MemberPwd"><b>密碼</b></label>
           &nbsp;<small><Font color='red'  size="-3">${ErrorKey.PswAccountEmptyError}
           </Font></small>
      <form:input type="password"  path="MemberPwd" id="MemberPwd" />
      
      <label for="checkPwd"><b>確認密碼</b></label>
           &nbsp;<small><Font color='red'  size="-3">
           </Font></small>
      <input type="password"  nema="checkPwd" id="checkPwd1" />
      
      <label for="MemberName"><b>姓名</b></label>
           &nbsp;<small><Font color='red' size="-3">${ErrorKey.NameEmptyError}
           </Font></small>
      <form:input type="text"  path="MemberName" id="MemberName" />
      
 	
      <label for="MemberBirth"><b>生日</b></label>
           &nbsp;<small><Font color='red'  size="-3">${ErrorKey.BirthEmptyError}
           </Font></small>
      <form:input type="date"  path="MemberBirth" id="MemberBirth" />
 	
 	  
 	  <label for="MemberPhone"><b>連絡電話</b></label>
           &nbsp;<small><Font color='red'  size="-3">${ErrorKey.PhoneEmptyError}
           </Font></small>
      <form:input type="text"  path="MemberPhone" id="MemberPhone" />
      
      <label for="MemberAddress"><b>地址</b></label>
           &nbsp;<small><Font color='red'  size="-3">${ErrorKey.AddressEmptyError}
           </Font></small>
      <form:input type="text"  path="MemberAddress" id="MemberAddress" />
        
        
      <label for="MImage" ><b >照片</b></label>
      <form:input type="file"  path="MImage" id="MImage"  /><br>
      
      <img id="changeimg" src=""  />
       	
        
      <button type="submit" style="margin-top:50px">送出</button>
		
<!-- 		      &nbsp;<Font color='red' size="-1" style='margin-left:70px'> -->
<%--              ${ErrorMsgKey.mailError}&nbsp;</Font> --%>
      

    </div>

    <div class="container" style="background-color:#f1f1f1">
    <a href=<c:url value='/'/> style="text-decoration:none;"> 
    <button type="button" class="cancelbtn">回首頁</button>
    </a>
      
      <button type="button" class="demo">一鍵輸入</button>
<!--       <span ><input type="button" class="demo" value='一鍵輸入'></span> -->
     

    </div>
    
    
 
  </form:form>
</div>
   <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
    <script >
    $(function(){
 		$(".demo").click(function(){
 			$("#MemberEmail").val("eeit11011@gmail.com");
  			$("#MemberPwd").val("Do!ng123");
  			$("#checkPwd1").val("Do!ng123");
//   			$("#MemberBirth").val("19960618");
  			$("#MemberName").val("周健哲");
  			$("#MemberPhone").val("0912321597");
  			$("#MemberAddress").val("台北市大安區復興南路一段390號");
 		})
    })

					$("#MImage").change(function() {

						readURL(this);
					});
					function readURL(input) {

						if (input.files && input.files[0]) {

							var reader = new FileReader();

							reader.onload = function(e) {

								$("#changeimg").attr('src', e.target.result);
								
								$("#changeimg").css('width','150px').css('height','150px')
							}

							reader.readAsDataURL(input.files[0]);

						}

					}
				</script>



</body>
</html>