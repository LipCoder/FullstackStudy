<%@page import="com.test.ScoreDAO"%>
<%@page import="com.test.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지로 부터 데이터 수신
	String uName = request.getParameter("txtName");
	int nKor = Integer.parseInt(request.getParameter("txtKor"));
	int nEng = Integer.parseInt(request.getParameter("txtEng"));
	int nMat = Integer.parseInt(request.getParameter("txtMat"));

	// 데이터베이스 사용을 위해 ScoreDAO 객체 할당
	// ScoreDAO의 add() 메서드 매개변수로 받을
	// ScoreDTO 객체 할당
	ScoreDAO dao = new ScoreDAO();
	ScoreDTO dto = new ScoreDTO();
	
	// ScoreDTO에 입력받은 정보를 넣음
	dto.setName(uName);
	dto.setKor(nKor);
	dto.setEng(nEng);
	dto.setMat(nMat);
	
	// 데이터 추가
	dao.add(dto);
	dao.close();
	
	// 추가 후 변경된 테이블을 보여주는 페이지로 리다이렉트
	response.sendRedirect("ScoreList.jsp");
%>