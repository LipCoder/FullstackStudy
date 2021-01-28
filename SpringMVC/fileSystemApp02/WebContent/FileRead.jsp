<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// FileRead.jsp
	
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 1. 파일을 읽기 위해 File 객체를 생성
	File newFile = new File(appRoot, "data/test.txt");
	
	// 2. 파일이 존재하는지 검사
	if(newFile.exists())
	{
		// 3-1. 파일을 읽기 위한 FileReader 를 생성
		FileReader fr = new FileReader(newFile);
		
		// 3-2. FileReader 를 조금 더 쉽게 읽기 위해 BufferedReader로 감싸기
		BufferedReader br = new BufferedReader(fr);
		
		// 4. 실질적으로 파일의 내용을 읽어냄
		String readData;
		while( (readData=br.readLine()) != null )
		{
			out.println(readData + "<br>");
		}
		
		// 5-1. BufferedReader 리소스 반납(닫아줌)
		br.close();
		
		// 5-2. FileReader 리소스 반납(닫아줌)
		fr.close();
		
	}
	
%>