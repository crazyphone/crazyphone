<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer> -->
</script>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta name="google-signin-client_id" -->
<!-- 	content='110794926966-tvl8m24boaqav34ifoh4fe3fh3egsusg.apps.googleusercontent.com'> -->
 <meta name="google-signin-client_id" 
	content='110794926966-tvl8m24boaqav34ifoh4fe3fh3egsusg.apps.googleusercontent.com'> 
<style>

body {font-family: Arial, Helvetica, sans-serif;
 background-image: url("https://images.pexels.com/photos/259915/pexels-photo-259915.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
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
float: right;
margin-top:10px;
padding: 9px;
width: auto;
background-color: #7df5f1;
}

.demo1{

padding: 9px;
width: auto;
background-color: #7df5f1;
}
.psw2{
float: right;

}

</style>




</head>

<body>



<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">登入</button> -->



<div id="id01" class="modal">

  
  <form class="modal-content animate" action="<c:url value='processlognin' />" method="post" onsubmit="return submitUserForm();">
  

    
    <div class="container">
    
    
      <label for="uname"><b>帳號</b></label>
           &nbsp;<small><Font color='red' size="-3">${ErrorMsgKey.AccountEmptyError}
           </Font></small>
      
      <input type="text"  name="uname" id="nameDemo">
 

      <label for="psw"><b>密碼</b></label>
           &nbsp;<small><Font color='red'  size="-3">${ErrorMsgKey.PasswordEmptyError}
           </Font></small>
      <input type="password"  name="psw" id="pswDemo" >
      
      <span class="g-recaptcha"  data-sitekey="6LdoOaQZAAAAACNiq2_WN-vEJxJ0eRBfrVYUHSNt"></span>
      <span class="g-signin2" onclick="ClickLogin()" data-onsuccess="onSignIn"  data-theme="dark"></span>
 
        
      <button type="submit" id="sub">登入</button>
<!--       <label> -->
<!--         <input type="checkbox" name="remember"> 記住密碼 -->
<!--       </label> -->
      &nbsp;<Font color='red' size="-1" style='margin-left:70px'>
             ${ErrorMsgKey.LoginError}&nbsp;</Font>
      <div id="g-recaptcha-error"></div>
      
 	<div class="psw2">忘記 <a href=<c:url value='_2forgetPsw' />>密碼?</a></div>
	
    </div>
	 
    <div class="container" style="background-color:#f1f1f1">
    <a href=<c:url value='/'/> style="text-decoration:none;"> 
    <button type="button" class="cancelbtn">回首頁</button>
    </a>
           
      
      <span ><input type="button" class="demo" value='一鍵輸入'></span>
<!--       <span ><input type="button" class="demo1" value='一鍵管理者'></span> -->
	
      
 
    </div>
   </form>
    
 
 
  
</div>
   <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
    <script >
    $(function(){
 		$(".demo").click(function(){
 			$("#nameDemo").val("eeit11011@gmail.com");
  			$("#pswDemo").val("Do!ng123");

 		})
//  		$(".demo1").click(function(){
//  			$("#namedemo").val("1111@gmail.com");
//   			$("#pswdemo").val("xxxxxxxxxxxx");

//  		})
 		
    })
    
	var clicked=false;
	function ClickLogin(){
    	clicked=true;
}
    

    function onSignIn(googleUser) {
    	if(clicked){
    		// 客戶端如果有需要的話可以通過profile來獲取使用者資訊
            var profile = googleUser.getBasicProfile();
            // 傳回後臺驗證，並獲取userid
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
            var xhr = new XMLHttpRequest();
            xhr.open('POST', "<c:url value='googleVerify' />");
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
            console.log('Signed in as: ' + xhr.responseText);
//             location.href = "http://localhost:8080/CrazyPhone22/";
            location.href = "<c:url value='/'/>";
            };
            xhr.send('idtokenstr=' + id_token);
    	}
        
      };
      function signOut() {
  	    var auth2 = gapi.auth2.getAuthInstance();
  	    auth2.signOut().then(function () {
  	      console.log('User signed out.');
  	    });
  	  }
      
      
      function submitUserForm() {
    	    var response = grecaptcha.getResponse();
    	    if(response.length == 0) {
    	        document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">請點選我不是機器人</span>';
    	        return false;
    	    }
    	    return true;
    	}
    	 
    	function verifyCaptcha() {
    	    document.getElementById('g-recaptcha-error').innerHTML = '';
    	}
      
      
      

      
      
     
    </script>
	





</body>
</html>