<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function sendIt()
	{	
		var f = document.forms[0];
		
		if(!f.userName.value)
		{
			alert("이름을 입력해야 합니다.");
			f.userName.focus();
			return;
		}
		
		if(!f.userBirth.value)
		{
			alert ("생일을 입력해야 합니다.");
			f.userBirth.focus();
			return;
		}
		
		f.submit();
	}
	
</script>
</head>
<body>

<!--
	○ SessionTest01 에서 SessionTest02 로
	   이름과 생일을 입력받아 전송~!!!
	   
	   SessionTest02 에서 SessionTest03 으로
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 생일을 함께 전송~!!!
	   
	   SessionTest03 에서 전달받은 이름, 생일, 아이디, 패스워드 출력~!!!
	   
	   01 --------------------→ 02 -------------------→ 03
	   이름, 생일				 아이디, 패스워드 		  이름, 생일, 아이디, 패스워드
	   입력						 입력  					  출력
	               - getParameter                - getAttribute

-->

<div>
	<h1>데이터 전송 및 수신</h1>
	<hr>
</div>

<div>
	<p>이름과 생일(SessionTest01.jsp)</p>
	<form action="SessionTest02_teacher.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName" class="txt" size="10">
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="text" name="userBirth" class="txt" size="10" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()"
					 style="width: 400px; height: 40px; font-size: 17pt;">다음 페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>