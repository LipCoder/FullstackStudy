<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String message = "";
	
	message += "<h1> 이름 : "  + request.getParameter("name") + " </h1>"; 
	message += "<h1> 나이 : "  + request.getParameter("age") + " </h1>"; 
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
	<h1>HelloReceive01.jsp</h1>
	<hr>
</div>

<div>
	<%=message %>
</div>

</body>
</html>