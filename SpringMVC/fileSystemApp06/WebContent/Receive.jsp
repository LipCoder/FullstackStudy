<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Receive.jsp */
	
	String contentType = request.getContentType();
	Enumeration e = request.getHeaderNames();	// 헤더의 이름을 순차적으로 얻어온다.

	out.println("contentType : " + contentType + "<br>");
	out.println("전송받은 헤더 정보...<br>");
	while(e.hasMoreElements())
	{
		String key = (String)e.nextElement();
		String value = request.getHeader(key);
		
		out.println(key + " : " + value + "<br>");
	}
	
	out.println("전송받은 데이터...<br>");
	
	DataInputStream dis = new DataInputStream(request.getInputStream());
	String str;
	
	while( (str=dis.readLine()) != null )
	{
		out.println(new String(str.getBytes("ISO-8859-1"), "UTF-8") + "<br>");
	}
%>
