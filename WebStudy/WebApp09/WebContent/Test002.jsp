<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str = "";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 → SELECT 구문
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행 → executeQuery(sql) → ResultSet 반환
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th class='numTitle'>번호</th>";
	str += "<th class='nameTitle'>이름</th>";
	str += "<th class='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getString("TEL") + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>

<style type="text/css">
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

	function formCheck()
	{
		//alert("호출 확인");
		//return false;
		
		var uName = document.getElementById("userName");
		var nMsg = document.getElementById("nameMsg");
		
		nMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		return true;
	}

</script>

</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt" />
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt" />
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn">데이터 추가</button>
				</td>
				<td>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div>
	<%=str %>
</div>

</body>
</html>