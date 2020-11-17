<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	StringBuffer sb = new StringBuffer();

	sb.append("<ul>");
	
	for(int i = 1; i < 10; ++i)
	{
		sb.append(String.format("<li>5 * %d = %d</li>", i, i * 5));
	}
	
	sb.append("</ul>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test007.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<!-- 
	○ 스크립릿과 표현식을 이용하여
	   구구단 5단을 구성하여 출력하는 JSP 페이지를 작성한다.
	   요청 주소는 『http://localhost:8090/WebApp05/Test007.jsp』로 한다.
 -->

<div>
	<%-- 결과값을 출력하는 영역 --%>
	<%= sb.toString() %>
</div>

</body>
</html>