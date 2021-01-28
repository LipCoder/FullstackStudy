<%@page import="com.test.util.FileManager"%>
<%@page import="org.apache.catalina.ha.deploy.FileMessage"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/* Download.jsp */

	String root = pageContext.getServletContext().getRealPath("/");
	String savePath = root + "pds" + File.separator + "saveFile";
	
	String saveFileName = request.getParameter("saveFileName");
	String originalFileName = request.getParameter("originalFileName");
	
	// 파일 다운로드
	out.clear();
	boolean flag = FileManager.doFileDownload(saveFileName, originalFileName, savePath, response);
%>