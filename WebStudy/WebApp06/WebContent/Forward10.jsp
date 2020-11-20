<%@ page contentType="text/html; charset=UTF-8"%>
<% 
    // 스크립릿 구조.
	request.setCharacterEncoding("UTF-8");

	String sNum1 = request.getParameter("num1");
	String sNum2 = request.getParameter("num2");
	String sOper = request.getParameter("selOper");
	
	String result = "";
	String tempOper = "";
	int num1 = Integer.parseInt(sNum1);
	int num2 = Integer.parseInt(sNum2);
	
	
	switch(sOper)
	{
	case "plus": 
		result = String.valueOf(num1 + num2); 
		tempOper = "+";
		break;
	case "minus": 
		result = String.valueOf(num1 - num2); 
		tempOper = "-";
		break;
	case "multi": 
		result = String.valueOf(num1 * num2); 
		tempOper = "*";
		break;
	case "divide": 
		result = String.format("%.2f" ,num1 / (double)num2); 
		tempOper = "/";
		break;
	}
	
	result = String.format("%d %s %d = %s", num1, tempOper, num2, result);
	request.setAttribute("result", result);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<jsp:forward page="Receive10.jsp"></jsp:forward>

</body>
</html>