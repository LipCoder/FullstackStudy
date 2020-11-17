<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역 → 데이터 수신
	//-- 이전 페이지(Send01.html)로 부터 전송된 데이터(userName, userTel) 수신
	
	// request 요청 객체
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
</head>
<body>

<div>
	<span style="color: blue"><%=userName %></span>님, 회원가입이 완료되었습니다.<br>
	       회원님께서 등록하신 전화번호는 <span style="color: red"><%=userTel %></span> 입니다.<br>
</div>


<!-- 
	○ 데이터 송수신 실습 01
		
	   - 이름과 전화번호를 입력받는 html 페이지를 작성한다.
	     (Send01.html)
	     
	     이름		[    주재완     ]
	     전화번호	[ 010-1111-1111 ]
	     
	     <회원 가입>
	     
	   - 회원 가입 버튼 클릭 시
	     『주재완님, 회원가입이 완료되었습니다.
	       회원님께서 등록하신 전화번호는 010-1111-1111 입니다.』
	     라는 내용을 출력하는 JSP 페이지를 작성한다.
	     (Receive01.jsp)
	    
	     [ html은 프론트 사이드 즉, 클라이언트 파트이다. 클라이언트끼리만 통신 가능
	       때문에 어느 곳에서든 통신시 html 형식을 수신할 수 없다.
	       때문에 jsp 형식으로 만들어야 한다. ]
	       
	   - 사용자의 최초 요청 페이지의 주소는
	     『http://localhost:8090/WebApp06/Send01.html』로 시작한다.
 -->

</body>
</html>