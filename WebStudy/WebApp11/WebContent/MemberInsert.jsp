<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	// -- 데이터 입력 액션 처리 페이지
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao =  null;
	
	try
	{
		dao = new MemberDAO();
		
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		dao.add(member);
		
		// add 메소드 반환 결과에 따른 분기 처리 가능
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// URL 주소가 기록되어 있는 쪽지를 사용자에게 전달
	response.sendRedirect("MemberList.jsp");
%>
