<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String name = "김승범";
	String str = String.format("%tF", java.util.Calendar.getInstance());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FirstJSP.jsp</title>
</head>
<body>

<!-- 메롱~ 바보야~!!! html 주석문은 F12로 보임 -->

<%-- 일꾼~ 바보야~!!! jsp 주석문은 F12로 안보임 --%>

<div>
	<h1><%=name %></h1>
</div>

<div>
	<h2><%=str %></h2>
</div>

</body>
</html>