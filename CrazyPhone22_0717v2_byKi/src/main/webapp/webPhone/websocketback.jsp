<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>webSocket-測試使用者</title>
<script type="text/javascript">
	$(function() {
		var websocket;
		if ('WebSocket' in window) {
			console.log("此瀏覽器支援websocket");
			websocket = new WebSocket(
					"ws://localhost:8080/CrazyPhone22/socketHandler");
		} else if ('MozWebSocket' in window) {
			alert("此瀏覽器只支援MozWebSocket");
		} else {
			alert("此瀏覽器只支援SockJS");
		}
		websocket.onopen = function(evnt) {
			$("#tou").html("連結伺服器成功!")
		};
		websocket.onmessage = function(evnt) {

			$("#msg").html($("#msg").html() + "<br/>" + evnt.data);

		};
		websocket.onerror = function(evnt) {
		};
		websocket.onclose = function(evnt) {
			$("#tou").html("與伺服器斷開了連結!")
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
</head>

<body>
	<div class="page-header" id="tou">webSocket多終端聊天測試</div>

	<div id="eha">${LoginSuperOK.supervisorName}</div>


	<div class="well" id="msg"></div>
	<div class="col-lg">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="傳送資訊..."
				id="message"> <span class="input-group-btn">
				<button class="btn btn-default" type="button" id="send">傳送</button>
			</span>
		</div>
	</div>
</body>

</html>