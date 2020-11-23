<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Connection conn = DBConn.getConnection();

	Statement stmt = conn.createStatement();
	
	String sql = "SELECT NAME, KOR, ENG, MAT"
			  + " ,(KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG"
			  + " ,DENSE_RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
			  + " FROM TBL_SCORE";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	// 테이블 만들기
	String strInfo = "";
	while(rs.next())
	{
		strInfo += "<tr>";
		
		strInfo += "<td>" + rs.getString("RANK") + "</td>";
		strInfo += "<td>" + rs.getString("NAME") + "</td>";
		strInfo += "<td>" + rs.getString("KOR") + "</td>";
		strInfo += "<td>" + rs.getString("ENG") + "</td>";
		strInfo += "<td>" + rs.getString("MAT") + "</td>";
		strInfo += "<td>" + rs.getString("TOT") + "</td>";
		strInfo += "<td>" + String.format("%.2f", rs.getFloat("AVG")) + "</td>";
		
		
		strInfo += "</tr>";
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>

<style type="text/css">
	span{color: red; font-weight: bold; display: none;}
	
	input {width: 200px;}
	button {width: 200px; height: 50px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	th {background-color: gray; color: white;}
	td {text-align: center;}
	
	.numTitle {width: 50px; color: black;}
	.nameTitle {width: 100px; color: black;}
	.telTitle {color: black;}
</style>


<script type="text/javascript">
	
	function submitCheck()
	{
		var check = true;
		
		// 이름
		var name = document.getElementById("txtName");
		var msg = document.getElementById("msgName");
		if(name.value == "")
		{
			msg.style.display = "inline";
			check = false;
		}
		else
		{
			msg.style.display = "none";
		}
		
		// 점수
		var scoreId = ["txtKor", "txtEng", "txtMat"];
		var msgId = ["msgKor", "msgEng", "msgMat"];
		
		for(var i=0; i<scoreId.length; i++)
		{
			var score = document.getElementById(scoreId[i]);
			msg = document.getElementById(msgId[i]);
			
			var nScore = parseInt(score.value);
			
			if(isNaN(nScore) || nScore < 0 || nScore > 100)
			{
				msg.style.display = "inline";
				check = false;
			}
			else
			{
				msg.style.display = "none";
			}
		}
		
		return check;
	}
	
</script>


</head>
<body>

<!-- 
	■■■ WebApp10 ■■■
	
	○ 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	   총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	   
	○ 리스트 출력시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	
	○ 데이터베이스 연동하여 처리한다.
	   (TBL_SCORE, SCORESEQ 활용)
	   
	○ 즉, 성적 처리 프로그램을 데이터베이스 연동하여 JSP로 구성할 수 있도록한다.
	
	○ 페이지 레이아웃(구성)
	
	데이터베이스 연결 및 데이터 처리
	-----------------------------------------------------
	성적 처리
	
	이름(*) 	[ textbox ]			→ 이름 입력 확인
	국어점수	[ textbox ]			→ 0 ~ 100 사이의 정수가 입력되었는지 확인
	영어점수	[ textbox ]			→ 0 ~ 100 사이의 정수가 입력되었는지 확인
	수학점수	[ textbox ]			→ 0 ~ 100 사이의 정수가 입력되었는지 확인
	
	< 성적 등록 >
	
	번호    이름    국어점수   영어점수   수학점수    총점   평균
	  1    진영은        90         80         70     xxx    xx.x
	  2    주재완        80         70         60     xxx    xx.x
	  3    강정우        70         60         50     xxx    xx.x
	  
    ○ 파일 구성
       - ScoreList.jsp
       - ScoreInsert.jsp
       - com.util.DBConn.java
       - WebApp10_scott.sql
		
-->

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>


<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return submitCheck()">
		<h2>성적 처리</h2>
		
		<table>
			<tr>
				<th>
					이름(*)
				</th>
				<td>
					<input type="text" class="txt" id="txtName" name="txtName" />
				</td>
				<td>
					<span id="msgName"> 이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>
					국어점수
				</th>
				<td>
					<input type="text" class="txt" id="txtKor" name="txtKor" />
				</td>
				<td>
					<span id="msgKor"> 0 ~ 100 사이 정수만 입력 가능합니다.</span>
				</td>
			</tr>
			<tr>
				<th>
					영어점수
				</th>
				<td>
					<input type="text" class="txt" id="txtEng" name="txtEng" />
				</td>
				<td>
					<span id="msgEng"> 0 ~ 100 사이 정수만 입력 가능합니다.</span>
				</td>
			</tr>
			<tr>
				<th>
					수학점수
				</th>
				<td>
					<input type="text" class="txt" id="txtMat" name="txtMat" />
				</td>
				<td>
					<span id="msgMat"> 0 ~ 100 사이 정수만 입력 가능합니다.</span>
				</td>
			</tr>
			<tr>
				<th></th>
			</tr>
			<tr>
				<th colspan="3">
					<button type="submit" id="btnAdd" class="btn" style="width: 200px">성적 등록</button>
				</th>
			</tr>
		</table>
		<br>
		
		<table style="text-align: right;">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어점수</th>
				<th>영어점수</th>
				<th>수학점수</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			
			<%=strInfo %>
		</table>
	</form>
</div>



</body>
</html>