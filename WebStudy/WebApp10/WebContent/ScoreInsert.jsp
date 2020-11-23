<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지로 부터 데이터 수신
	String uName = request.getParameter("txtName");
	String uKor = request.getParameter("txtKor");
	String uEng = request.getParameter("txtEng");
	String uMat = request.getParameter("txtMat");

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 준비 → INSERT 쿼리문
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
			                + " VALUES (SCORESEQ.NEXTVAL, '%s', %s, %s, %s)"
			                , uName, uKor, uEng, uMat);
	
	// DB 액션 처리
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result < 1)
	{
		// 에러 페이지를 다시 요청해라~!!!
		response.sendRedirect("ScoreError.jsp");
	}
	else
	{
		// 리스트 및 입력 페이지 다시 요청해라~!!!
		response.sendRedirect("ScoreList.jsp");
	}
	
%>