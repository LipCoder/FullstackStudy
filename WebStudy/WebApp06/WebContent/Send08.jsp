<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	
	   - a 태그에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	   
	   - 구구단 리스트를 동적으로 구성하여,
	     (Send08.jsp)
	     선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
	     (Receive08.jsp)
	     
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	     (Send08.jsp)
	   
	     구구단 선택
	     
	     1단
	     2단
	     3단
	      :
	     9단
	     
	   - 단 클릭시 해당 
	     구구단을 출력해주는 형태의 페이지로 구성한다.
	     (Receive08.jsp)
	     
	    - 사용자의 최초 요청 페이지의 주소는
	     『http://localhost:8090/WebApp06/Send08.jsp』로 시작한다.
-->

<div>
	<form>
		<span>구구단 선택</span>
		<br>
		<%for(int i=1; i<10; i++){%>
		<a href="Receive08.jsp?dan=<%=i%>"><%=i%>단</a><br>
		<%} %>
	</form>
</div>

</body>
</html>