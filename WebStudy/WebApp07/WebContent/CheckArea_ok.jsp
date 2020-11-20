<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(CheckArea.jsp)로 부터 데이터 수신
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// check~!!!!
	// 메모 데이터 수신
	String memo = request.getParameter("memo");
	
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후에서 『replaceAll()』 사용 가능
	//   『replaceAll()』을 통해 처리한 결과물을 다시 memo 변수에 대입
	//    ex) "나는\n박서준이\n점점 더 좋아지고 있다.\n"
	//		 → "나는<br>박서준이<br>점점 더 좋아지고 있다.<br>"
	
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");		// (X)
	
	// ※ 같은 이름 속성의 값을 가진 데이터 여러개를 받는(수신하는) 경우
	//    이를 배열로 처리해야 한다.
	
	String[] checkGroup = request.getParameterValues("checkGroup");
	
	// check~!!!
	// 배열 데이터를 수신하여 처리할 경우...
	// 수신 데이터가 전혀 없는 경우는
	// 배열의 상태가 null 이 되어버리기 때문에
	// null 에 대한 검사가 반드시 필요하다.
	
	String str = "";
	if(checkGroup != null)
	{
		for(String item : checkGroup)
			str += " [" + item + "]";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>CheckArea.jsp → CheckArea_ok.jsp</p>
</div>

<div>
	<h2>수신 데이터</h2>
	
	<!-- 이름 : 허수민 -->
	<h3>이름 : <%=name %></h3>
	
	<!-- 메모 : 어쩌구 저쩌구 -->
	<h3>메모</h3>
	<p><%=memo %></p>
	
	<!-- 이상형 : [현빈] [박서준] -->
	<h3>이상형 : <%=str %></h3>
</div>

</body>
</html>