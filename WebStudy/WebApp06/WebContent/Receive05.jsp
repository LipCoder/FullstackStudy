<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send05.jsp)로 부터 데이터 수신
	// → dan
	
	request.setCharacterEncoding("UTF-8");

	String result = "";

	int dan = Integer.parseInt(request.getParameter("selDan"));
	for(int i = 1; i < 10; ++i)
	{
		result += String.format("%d * %d = %d<br>", dan, i, dan * i);
	}
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
	<%=result %>
</div>

</body>
</html>