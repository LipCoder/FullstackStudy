<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send09.jsp)로 부터 데이터 수신 → userName
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	//String userName = request.getParameter("userName");
	
	request.setAttribute("message", "안녕하세요");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
</div>

<div>
	<%-- <p>이름 : <%=userName %></p> --%>
	<jsp:forward page="Receive09.jsp"></jsp:forward>
</div>

</body>
</html>