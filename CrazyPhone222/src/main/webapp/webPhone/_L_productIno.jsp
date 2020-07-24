<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	margin: 5% auto 15% auto
}

.outside {
	border: 1px solid;
}

.demoimg {
	width: 200;
	height: 150;
}
</style>
</head>
<body>
	<div class="outside">
		<div>
			<img src="<c:url value=''/>"/>
		</div>
	</div>
</body>
</html>