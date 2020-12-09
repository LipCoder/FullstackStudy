<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<p>HelloReceive01.jsp</p>
	<hr>
</div>

<div>
	<!-- 수신된 결과 처리 -->
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
</div>

</body>
</html>