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
	<h1>JSTL 코어(Core) choose문 실습</h1>
	<h2>배수 확인하기</h2>
	<hr>
</div>

<div>
	<form method="post">
		정수 <input type="text" name="su" class="txt">
		<br><br>
		
		<button type="submit" class="btn"
		style="width: 200px; font-size: 16pt"> 결과 확인</button>
	</form>
</div>
<br><br>

<div>
	<c:if test="${!empty param.su }">
	
		<%-- 『<c:choose></c:choose>』 --%>
		<%-- JSTL Core 에서 『if ~ else』 구문을 대신할 수 있는 구문 --%>
	
		<c:choose>
			<%-- 다른 조건문들과 마찬가지로 구성되는 조건의 순서가 중요~!!! --%>
			<%-- 순서 구성에 유의 --%>
			<c:when test="${param.su % 3 == 0 && param.su % 4 == 0 }">
				<p>${param.su }은(는) 3과 4의 배수~!!!</p>
			</c:when>
			
			<c:when test="${param.su % 3 == 0}">
				<p>${param.su }은(는) 3의 배수~!!!</p>
			</c:when>
			
			<c:when test="${param.su % 4 == 0 }">
				<p>${param.su }은(는) 4의 배수~!!!</p>
			</c:when>
		
			<%-- else --%>
			<c:otherwise>
				<p>${param.su }은(는) 3과 4의 배수가 아니다~!!!</p>
			</c:otherwise>
					
		</c:choose>
	
	</c:if>
</div>

</body>
</html>