<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    // 현재 날짜 
    Calendar cal = Calendar.getInstance();
    
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	// 날짜 적용
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	if(sYear != null || sMonth != null)
	{
		year = Integer.parseInt(sYear);
		month = Integer.parseInt(sMonth);
		
		if(month > 12)
		{
			year++;
			month = 1;
		}
		else if(month < 1)
		{
			year--;
			month = 12;
		}
	}
	
	// 달력을 위한 계산
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(year%4==0 && year%100!=0 || year%400==0)
	{
		months[1] = 29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	for(int i=0; i<month-1; i++)
	{
		nalsu += months[i];
	}

	nalsu++;
	
	int week = nalsu%7;							
	int lastDay = months[month-1];			

	// 달력 그리기
	String calStr = "";
	
	calStr += "<tr>";

	for(int i=0; i<week; i++)
		calStr += "<td></td>";
		
	for(int i=1; i<=lastDay; i++)
	{
		week++;
		
		if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
		
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
	for(;; week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(calStr.endsWith("<tr>"))
		calStr = calStr.substring(0, calStr.length()-4);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>

</head>
<body>

<!--  
	○ 데이터 송수신 실습 07
	
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	     (SendAndReceive07.jsp)
	     
	     ◀ 2020년 11월 ▶
	     
	     -------------------------------------
	     -------------------------------------
	     -------------------------------------
	     
	     
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	     
	    - 사용자의 최초 요청 페이지의 주소는
	    『http://localhost:8090/WebApp06/SendAndReceive07.jsp』로 한다. 
	  
-->

<div>
	<h1>데이터 송수신 실습 7</h1>
	<h2>달력 요청</h2>
	<hr>
</div>

<div>
	<form>
		<table>
			<tr>
				<td>
					<a href="SendAndReceive07.jsp?year=<%=year%>&month=<%=month - 1 %>">◀</a>
					<span style="font-weight: bold;"> <%=year %>년 <%=month %>월 </span>
					<a href="SendAndReceive07.jsp?year=<%=year%>&month=<%=month + 1 %>">▶</a>
				</td>
			</tr>
		</table>
		<br>
		<table border="1">
			<tr>
				<th style="background-color: #e6e4e6; color: red;">일요일</th>
				<th style="background-color: #e6e4e6;">월요일</th>
				<th style="background-color: #e6e4e6;">화요일</th>
				<th style="background-color: #e6e4e6;">수요일</th>
				<th style="background-color: #e6e4e6;">목요일</th>
				<th style="background-color: #e6e4e6;">금요일</th>
				<th style="background-color: #e6e4e6; color: blue;">토요일</th>
			</tr>
			
			<%=calStr %>
			
		</table>
	
	</form>
</div>



</body>
</html>