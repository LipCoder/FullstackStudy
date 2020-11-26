<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(SessionTest02.jsp)부터 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	//String userName = request.getParameter("userName");	//--(X)
	//String userBirth = request.getParameter("userBirth"); //--(X)
	
 	String userName = (String)session.getAttribute("userName");
 	String userBirth = (String)session.getAttribute("userPwd");
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
	<h1>데이터 전송 및 수신</h1>
	<hr>
</div>

<div>
	<p>이름, 생일, 아이디, 패스워드 출력(SessionTest03.jsp)</p>
	<h3>이름 : <%=userName %></h3>
	<h3>생일 : <%=userBirth %></h3>
	<h3>아이디 : <%=userId %></h3>
	<h3>패스워드 : <%=userPwd %></h3>
</div>

</body>
</html>