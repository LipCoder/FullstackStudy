<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Create_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 수신한 데이터로 구성된 DTO → 게시물번호와 IP Address 누락
	
	// 1. 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();

	// 2. 게시물 번호 최대값에 1을 더해서 set 하는 과정 수행
	dto.setNum(maxNum+1);
	
	// 3. IP Address set 하는 과정 수행 → request 로 부터 얻어내기
	// 원격지에 있는 주소를 가져오겠다..
	dto.setIpAddr(request.getRemoteAddr());
	
	// insert 액션을 수행하기 위한 메소드 호출
	dao.insertData(dto);
	
	DBConn.close();
	
	response.sendRedirect("List.jsp");
	
%>