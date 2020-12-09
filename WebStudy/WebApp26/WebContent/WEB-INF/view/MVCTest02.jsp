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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>MVC 관련 실습 03</h1>
	<hr>
</div>

<div>
	<!-- Controller(MVCTest02.java)로 부터 수신한 결과에 대한 처리 -->
	<ul>
		<c:forEach var="i" items="${lists }">
		<li>${i }</li>
		</c:forEach>
	</ul>
</div>

</body>
</html>