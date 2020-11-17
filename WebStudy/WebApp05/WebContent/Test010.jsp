<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuilder sb = new StringBuilder();

	sb.append("<pre>");
	for(int i = 4; i <= 100; i += 4)
	{
		sb.append(String.format("%3d  ", i));
		if(i % (4*5) == 0)
			sb.append("<br>");
	}
	sb.append("</pre>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test010.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
</div>

<!-- 
	○ 1부터 100까지의 수 중에서
	   4의 배수만 출력하는 JSP 페이지를 작성한다.
	   한 줄에 5개씩만 출력할 수 있도록 한다.
	   빈 줄 바꿈은 <br> 을 사용한다.
	   for 반복문 사용
	   요청 주소는
	   『http://localhost:8090/WebApp05/Test010.jsp』 로 한다.
 -->
 <%= sb.toString() %>

</body>
</html>