<%@ page contentType="text/html; charset=UTF-8"%>
<%
	int n1 = Integer.parseInt(request.getParameter("txtNum1"));
	int n2 = Integer.parseInt(request.getParameter("txtNum2"));
	
	String operSel = request.getParameter("operator");
	
	int result = 0;
	
	/* if(operSel.equals("plu"))
		result = n1 + n2; */
	
	switch(operSel)
	{
	case "plu": result = n1 + n2; break;
	case "min":  result = n1 - n2; break;
	case "mul":  result = n1 * n2; break;
	case "div":  result = n1 / n2; break;
	default: result = -1;
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