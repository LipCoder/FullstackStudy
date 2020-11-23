<%@page import="com.test.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 데이터베이스 사용을 위해 dao 객체 할당
	ScoreDAO dao = new ScoreDAO();

	// 모든 데이터를 받아옴
	ArrayList<ScoreDTO> arrDto = dao.lists();

	// 받아온 데이터를 알맞은 형태로 html 변환
	String strInfo = "";
	for(ScoreDTO dto : arrDto)
	{
		strInfo += "<tr>";
		
		strInfo += "<td>" + String.valueOf(dto.getRank()) + "</td>";
		strInfo += "<td>" + dto.getName() + "</td>";
		strInfo += "<td>" + String.valueOf(dto.getKor()) + "</td>";
		strInfo += "<td>" + String.valueOf(dto.getEng()) + "</td>";
		strInfo += "<td>" + String.valueOf(dto.getMat()) + "</td>";
		strInfo += "<td>" + String.valueOf(dto.getTot()) + "</td>";
		strInfo += "<td>" + String.format("%.2f", dto.getAvg()) + "</td>";
		
		
		strInfo += "</tr>";
	}
	
	// 한 작업이 끝났으므로 커넥션 해제
	dao.close();
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
		
		// 이름 검사
		var name = document.getElementById("txtName");
		var msg = document.getElementById("msgName");
		
		// 이름이 공백일 경우
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
		
		// 중복 코드를 줄이기 위해 변수와 반복문을 활용
		
		var scoreId = ["txtKor", "txtEng", "txtMat"];
		var msgId = ["msgKor", "msgEng", "msgMat"];
		
		for(var i=0; i<scoreId.length; i++)
		{
			// score와 오류메시지 오브젝트를 받아옴
			var score = document.getElementById(scoreId[i]);
			msg = document.getElementById(msgId[i]);
			
			var nScore = parseInt(score.value);
			
			// 공백이거나 숫자가 아닌 값이 들어온 경우
			// parseInt의 결과물은 NaN이다.
			// 때문에 isNan 함수를 통해 공백과 숫자가 아닌 값을
			// 찾아 오류 메시지를 띄운다.
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

<div>
	<h1>개별 과제</h1>
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
		
		<table style="text-align: center;">
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