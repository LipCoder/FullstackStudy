<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	int originCost = 980;
	int cost = originCost;
	int moneyCount[] = {0, 0, 0, 0};
	int moneyCost[] = {500, 100, 50, 10};

	for(int i = 0; i < moneyCost.length; ++i)
	{
		moneyCount[i] = cost / moneyCost[i];
		cost %= moneyCost[i];
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test008.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>스크립릿 / 표현식 실습</h1>
	<hr>
</div>

<!-- 
	○ 980원을 화폐 단뒤로 구분하여 출력하는 JSP 페이지를 작성한다.
	   요청 주소는 『http://localhost:8090/WebApp05/Test008.jsp』로 한다.
 -->
 
 <div>
 	<h2>대상 금액 : <%= originCost %> 원</h2>
 	<h2>화폐 단위</h2>
 	<h3>- 오백원 <%= moneyCount[0] %>개</h3>
 	<h3>- 백원 <%= moneyCount[1] %>개</h3>
 	<h3>- 오십원 <%= moneyCount[2] %>개</h3>
 	<h3>- 십원 <%= moneyCount[3] %>개</h3>
 </div>

</body>
</html>