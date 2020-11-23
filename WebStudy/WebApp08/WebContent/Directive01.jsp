<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> --%>  <!-- 정의부분 -->
<%-- <%@ page buffer="1kb" autoFlush="false" %>  --%><!-- IOException : JSP 버퍼 오버플로우... -->
<%-- <%@ page buffer="10kb" autoFlush="false" %>  --%> <!-- 크기를 넉넉하게 주면 잘 나온다. -->
<%@ page buffer="1kb" autoFlush="true" %>  <!-- 꽉 찰때마다 내보내기 때문에 잘 나온다. -->
<!-- 
     autoFlush => true : 감당할 수 없는 크기일 경우 버퍼의 내용을 그냥 내보냄
               => false : 감당할 수 없더라도 꾸역꾸역 버퍼에 집어넣음 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive01.jsp</title>
</head>
<body>

<div>
	<h1>page 디렉티브 관찰 및 실습</h1>
	<hr />
</div>

<div>
	<h2>buffer 속성 및 autoFlush 실습</h2>
	
	<h3>반복문 구성</h3>
	
	<%
	for(int i = 1; i <= 1000; i++)
	{
	%>1234<%
	}
	%>
	
</div>

</body>
</html>