<%@page import="com.dao.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.JDBCManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.dto.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
// Updated_ok.jsp
	
	String pageNum = request.getParameter("pageNum");

	Connection conn = JDBCManager.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.updateData(dto);
	
	JDBCManager.close();
	
	response.sendRedirect(cp + "/Article.jsp?pageNum=" + pageNum + "&num=" + dto.getNum());
%>