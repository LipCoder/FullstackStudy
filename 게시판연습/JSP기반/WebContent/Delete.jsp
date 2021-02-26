<%@page import="com.util.JDBCManager"%>
<%@page import="com.dao.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
// Delete.jsp
	
	String strNum = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	
	int num = Integer.parseInt(strNum);
	
	Connection conn = JDBCManager.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.delete(num);

	// result 결과값에 따른 분기 처리 가능
	
	JDBCManager.close();
	
	response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
%>