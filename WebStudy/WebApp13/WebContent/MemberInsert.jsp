<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 이전 페이지로부터 수신한 내용으로
	//   데이터베이스의 테이블(TBL_MEMBER)에 
	//   회원 데이터 추가 액션 처리 수행
	//   ... 이후, 다시 리스트 페이지를 요청할 수 있도록 안내

	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{	
		// MemberDTO 객체 구성 → dao 의 add() 메소드 호출 시 필요
		MemberDTO dto = new MemberDTO();
		dto.setName(uName);
		dto.setTel(uTel);
		
		// 데이터베이스 연결
		dao.connection();
		dao.add(dto);
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
