<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		// 수신된 데이터로 MemberScoreDTO 구성 → add() 메소드를 호출하기 위해 필요
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));
		
		// dao 의 add() 메소드 호출 → 데이터 입력(INSERT 수행)
		dao.modify(score);
		
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
	
	// 액션 처리를 마친 후 사용자가 MemberScoreSelect.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
%>