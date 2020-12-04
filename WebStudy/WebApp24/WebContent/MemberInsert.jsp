<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberInsert.jsp
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for(int i = 1; i <= 5; i++)
	{
		MemberDTO ob = new MemberDTO(
				request.getParameter("name" + i)
				, request.getParameter("tel" + i)
				, request.getParameter("addr" + i)
				);
		lists.add(ob);
	}
	
	
	request.setAttribute("lists", lists);
	
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>