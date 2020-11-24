<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th class='telTh'>전화번호</th>");
		str.append("<th style='width: 200px;'>회원관리</th>");
		str.append("</tr>");
		
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>"+ member.getSid() +"</td>");
			str.append("<td>"+ member.getName() +"</td>");
			str.append("<td>"+ member.getTel() +"</td>");
			str.append("<td>");
			str.append("<a href='MemberUpdateForm.jsp?sid=" + member.getSid() + "'>");
			str.append("<button type='button' class='btn01'>수정</button>");
			str.append("</a>");
			
			/* " 'memberDelete(1, \" + 홍길동 + \" )' " */
			
			// ※ 따옴표의 종류 : ① "", ② '', ③ \"\"
			//    일반적으로 따옴표가 두 번 중첩되어 사용되면
			//    ①과 ②를 사용하면 된다.
			//    하지만, 따옴표가 세 번 중첩되어 사용될 경우
			//    ③ escape 를 사용해야 한다.
			
			str.append("<a href='javascript:memberDelete(" + member.getSid() 
			                        + ", \"" + member.getName() + "\")'>");
			
			str.append("<button type='button' class='btn01'>삭제</button>");
			str.append("</a>");
			str.append("</td>");			
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">

<script type="text/javascript">
	
	function memberDelete(sid, name)
	{
		//alert("호출 확인");
		
		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 삭제하시겠습니까?");
		
		//alert("응답 확인 : " + res);
		//-- confirm 창은 true(확인) 또는 false(취소)를 반환한다.
		
		if(res)
			window.location.href="MemberDelete.jsp?sid=" + sid;
		
	}

</script>

</head>
<body>

<div>
	<h1>회원 명단 관리 <span style="font-size: 12pt; color: green;">출력 페이지</span></h1> 
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button" class="btn">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button" class="btn">신규 회원 등록</button></a>
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>

</body>
</html>