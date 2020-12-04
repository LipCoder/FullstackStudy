<%@page import="com.util.DBCPConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBCPConn.getConnection();

	String result = "";

	if(conn != null)
		result = "<span class='success'>데이터베이스 연결 성공~!!!</span>";
	else
		result = "<span class='fail'>데이터베이스 연결 실패 ㅠㅠ</span>";
	
	DBCPConn.close();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPActionTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.success {color: blue;}
	.fail{color: red;}
</style>
</head>
<body>

<div>
	<h1>DBCP를 통한 데이터베이스 접속 실습</h1>
	<hr>
</div>

<div>
	<!-- 연결 결과 확인 -->
	<h2><%=result %></h2>
</div>

</body>
</html>