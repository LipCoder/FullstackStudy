<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Gugudan.jsp)로 부터 데이터 수신
	
	// int n = Integer.parseInt(request.getParameter("dan"));
	// 위 코드보다 안전한 코드.. (더 바람직함)
	
	String str = request.getParameter("dan");
	int n = 0;
	
	try
	{
		n = Integer.parseInt(str);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
</head>
<body>


<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp</p>
</div>

<%-- <%
for(int i = 1; i <= 9; i++)
{
%>
	<%=n %> * <%=i %> = <%=(n*i) %><br>
<%
}
%>
 --%>
 
 	<%
 	for(int i = 1; i <= 9; i++)
 	{
 		out.print(n + " * " + i + " = " + (n*i)+ "<br>");
 	}
 	%>
 
</body>
</html>