<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<% 
	String content = ob.getContent();
	
	StringBuffer sb = new StringBuffer();
	for(int i = 0; i < content.length(); ++i)
	{
		String temp = String.valueOf(content.charAt(i));
		if(temp.equals("\n"))
			temp = "<br>";
		sb.append(temp);
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
	<h1>JSP 액션태그 실습</h1>
	<hr>
</div>

<div>
    <h2>작성된 내용 확인</h2>
	<table class="table">
		<tr>
			<th>이름</th>
			<td><%=ob.getUserName()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=ob.getSubject()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%-- <%=sb%> --%>
				<%=ob.getContent().replaceAll("\n", "<br>") %>
			</td>
		</tr>
	</table>
</div>

</body>
</html>