<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(SessionTest01.jsp)로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");

	// 수신한 데이터를 세션에 적재
	session.setAttribute("userName", userName);
	session.setAttribute("userBirth", userBirth);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function sendIt()
	{	
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디를 입력해야 합니다.");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert ("비밀번호를 입력해야 합니다.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터 전송 및 수신</h1>
	<hr>
</div>

<div>

	<!-- 이전 페이지로부터 넘어온 데이터 확인 -->
	<!-- 
	     div를 적절하게 쓰는 법 : div내의 원소들의 위치를 쉽게 바꿀때..
	     원소들 각각 위치를 잡아주는것 보다 div만 조절해주면 된다. 
	     div는 많아서도 적어서도 안된다. 적당하게...
	-->
	<%-- 
	<div>
		<p><%=userName %></p>
		<p><%=userBirth %></p>
	</div>
	<br><br> 
	--%>

	<p>아이디 패스워드(SessionTest02.jsp)</p>
	<form action="SessionTest03_teacher.jsp" method="post">
	
	<table class="table">
		<tr>
			<th>아이디 </th>
			<td>
				<input type="text" name="userId" class="txt" size="10" />
			</td>
		</tr>
		<tr>
			<th>패스워드 </th>
			<td>
				<input type="text" name="userPwd" class="txt" size="10" />
			</td>
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