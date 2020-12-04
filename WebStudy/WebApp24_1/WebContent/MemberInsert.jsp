<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	int max = Integer.parseInt(request.getParameter("max"));

	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	for(int i = 1; i <= max; ++i)
	{
		MemberDTO ob = new MemberDTO();
		
		ob.setName(request.getParameter("name" + i));
		ob.setPhone(request.getParameter("phone" + i));
		ob.setAddr(request.getParameter("addr" + i));
		
		lists.add(ob);
	}	
	
	request.setAttribute("lists", lists);
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>