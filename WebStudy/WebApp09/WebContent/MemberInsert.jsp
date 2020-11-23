<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Test002.jsp)로 부터 데이터 수신
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 준비 → INSERT 쿼리문
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
			+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// DB 액션 처리
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result < 1)
	{
		// 에러 페이지를 다시 요청해라~!!!
		response.sendRedirect("Error02.jsp");
	}
	else
	{
		// 리스트 및 입력 페이지(Test002.jsp)를 다시 요청해라~!!!
		response.sendRedirect("Test002.jsp");
	}
	
%>