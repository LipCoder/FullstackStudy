<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1);
%>

<%
	/* 
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1=su2=0;
	
	String str = "";
	
	if(strSu1==null || strSu2==null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		Calc ob = new Calc();
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
	} 
	*/
%>

<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 구성 -->
<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- 이 구문은 스크립릿 영역 안에서 
      『com.test.Calc ob = new com.test.Calc();』
     를 작성하여 처리한 것과 마찬가지 효과를 적용하게 된다. -->

<!-- ○ request.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터를 -->
<!--    『Calc』 객체 ob 에 넘겨주기 위한 속성 지정 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>>"/> --%>
<!-- → 이 구문은 『Calc_ok1.jsp』 의 『ob.setSu1(su1);』 과 같은 구문 -->

<!-- ※ check~!!! -->
<!--    속성 이름과 동일한 파라미터명인 경우 -->
<!--    getParameter() 메소드 없이 컨테이너에서 바로 받아 처리할 수 있다. -->
<!--    (servlet 컨테이너에서 알아서 다 처리해준다.) -->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>두 번째 방법의 처리 결과</h1>
	<hr>
</div>

<div>
	<h2><%=ob.result() %></h2>
</div>

</body>
</html>