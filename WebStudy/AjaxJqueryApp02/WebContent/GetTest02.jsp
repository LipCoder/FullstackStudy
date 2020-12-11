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
<title>GetTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.txtNum
	{
		width: 100px;
		text-align: right;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
		$(function()
		{
			$("#sendButton").click(function()
			{
				//;
				var name = $("#name").val();
				
				$.get("GetTest02_ok.jsp"
				, {name : name}, function(args){$("#result").html(args)});
				
				///alert("test!");
			})
		});
</script>

</head>
<body>

<div>
	<h1>jQuery의 get() 메소드 실습</h1>
	<hr>
</div>

<div>
	<input type="text" class="txt" id="name"> 
	<button type="button" class="btn" id="sendButton"> 확 인 </button>
</div>
<br><br>

<div>
	<h1 id="result"></h1>
</div>

</body>
</html>