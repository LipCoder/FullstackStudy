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
<!-- 뷰를 구성할 디바이스에 대한 메타데이터 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GradeList.jsp</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$(".btnDelete").click(function()
		{
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "gradedelete.action?sid=" + $(this).val());
			}
		});
		
		$(".btnUpdate").click(function()
		{
			$(location).attr("href", "grademodifyform.action?sid=" + $(this).val());
		});
		
		$("#add").click(function()
		{
			$(location).attr("href", "gradeform.action");
		})
	});
</script>

</head>
<body>

<div>
	<h1>성적 정보</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				성적 정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>SID</th>
							<th>NAME</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>과목3</th>
							<th>총점</th>
							<th>평균</th>
							<th>등급</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="grade" items="${list }">
						<tr>
							<td>${grade.sid }</td>
							<td>${grade.name }</td>
							<td>${grade.sub1 }</td>
							<td>${grade.sub2 }</td>
							<td>${grade.sub3 }</td>
							<td>${grade.tot }</td>
							<td>${grade.avg }</td>
							<td>${grade.ch }</td>
							<td>
								<button type="button" class="btn btn-default btn-xs btnDelete"
								value="${grade.sid}">삭제</button>
								<button type="button" class="btn btn-default btn-xs btnUpdate"
								value="${grade.sid}">수정</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<button type="button" class="btn btn-default btn-sm" 
				id="add"> 성적 추가하기 </button>
				
				<button type="button" class="btn btn-default btn-sm">
					<!-- Count <span class="badge" role="badge">1</span> -->
					Count <span class="badge" role="badge">${count }</span>
				</button>
			
			</div>
			
		</div>
			
	</div>
</div>



</body>
</html>