<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = (String)session.getAttribute("name");
	String birth = (String)session.getAttribute("birth");
	String id = (String)session.getAttribute("id");
	String pwd = (String)session.getAttribute("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<table>
		<tr>
			<th>이름 : <%=name %></th>
		</tr>
		<tr>
			<th>생일 : <%=birth %></th>
		</tr>
		<tr>
			<th>아이디 : <%=id %></th>
		</tr>
		<tr>
		 	<th>패스워드 : <%=pwd %></th>
		</tr>
	</table>
</div>

</body>
</html>