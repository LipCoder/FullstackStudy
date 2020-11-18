<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	//request.setCharacterEncoding("UTF-8");
	//-- 수신 내용에 한글 데이터가 없으므로 설정하지 않아도 됨.

	int n1 = Integer.parseInt(request.getParameter("txtNum1"));
	int n2 = Integer.parseInt(request.getParameter("txtNum2"));
	
	String operSel = request.getParameter("operator");
	
	String result = "";
	
	/* if(operSel.equals("plu"))
		result = n1 + n2; */
	
	switch(operSel)
	{
	case "plu": result = String.valueOf(n1 + n2); break;
	case "min":  result = String.valueOf(n1 - n2); break;
	case "mul":  result = String.valueOf(n1 * n2); break;
	case "div":  result = String.format("%.1f", (double)n1 / n2); break;
	default: result = "none";
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
</head>
<body>

<div>
	입력하신 <span><%=n1 %></span>와 <span><%=n2 %></span> 의 연산 결과는  <span><%=result %></span> 입니다.
</div>


</body>
</html>