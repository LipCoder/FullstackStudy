<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>

<style type="text/css">
   *
   {
      line-height: 150%;
   }
   
   #customers td
   {
      text-align: center;
   }
   
   #submitBtn 
   {
      height: 150%;
      width: 280px;
      font-size: 18px;
      font-weight: bold;
      font-family: 맑은 고딕;
   }
   
   #err
   {
      display: none;
      color: red;
      font-size: small;
   }
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			//alert("호출 확인");	
			
			$("#err").css("display", "none");
			if($("#name").val()=="" || $("#telephone").val()=="")
			{
				$("#err").css("display", "inline");
				return;
			}
			
			$("#memberForm").submit();
		});
	});
</script>

</head>
<body>

<div>
   <h1>회원 관리(MemberList.jsp)</h1>
   <hr>
</div>

<div>
   <form action="memberinsert.action" method="post" id="memberForm">
      이름 <input type="text" name="name" id="name" class="control txt"><br>
      전화 <input type="text" name="telephone" id="telephone" class="control txt"><br>
      <button type="button" id="submitBtn" class="btn">회원 추가</button>
      <span id="err">모든 항목을 입력해야 합니다.</span>
   </form>
   <br>
   
   <!-- EL 표현에 의한 인원 수 출력 부분 -->
   <p>전체 인원 수 : ${count }</p>
   
   <table id="customers" style="width: 500px;" class="table">
      <tr>
         <th>번호</th><th>이름</th><th>전화번호</th>
      </tr>
      
      <c:forEach var="member" items="${memberList }">
      <tr>
         <%-- MemberDTO 객체의 getMid() ~ getTelephone() 메소드 호출 --%>
         <!-- 할 수 있는 EL 표현 활용 부분 -->
         <td>${member.mid }</td>
         <td>${member.name }</td>
         <td>${member.telephone }</td>
      </tr>
      </c:forEach>
   </table>
   
</div>
</body>
</html>