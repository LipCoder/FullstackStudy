<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	
	// 세션의 사용자 아이디와 패스워드 그리고 이름 삭제
	/* 
	session.removeAttribute("userId");
	session.removeAttribute("userPwd");
	session.removeAttribute("userName"); 
	*/
	
	session.invalidate();
	//-- 기존 세션에 저장되어 있는 모든 항목을 제거하고 세션을 초기화
	
	response.sendRedirect("SessionTest01.jsp");
	
%>