<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// id값 pwd값이 비어 있는 경우
	if(id == null || pwd == null)
	{
		// SessionTest03으로 보내기 위해 
		// SessionTest01로 부터 받은 값들을 
		// 미리 세션에 저장
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		session.setAttribute("name", name);
		session.setAttribute("birth", birth);
	}
	else
	{	
		// 이 지역에 들어 왔다는 것은
		// id와 pwd 값을 모두 입력 받았다는 뜻으로
		// SessionTest03으로 리다이렉트한다.
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		
		response.sendRedirect("SessionTest03.jsp");
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest02.jsp</title>
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
	
		if(!f.id.value || !f.pwd.value)
		{
			alert("값을 모두 입력해주세요.");
			return;	
		}
		
		f.submit();
	}

</script>
</head>
<body>

<div>
	<form action="SessionTest02.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<td>
					아이디 <input type="text" class="txt" id="id" name="id">
				</td>
			</tr>
			<tr>
				<td>
					패스워드 <input type="password" class="txt" id="pwd" name="pwd">
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