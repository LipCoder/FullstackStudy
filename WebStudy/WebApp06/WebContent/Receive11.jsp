<%@ page contentType="text/html; charset=UTF-8"%>
<% 
    // 이전페이지(Redirect11.jsp)로부터 데이터 수신
    // → num1, num2, op, str
    String result = request.getParameter("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습</h1>
	<h2>최종 결과 수신 페이지(Receive11.jsp)</h2>
	<hr>
</div>

<div>
	<h1><%=result %></h1>
</div>

</body>
</html>