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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>결 과 창</h1>
	<hr>
</div>

<div>
	<table class="table">
		<c:set var="num" value="0"></c:set>
		<c:forEach var="dto" items="${lists }">
		<c:set var="num" value="${num + 1}"></c:set>
		<tr>
			<th colspan = "3">${num }번 회 원</th>
		</tr>
		<tr>
			<td style="text-align: center;">
				이름 : ${dto.name }
			</td>
			
			<td style="text-align: center;">
				전화번호 : ${dto.phone }
			</td>
			
			<td style="text-align: center;">
				주소 : ${dto.addr }
			</td>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>