<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Test_ok.jsp
	
	String root = pageContext.getServletContext().getRealPath("/");
	String savePath = root + "pds" + File.separator + "saveFile";
	
	// 경로상 디렉터리가 존재하지 않으면 만든다.
	File dir = new File(savePath);
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5 *1024*1024;
	
	MultipartRequest req = null;
	String urlFile = "";
	
	try
	{
		/* 내 풀이
		req = new MultipartRequest(request, savePath, maxFileSize
								 , encType, new DefaultFileRenamePolicy());
		
		out.println("작성자 : " + req.getParameter("userName") + "<br>");
		out.println("제목 : " + req.getParameter("subject") + "<br>");
		out.println("서버에 저장된 파일명1 : " + req.getFilesystemName("uploadFile1") + "<br>");
		out.println("업로드한 실제 파일명1 : " + req.getOriginalFileName("uploadFile1") + "<br>");
		out.println("파일 타입1 : " + req.getContentType("uploadFile1") + "<br>");
		
		File f = req.getFile("upliadFile1");
		if( f != null )
		{
			out.println("파일 크기 : " + f.length() + "Bytes. <br>");
		}
		
		out.println("서버에 저장된 파일명1 : " + req.getFilesystemName("uploadFile2") + "<br>");
		out.println("업로드한 실제 파일명2 : " + req.getOriginalFileName("uploadFile2") + "<br>");
		out.println("파일 타입2 : " + req.getContentType("uploadFile2") + "<br>");
		
		f = req.getFile("uploadFile2");
		if( f != null )
		{
			out.println("파일 크기2 : " + f.length() + "Bytes. <br>");
		}
		*/
		
		req = new MultipartRequest(request, savePath, maxFileSize
				 				 , encType, new DefaultFileRenamePolicy());

		out.println("작성자 : " + req.getParameter("userName") + "<br>");
		out.println("제목 : " + req.getParameter("subject") + "<br>");
		out.println("*********************************************<br>");
		
		out.println("업로드된 파일 <br>");
		
		// check~!!!
		// MultipartRequest 객체의 『getFileNames()』
		// → 요청으로 넘어온 파일들의 이름은 Enumeration 타입으로 반환
		Enumeration files = req.getFileNames();
		while(files.hasMoreElements())
		{
			String name = (String)files.nextElement();
			if(req.getFilesystemName(name) != null)
			{
				out.println("서버에 저장된 파일명 : " + req.getFilesystemName(name) + "<br>");
				out.println("업로드한 실제 파일명 : " + req.getOriginalFileName(name) + "<br>");
				out.println("파일 타입 : " + req.getContentType(name) + "<br>");
				
				File f = req.getFile(name);
				if (f != null)
				{
					out.println("파일 크기 : " + f.length() + "Bytes. <br>");
				}
			}
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>