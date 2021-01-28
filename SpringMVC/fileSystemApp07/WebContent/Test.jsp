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
<title>Test.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<form name="myForm" method="post" action="Test_ok.jsp" enctype="multipart/form-data">
		작성자 : <input type="text" name="userName"><br>
		제목 : <input type="text" name="subject"><br>
		파일 : <input type="file" name="uploadFile"><br>
		<input type="submit" value="파일올리기"><br>
	
	</form>
</div>

</body>
</html>