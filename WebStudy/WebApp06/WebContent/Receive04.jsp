<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 받는 값으로 한글 형식을 쓰므로 UTF-8 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// 이름, 패스워드, 전화번호, 아이디
	String id = request.getParameter("txtNameId");
	String pwd = request.getParameter("txtNamePwd");
	String tel = request.getParameter("txtNameTel");
	String name = request.getParameter("txtNameName");
	
	// 성별
	String type = request.getParameter("groupRadio");
	
	// 지역
	String msgRegion = "없음";
	String region = request.getParameter("selRegion");
	if(region != "none")
		msgRegion = region; 
	
	// 수강과목
	String msgSubjects = "없음";
	String[] arrSubject = request.getParameterValues("groupCheck");
	if (arrSubject != null)
	{
		msgSubjects = "";
		for (String sub : arrSubject)
		{
			msgSubjects += sub + " ";
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	아이디 : 	<%=id %> 			<br>
	패스워드 : 	<%=pwd %> 			<br>
	이름 : 		<%=name %> 			<br>
	전화번호 : 	<%=tel %> 			<br>
	<br>
	성별 : 		<%=type %> 			<br>
	지역 : 		<%=msgRegion %> 	<br>
	수강과목 : 	<%=msgSubjects %> 	<br>
</div>

</body>
</html>