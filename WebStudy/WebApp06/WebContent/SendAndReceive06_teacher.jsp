<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(SendAndReceive06.jsp → 자기 자신 페이지)로부터 데이터 수신
	
	// 최초 요청인 경우라면 request.getParameter()를 통해 받은 object 값은 null이다.
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	
	// 페이지 최초 요청을 감안한 코드 ---------------------------------------------
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일, 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청일 경우
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 표시할 달력의 년 월 구성 → 페이지 최초 요청이 아닐 경우
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	
	// --------------------------------------------- 페이지 최초 요청을 감안한 코드
	
	// 확인한 날짜로 달력 구성
	// - 년도 select option 구성 ----------------------------------------------------
	/*
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020" selected="selected">2020</option>
		<option value="2021">2021</option>
		<option value="2022">2022</option>
		<option value="2023">2023</option>
		<option value="2024">2024</option>
		<option value="2025">2025</option>
		<option value="2026">2026</option>
		<option value="2027">2027</option>
		<option value="2028">2028</option>
		<option value="2029">2029</option>
		<option value="2030">2030</option>
	*/
	
	String yOptions = "";
	for(int year=(nowYear - 10); year<=(nowYear + 10); year++)	// 2010 ~ 2030
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션값이 같을 때 → selected
		// 상황2. 페이지 최초 요청이 아닐 때 → 사용자가 직접 년도 선택
		// 상황3. 나머지
		
		if(sYear == null && year == nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else if(sYear != null && year == Integer.parseInt(sYear))
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
	}
	// ---------------------------------------------------------- - 년도 select option 구성
	
	
	// - 월 select option 구성 -----------------------------------------------------------
	
	/* 
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<option value="11" selected="selected">11</option>
		<option value="12">12</option> 
	*/
	
	String mOptions = "";
	for(int month = 1; month <= 12; month++)
	{
		// 상황1. 페이지 최초 요청 → sMonth 는 null, 현재 월 옵션이 같을 때 → selected
		// 상황2. 페이지 최초 요청이 아닐 때 → 월 선택 → 선택한 월이 현재 월 옵션과 같을 때
		// 상황3. 나머지
		if(sMonth==null && month==nowMonth)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else if(sMonth!=null && month==Integer.parseInt(sMonth))
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else
		{
			mOptions += "<option value='" + month + "'>" + month + "</option>";
		}
	}
	
	// ----------------------------------------------------------- - 월 select option 구성
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 ---------------------------
	// (만년달력)
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
		months[1] = 29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재 년도 → 입력받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 계산
	for(int i=0; i<selectMonth-1; i++)
	{
		nalsu += months[i];
	}
	// +1
	nalsu++;
	
	// --------------------------- 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	
	int week = nalsu%7;								//-- 요일 변수
	int lastDay = months[selectMonth-1];			//-- 마지막 날짜 변수

	
	// 달력 그리기-------------------------------------------------------------------------
	String calStr = "";
	calStr += "<table border='1'>";
	
	calStr += "<tr>";
	for(int i=0; i<weekName.length; i++)
	{	
		if(i==0)		// 일요일
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else if(i==6)	// 토요일
			calStr += "<th style='color:blue;'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	
	// 빈칸 공백 td 발생
	for(int i=0; i<week; i++)
		calStr += "<td></td>";
		
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		week++;
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
		
		
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 달력 숫자 구성 이후 빈 칸 공백 발생
	for(;; week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(calStr.endsWith("<tr>"))
		calStr = calStr.substring(0, calStr.length()-4);
	
	calStr += "</table>";
	
	// -------------------------------------------------------------------------달력 그리기
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
</style>

<script type="text/javascript">
	
	function formCalendar(obj)
	{
		obj.submit();	
	}
	
</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 06 (SendAndReceive06.jsp)
	
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
	<h1>데이터 송수신 실습 06</h1>
	<h2>달력 요청 및 응답</h2>
	<hr>
</div>

<div>
    <!-- form 의 action 속성 값 생략 → 데이터의 수신 및 요청 페이지는 자기 자신 -->
	<form action="" method="post">
		<select name="year" id="year" onchange="formCalendar(this.form)">
			<!-- 
			<option value="2019">2019</option>
			<option value="2020" selected="selected">2020</option>
			<option value="2021">2021</option> 
			-->
			<%=yOptions %>
		</select>년
		
		<select name="month" id="month" onchange="formCalendar(this.form)">
			<!-- <option value="10">10</option>
			<option value="11" selected="selected">11</option>
			<option value="12">12</option> -->
			<%=mOptions %>
		</select>월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>

</body>
</html>