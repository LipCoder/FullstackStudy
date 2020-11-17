<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 한글 처리를 위한 인코딩 방식 지정(한글 깨짐 방지)
	request.setCharacterEncoding("UTF-8");
	//-- 수신 후 가장 먼저 처리해야 할 내용



	String name = request.getParameter("txtName");
	int kor, eng, mat, tot;
    double avg;
    
    kor = Integer.parseInt( request.getParameter("txtKor"));
    eng = Integer.parseInt( request.getParameter("txtEng"));
    mat = Integer.parseInt( request.getParameter("txtMat"));
    tot = kor + eng + mat;
    
    avg = (double)tot / 3;
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>

<style type="text/css">
	* 
	{
	    font-family: 궁서;
	    font-size: 140%;
	}
	
	span
	{
	    color: red;
	}
	
</style>

</head>
<body>
	<div>	   
		<span><%=name %></span>님, 성적 처리가 완료되었습니다.<br>
	    회원님의 점수는 <br>국어:<span><%=String.valueOf(kor) %></span>점<br> 
	    영어:<span><%=String.valueOf(eng)%></span>점<br> 수학:<span><%=String.valueOf(mat)%></span>점 입니다.<br>
	    총점은 <span><%=String.valueOf(tot)%></span>점<br> 평균은 <span><%=String.format("%.1f", avg)%></span>점 입니다.
	</div>

</body>
</html>