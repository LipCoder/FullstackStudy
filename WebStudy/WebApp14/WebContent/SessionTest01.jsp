<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SessionTest01_ok.jsp 페이지에서 되돌려 보내면서
	// session 의 userName 에 "김종호"를 담아서 보낸 상황
	String userName = (String)session.getAttribute("userName");
	//-- 『session.getAttribute("userName");』는
	//    Object 타입을 반환하므로 String 타입으로 변환하는 과정 필요
	
	// 세션 설정 시간 변경 -----------------------------------------
	
	// ※ 세션 기본 시간은 1800초.
	
	session.setMaxInactiveInterval(10);
	//-- 세션이 유지되는 시간을 10초로 변경하여 설정한 상태
	//   이로 인해 로그인 후 10초 뒤에 새로고침 하면 로그아웃 처리~!!!
	
	// ----------------------------------------- 세션 설정 시간 변경 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">
<style type="text/css">
	.btn01 { font-size: small; width: 100px; }
	.btn02 { font-size: small; width: 100px; }
</style>

<script type="text/javascript">
	
	function sendIt()
	{
		//alert("호출 확인");
		
		var f = document.myForm;	// name
		
		if(!f.userId.value)
		{
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}
	
</script>
</head>
<body>

<div>
	<h1>세션 처리 - 로그인</h1>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td>
				<a href=""><button type="button" class="btn01">게시판</button></a> |
			</td>	
			<td>
			    <%
			    if(userName==null)	// 세션을 통해 로그인을 확인하지 못한 사용자
			    {
			    %>
				<a><button type="button" class="btn02">일정관리</button></a> |
				<%
				}
			    else				// 세션을 통해 로그인을 확인한 사용자
			    {
				%>
				<a href="SessionTest02.jsp"><button type="button" class="btn01">일정관리</button></a> |
				<%
			    }
				%>
			</td>	
			<td>
				<%
				if(userName==null)
				{
				%>
				<a><button type="button" class="btn02">친구관리</button></a> |
				<%
				}
				else
				{
				%>
				<a href="SessionTest02.jsp"><button type="button" class="btn01">친구관리</button></a> |
				<%
				}
				%>
			</td>
		</tr>
	</table>
	<br>
	
	<table>
		<tr>
			<td>
			    <%
			    if(userName==null)
			    {
			    %>
				<form action="SessionTest01_ok.jsp" method="post" name="myForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" name="userPwd" style="width: 200px;">
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<button type="button" style="width: 100%;"
								onclick="sendIt()">로그인</button>
							</th>
						</tr>
					</table>
				</form>
				<%
			    }
			    else
			    {
				%>
				<h2><%=userName %>님, 환영합니다.</h2>	
				<h3>이제 일정관리와 친구관리 서비스를 이용하실 수 있습니다.</h3>
				<br><br>
				
				<p><a href="Logout.jsp">로그아웃</a></p>
				<%
			    }
				%>
			</td>
		</tr>
	</table>
</div>

</body>
</html>