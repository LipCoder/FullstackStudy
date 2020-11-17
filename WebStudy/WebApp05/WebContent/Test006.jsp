<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	StringBuffer sb = new StringBuffer();

    sb.append("<ul>");
    for(int i=1; i<=10; ++i)
    {
    	sb.append(String.format("<li>%d</li>", i));
    }
    sb.append("</ul>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test006.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<div>
	<p>1 부터 10 까지의 수를 출력하는 JSP 페이지를 작성한다. </p>
	<p>요청 주소는 『http://localhost:8090/WebApp05/Test006.jsp』로 한다.</p>
	<p>반복문을 활용한다.</p>
</div>


<div>
	<%-- 실행 --%>
	<%= sb.toString() %>
</div>

</body>
</html>