<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob" />
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
			<th>나이</th>
			<td><%=ob.getUserAge()%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<%=ob.getGender() %>
			</td>
		</tr>
		<tr>
			<th>좋아하는 연예인</th>
			<td>
				<%=ob.getIdelType() %>
			</td>
		</tr>
	</table>
</div>

</body>
</html>