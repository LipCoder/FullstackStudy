<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	str.append("<table class='table'>");
	
	str.append("<tr>");
	str.append("<td class='numTh'>번호</td>");
	str.append("<td class='nameTh'>이름</td>");
	str.append("<td>국어점수</td>");
	str.append("<td>영어점수</td>");
	str.append("<td>수학점수</td>");
	str.append("<td>총점</td>");
	str.append("<td>평균</td>");
	str.append("<td>순위</td>");
	str.append("</tr>");
	
	try
	{
		dao.connection();
		
		for(MemberScoreDTO memberScore : dao.lists())
		{
			str.append("<tr>");
			
			str.append("<td>" + memberScore.getSid() + "</td>");
			str.append("<td>" + memberScore.getName() + "</td>");
			str.append("<td>" + memberScore.getKor() + "</td>");
			str.append("<td>" + memberScore.getEng() + "</td>");
			str.append("<td>" + memberScore.getMat() + "</td>");
			str.append("<td>" + memberScore.getTot() + "</td>");
			str.append("<td>" + String.format("%.2f", memberScore.getAvg()) + "</td>");
			str.append("<td>" + memberScore.getRank() + "</td>");
			
			str.append("</tr>");
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	str.append("</table>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">
</head>
<body>

<div>
	<h1>회원 성적 관리 <span style="font-size: 12pt; color: green;">출력 페이지</span></h1> 
	<hr>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button" class="btn">회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>

</body>
</html>