<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberUpdate.jsp
	
	// 이전 페이지로(MemberUpdateForm.jsp)부터 데이터 수신
	// → name, tel + sid
	
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		MemberDTO dto = new MemberDTO();
		dto.setSid(sid);
		dto.setName(name);
		dto.setTel(tel);
		
		// dao 의 modify() 메소드 호출 → dto 필요
		dao.modify(dto);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberSelect.jsp");
%>