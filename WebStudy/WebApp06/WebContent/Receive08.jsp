<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int dan = Integer.parseInt(request.getParameter("dan"));

	String strResult = "";
	for(int i = 1; i <= 9; ++i)
	{
		strResult += String.format("<tr><td>%d * %d = %d</td></tr>"
				                   , dan, i, dan * i);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<table border="1">
		<%=strResult %>
	</table>
</div>


</body>
</html>