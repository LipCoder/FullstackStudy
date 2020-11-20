<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Table.jsp)로 부터 데이터 수신
	// → su1, su2 (가로, 세로)
	
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	int n1 = 0;
	int n2 = 0;
	
	// 테이블 안에서 1씩 증가시켜나갈 변수 선언 및 초기화
	int n = 0;
	
	// 수신된 데이터 형 변환
	try
	{
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
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
<title>Table_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Table.jsp → Table_ok.jsp</p>
</div>

<div>
	<table border="1">
	<!-- 가독성이 많이 떨어짐.... -->
	<% 
	for(int i = 0; i < n2; i++)
	{
	%>
		<tr>
		<%
		for (int j = 0; j < n1; j++)
		{
		%>
			<td style="width: 30px; text-align: right;"><%=++n %></td>
		<% 
		}
		%>
		</tr>
	<%
	}
	%>	
	</table>
</div>

</body>
</html>