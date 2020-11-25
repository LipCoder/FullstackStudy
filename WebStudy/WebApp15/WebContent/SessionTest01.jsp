<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	
	.table 
	{
		text-align: center;
	}
	
</style>
<script type="text/javascript">

	function clickSubmit()
	{
		var f = document.myForm;
	
		if(!f.name.value || !f.birth.value)
		{
			alert("값을 모두 입력해주세요.");
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
	<form action="SessionTest02.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<td>
					이름 <input type="text" class="txt" id="name" name="name">
				</td>
			</tr>
			<tr>
				<td>
					생일 <input type="text" class="txt" id="birth" name="birth">
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type="button" class="btn" value="입력" style="width: 200px;"
					onclick = "clickSubmit()"> 
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>