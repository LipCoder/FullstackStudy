<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(RadioSelect.jsp)로 부터 데이터 수신
	// → name, gender major, hobby
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");		//-- 텍스트박스... 단일값 수신
	String gender = request.getParameter("gender");	//-- 라디오버튼... 단일값 수신
	String major = request.getParameter("major");	//-- 셀렉트박스... 단일값 수신
	
	// check~!!!
	String[] hobby = request.getParameterValues("hobby");
	//-- 다중 선택이 가능한 셀렉트박스일 경우... 배열 형태로 수신
	
	// check~!!!
	String genderStr = "";
	if(gender.equals("M"))
		genderStr = "남자";
	else if(gender.equals("F"))
		genderStr = "여자";
	else
		genderStr = "확인불가";
	
	// check~!!!
	String hobbyStr = "";
	if(hobby != null)
	{
		for(String item : hobby)
			hobbyStr += " [" + item + "]";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp</p>
</div>

<div>
	<h3>수신한 데이터</h3>
	
	<!-- 이름 : 박민하  -->
	<p>이름 : <%=name %></p>
	
	<!-- 성별 : F(여자) -->
	<p>성별 : <%=gender %>(<%=genderStr %>)</p>
	
	<!-- 전공 : 국문학 -->
	<p>전공 : <%=major %></p>
	
	<!-- 취미 : [음악감상] [암벽등반] -->
	<p>취미 : <%=hobbyStr %></p>
</div>

</body>
</html>