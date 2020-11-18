<%@page import="java.util.function.Function"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%!
	String[] week = {"일", "월", "화", "수", "목", "금", "토"};
    String calendar = "";
   
    int test = 0;
	public int onClick()
	{
		if(test == 0)
			calendar = "하하하하ㅏ하하ㅏ하ㅏ하하ㅏ하ㅏㅎ33333"; 
		else if(test == 1)
			calendar = "하하하하ㅏ하하ㅏ하ㅏ하하ㅏ하ㅏㅎ122222"; 
		
		++test;
		return 0;
	}
%>

<%
	// 현재 년도와 날짜
	Calendar cal = Calendar.getInstance();
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	// select 만들기
	String init = new String();
	init = "<pre><select name='selYear' style='width: 150px' onchange='onChange()'>";
	
	for(int i = (year - 10); i <= (year + 10); ++i)
	{
		if(i == year)
			init += String.format("<option value='%s' selected='selected'>%s</option>",  String.valueOf(i), String.valueOf(i));
		else
			init += String.format("<option value='%s'>%s</option>", String.valueOf(i), String.valueOf(i));
	}
	init += "</select>  년   ";
	
	init += "<select name='selMonth' style='width: 150px' onchange='onChange()'>";
	
	for(int i = 1; i <= 12; ++i)
	{
		if(i == month)
			init += String.format("<option value='%s' selected='selected'>%s</option>",  String.valueOf(i), String.valueOf(i));
		else
			init += String.format("<option value='%s'>%s</option>", String.valueOf(i), String.valueOf(i));
	}
	
	init += "</select>  월";
	init += "</pre>";
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">
	
	function onChange()
	{
		<% onClick(); %>
	}

</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 06
	
	   - 달력을 출력하는 JSP 페이지를 구성한다
	   
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현한다.
	   
	   - 년도 구성은 현재 년도 기준 이전 10년 이후 10년 으로 구성한다.
	   
	   - 월은 1월 부터 12월 까지로 구성한다.
	   
	        :
	      2018
	      2019
	    [ 2020 ▼ ] 년  [ 11 ▼ ] 월
	      2021
	      2022
	        :
	        
	        
	        
	    ----------------------------
	    ----------------------------
	    
	   - 사용자의 최초 요청 페이지의 주소는
	    『http://localhost:8090/WebApp06/SendAndReceive06.jsp』로 한다.
-->

<div>
	<pre>
		<%=init %>
	</pre>
</div>
<br><br>

<div>
	<table>
		<%=calendar %>
	</table>
</div>

</body>
</html>