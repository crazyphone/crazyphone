<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page contentType="text/html; charset=UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>webSocket-測試使用者</title>
<script type="text/javascript">
	$(function() {
		var websocket;
		if ('WebSocket' in window) {
			console.log("此瀏覽器支援websocket");
			websocket = new WebSocket(
					"ws://localhost:8080/CrazyPhone222/socketHandler");
		} else if ('MozWebSocket' in window) {
			alert("此瀏覽器只支援MozWebSocket");
		} else {
			alert("此瀏覽器只支援SockJS");
		}
		websocket.onopen = function(evnt) {
			$("#tou").html("上線中!")
		};
		websocket.onmessage = function(evnt) {
			var memberId = "${LoginOK.memberName}";
			var systime = new Date();
			var d = systime.getDate();
			var m = systime.getMonth() + 1;
			var y = systime.getFullYear();
			var hr = systime.getHours();
			var mm = systime.getMinutes();
			var msgtime = m+"月"+d+"日"+hr+":"+mm;
			if (memberId == (evnt.data.split(":")[0])) {
				$("#msg").append(
						"<div id = 'msgmsg' class = 'd-flex justify-content-end mb-4 '>"
								+ "<div class='msg_cotainer'>" 
								+ evnt.data + "<span class='msg_time'>"
								+ msgtime + "</span>"+" </div>"+"</div>");
			} else {

				$("#msg")
						.append(
								"<div id = 'msgmsg' class = 'd-flex justify-content-start mb-4 '>"
								+ "<div class='msg_cotainer_send'>" 
								+ evnt.data + "<span class='msg_time_send'>"
								+ msgtime + "</span>"+" </div>"+"</div>");

			}

		};
		websocket.onerror = function(evnt) {
		};
		websocket.onclose = function(evnt) {
			$("#tou").html("連線失敗!")
		}

		$('#message').keydown(function() {
			if (event.keyCode == 13) {
				send();
			}

		});

		function send() {
			if (websocket != null) {
				var message = document.getElementById('message').value;
				var userId = $('#eha').text();

				websocket.send(userId + ":" + message);
				document.getElementById('message').value = '';
			} else {
				alert('未與伺服器連結.');
			}
		}
	});
</script>
<style>
body, html {
	height: 100%;
	margin: 0;
	background: #7F7FD5;
	background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
}

.chat {
	margin-top: auto;
	margin-bottom: auto;
}

.card {
	height: 500px;
	border-radius: 15px !important;
	background-color: rgba(0, 0, 0, 0.4) !important;
}

.contacts_body {
	padding: 0.75rem 0 !important;
	overflow-y: auto;
	white-space: nowrap;
}

.msg_card_body {
	overflow-y: auto;
}

.card-header {
	border-radius: 15px 15px 0 0 !important;
	border-bottom: 0 !important;
}

.card-footer {
	border-radius: 0 0 15px 15px !important;
	border-top: 0 !important;
}

.container {
	align-content: center;
}

.search {
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
}

.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg {
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	height: 60px !important;
	overflow-y: auto;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.attach_btn {
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
}

.send_btn {
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
}

.search_btn {
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0, 0, 0, 0.3) !important;
	border: 0 !important;
	color: white !important;
	cursor: pointer;
}

.contacts {
	list-style: none;
	padding: 0;
}

.contacts li {
	width: 100% !important;
	padding: 5px 10px;
	margin-bottom: 15px !important;
}

.active {
	background-color: rgba(0, 0, 0, 0.3);
}

.user_img {
	height: 70px;
	width: 70px;
	border: 1.5px solid #f5f6fa;
}

.user_img_msg {
	height: 40px;
	width: 40px;
	border: 1.5px solid #f5f6fa;
}

.img_cont {
	position: relative;
	height: 70px;
	width: 70px;
}

.img_cont_msg {
	height: 40px;
	width: 40px;
}

.online_icon {
	position: absolute;
	height: 15px;
	width: 15px;
	background-color: #4cd137;
	border-radius: 50%;
	bottom: 0.2em;
	right: 0.4em;
	border: 1.5px solid white;
}

.offline {
	background-color: #c23616 !important;
}

.user_info {
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 15px;
}

.user_info span {
	font-size: 20px;
	color: white;
}

.user_info p {
	font-size: 10px;
	color: rgba(255, 255, 255, 0.6);
}

.video_cam {
	margin-left: 50px;
	margin-top: 5px;
}

.video_cam span {
	color: white;
	font-size: 20px;
	cursor: pointer;
	margin-right: 20px;
}

.msg_cotainer {
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 10px;
	border-radius: 25px;
	background-color: #29FF1A;
	padding: 10px;
	position: relative;
}

.msg_cotainer_send {
	margin-top: auto;
	margin-bottom: auto;
	margin-right: 10px;
	border-radius: 25px;
	background-color: #FFFB1A;
	padding: 10px;
	position: relative;
}

.msg_time {
	position: absolute;
	left: 0px;
	bottom: -18px;
	color: rgba(256,256, 256, 0.8);
	font-size: 12px;
}

.msg_time_send {
	position: absolute;
	left: 5px;
	bottom: -18px;
	color: rgba(256,256, 256, 0.8);
	font-size: 12px;
}

.msg_head {
	position: relative;
}

#action_menu_btn {
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

.action_menu {
	z-index: 1;
	position: absolute;
	padding: 15px 0;
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border-radius: 15px;
	top: 30px;
	right: 15px;
	display: none;
}

.action_menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.action_menu ul li {
	width: 100%;
	padding: 10px 15px;
	margin-bottom: 5px;
}

.action_menu ul li i {
	padding-right: 10px;
}

.action_menu ul li:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.2);
}

@media ( max-width : 576px) {
	.contacts_card {
		margin-bottom: 15px !important;
	}
}
</style>

</head>

<body>
<div class="container-fluid h-100">
	<div class="col-md-8 col-xl-6 chat">

		<div class="card-header" id="tou">webSocket多終端聊天測試</div>


		<div class="d-flex bd-highlight">
			<div class="img_cont">
				<img
					src="<c:url value='/getmemImg/${LoginOK.memberID}'/>"
					class="rounded-circle user_img"> <span class="online_icon"></span>
			</div>
			<div class="user_info">
				<div id="eha">${LoginOK.memberName}</div>

			</div>

		</div>
		<div class="card">

			<div id="msg"></div>



		</div>

		<div class="card-footer">
			<div class="input-group">

				<textarea id="message" class="form-control type_msg"
					placeholder="Type your message..."></textarea>
				<div class="input-group-append">
					<span class="input-group-text send_btn"><i
						class="fas fa-location-arrow"></i></span>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>





</html>