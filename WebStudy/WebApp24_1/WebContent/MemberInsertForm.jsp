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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>입 력 창</h1>
	<hr>
</div>

<div>
	<c:set var="max" value="5"></c:set>
	<form action="MemberInsert.jsp?max=${max}" method="post">
		<table class="table">
		<c:forEach var="num" begin="1" end="${max}" step="1">
			<tr>
				<th>이름(no.${num})</th>
				<td><input type="text" name="name${num}" class="txt"></td>
				<th>전화번호(no.${num})</th>
				<td><input type="text" name="phone${num}" class="txt"></td>
				<th>주소(no.${num})</th>
				<td><input type="text" name="addr${num}" class="txt"></td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="6">
				<button type="submit" class="btn" style="width: 400px; height: 70px;">입 력 하 기</button>
			</th>
		</tr>
		</table>
	</form>
</div>

</body>
</html>