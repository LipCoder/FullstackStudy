<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DepartmentList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">
<link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  
   
<style type="text/css">
   #customers
   {
      width: 32%;
   }
   .disable
   {
      color: gray;
   }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		// 수정 버튼 클릭 시 액션 처리
		$(".updateBtn").click(function()
		{
			// 테스트
			//alert($(this).val());
			
			$(location).attr("href", "departmentupdateform.action?departmentId=" + $(this).val());
		});
		
		// 삭제 버튼 클릭 시 액션 처리
		$(".deleteBtn").click(function()
		{
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "departmentdelete.action?departmentId=" + $(this).val());
			}
		});
	});

</script>

</head>

<body>

<!-----------------------------------------------------------------------------
  #42. DepartmentList.jsp
  - 부서 리스트 출력 페이지
  - 관리자가 접근하는 부서 리스트 출력 페이지
    (일반 직원이 접근하는 부서 리스트 출력 페이지는 deptList.jsp 로 구성할 예정)
------------------------------------------------------------------------------->

<div>
	
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[부서 관리] > 부서 리스트</h1>
		<hr>
		
		<div>
			<form action ="DepartmentInsertForm.jsp">
				<input type="button" value="부서 추가" class="btn"
				     onclick="location.href='departmentinsertform.action'">
			</form>
		</div>
		
		<br><br>
		
		<table id="customers" class="table">
			<tr>
				<th>번호</th>
				<th style="width: 200px;">부서명</th>
				
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach var="department" items="${departmentList }">
			<tr>
				<td>${department.departmentId}</td>
				<td>${department.departmentName}</td>
				
				<td>
					<button type="button" class="btn btn-primary updateBtn"
					value="${department.departmentId }">수정</button>
				</td>
				<td>
					<button type="button" value="${department.departmentId }"
						${department.delCheck==0 ? "class=\"btn btn-danger deleteBtn\"" : "class=\"disable\"" }
						${department.delCheck==0 ? "" : "disabled=\"disabled\"" }>삭제</button>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>

	<!-- 회사 소개 및 애플리케이션 소개 -->
	<div id="footer">
	</div>

</div>

</body>
</html>