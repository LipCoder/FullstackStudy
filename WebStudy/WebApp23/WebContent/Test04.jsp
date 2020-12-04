<%@page import="com.data.MyData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Test04.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();
	
	MyData ob = new MyData("진영은", 15);
	lists.add(ob);
	
	ob = new MyData("안혜지", 14);
	lists.add(ob);
	
	ob = new MyData("허수민", 13);
	lists.add(ob);
	
	ob = new MyData("김보경", 12);
	lists.add(ob);
	
	ob = new MyData("강정우", 11);
	lists.add(ob);
	
	ob = new MyData("김승범", 10);
	lists.add(ob);
	
	ob = new MyData("이준구", 9);
	lists.add(ob);
	
	ob = new MyData("박다빈", 8);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
%>
<jsp:forward page="Test04_result.jsp"></jsp:forward>