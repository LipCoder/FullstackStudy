<%@ page contentType="text/html; charset=UTF-8"%>
<%
//스크립릿 구조.
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
		tempOper = "%2B";
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
	
	// check~!!!
	// 결과 데이터 재전송~!!! → sendRedirect() 메소드 사용
	// ※ 『response』 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//     : 지정된 URL(location)로 요청을 다시 전송할 수 있도록 안내한다.
	//       이 과정에서 이전의 요청(request)은 소멸한다.
	
	response.sendRedirect("Receive11.jsp?result=" + result);
%>








