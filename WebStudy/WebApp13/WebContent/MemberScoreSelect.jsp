<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
		
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th>국어점수</th>");
		str.append("<th>영어점수</th>");
		str.append("<th>수학점수</th>");
		str.append("<th>총점</th>");
		str.append("<th>평균</th>");
		str.append("<th>순위</th>");
		str.append("<th>성적처리</th>");
		str.append("</tr>");
		
		for(MemberScoreDTO memberScore : dao.lists())
		{	
			// 데이터가 추가되는 영역			
			str.append("<tr>");
			
			str.append("<td>" + memberScore.getSid() + "</td>");
			str.append("<td>" + memberScore.getName() + "</td>");
			str.append("<td class='txtScore'>" + memberScore.getKor() + "</td>");
			str.append("<td class='txtScore'>" + memberScore.getEng() + "</td>");
			str.append("<td class='txtScore'>" + memberScore.getMat() + "</td>");
			str.append("<td class='txtScore'>" + memberScore.getTot() + "</td>");
			str.append("<td class='txtScore'>" + String.format("%.2f", memberScore.getAvg()) + "</td>");
			str.append("<td class='txtScore'>" + memberScore.getRank() + "</td>");
			
			/*
			str.append("<td>");
			str.append("<button type='button' class='btn02'>");
			str.append("입력");
			str.append("</button>");
			str.append("<button type='button' class='btn01'>");
			str.append("수정");
			str.append("</button>");
			str.append("<button type='button' class='btn01'>");
			str.append("삭제");
			str.append("</button>");
			str.append("</td>");
			*/
			
			if(memberScore.getKor()==-1 && 
			   memberScore.getEng()==-1 && 
			   memberScore.getMat()==-1)
			{
				str.append("<td>");
				
				/* 입력 버튼 활성화 → 성적 데이터 입력만 가능 */
				str.append("<a href='MemberScoreInsertForm.jsp?sid=" + memberScore.getSid() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("입력");
				str.append("</button>");
				str.append("</a>");
				
				/* 수정 및 삭제 버튼 비활성화 */
				str.append("<button type='button' class='btn02'>");
				str.append("수정");
				str.append("</button>");
				str.append("<button type='button' class='btn02'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</td>");
			}
			else
			{
				str.append("<td>");
				
				/* 입력 버튼 비활성화 */
				str.append("<button type='button' class='btn02'>");
				str.append("입력");
				str.append("</button>");
				
				/* 수정 및 삭제 버튼 활성화 */
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + memberScore.getSid() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("수정");
				str.append("</button>");
				str.append("</a>");
				
				str.append("<a href='javascript:memberScoreDelete(" + memberScore.getSid() 
                + ", \"" + memberScore.getName() + "\""
                + ", \"" + memberScore.getKor() + "\""
                + ", \"" + memberScore.getEng() + "\""
                + ", \"" + memberScore.getMat() + "\")'>");
				
				str.append("<button type='button' class='btn01'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</td>");
				str.append("</a>");
			}
			
			str.append("</tr>");
		}
		
		str.append("</table>");
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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">
<script type="text/javascript">

	function memberScoreDelete(sid, name, kor, eng, mat)
	{
		var res = confirm("번호 : " + sid + ", 이름 : " + name  
				          + "\n국어점수 : " + kor 
				          + "\n영어점수 : " + eng 
				          + "\n수학점수 : " + mat 
				          + "\n이 회원의 성적을 삭제하시겠습니까?");
		
		if(res)
			window.location.href="MemberScoreDelete.jsp?sid=" + sid;
	}

</script>
</head>
<body>

<div>
	<h1>회원 성적 관리 <span style="font-size: 12pt; color: green;">출력 페이지</span></h1> 
	<hr>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button" class="btn">회원 명단 관리</button></a>
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<%=str.toString() %>
</div>

</body>
</html>