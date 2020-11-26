<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>

<!-- 이렇게 하면 모든 멤버변수를 알아서 다 받음.. -->
<jsp:setProperty property="*" name="ob"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세 번째 방법의 처리 결과</h1> 
	<hr />
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>