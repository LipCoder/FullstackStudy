<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Spring MVC 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<!-- 페이지 요청 및 데이터 전송 → Controller → ReceiveController → receive.action -->
	<form action="receive.action" method="post">
		이름 <input type="text" name="userName" class="txt">
		<button type="submit" class="btn">submit</button>
	</form>
</div>

</body>
</html>