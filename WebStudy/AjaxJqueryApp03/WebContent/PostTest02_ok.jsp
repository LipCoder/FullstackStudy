<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%-- <%
	String result = "제목 : " + request.getParameter("title") +  " 입니다.";
	result += "<br>";
	result += "내용 : " + request.getParameter("content") +  " 입니다.";
%>
<%=result%> --%>

제목 : <b>${param.title }</b>
<br>
내용 : <b>${param.content }</b>