<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	int sum = 0;
	for(int i = 1; i <= 100; ++i)
		sum += i;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Test009.jsp</title>

</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<!-- 
	○ 1부터 100까지의 합을 계산하여 결과를 출력하는 JSP 페이지를 작성한다.
	   while 반복문을 활용한다.
	   요청 주소는 『http://localhost:8090/WebApp05/Test009.jsp』로 한다.
 -->

<div>
	<h2>1부터 100까지의 합 : <%=sum %></h2>
</div>

</body>
</html>