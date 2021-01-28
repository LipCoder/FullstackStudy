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
<title>StudentForm.jsp</title>

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
		$("#cancel").click(function()
		{
			$(location).attr("href", "studentlist.action");
		});	
	});
</script>

</head>
<body>

<div>
	<h1>학생 정보</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
		
			<div class="panel-heading" id="title">
				학생 정보 수정
			</div>	
			
			<div class="panel-body">
				<form role="form" action="studentmodify.action?sid=${info.sid}" method="post">
					
					<div class="form-group">
						<label for="name">
							NAME : 
						</label>
						<input type="text" class="form-control" id="name" name="name"
						value="${info.name}"/>
					</div>
					
					<div class="form-group">
						<label for="telephone">
							TELEPHONE : 
						</label>
						<input type="tel" class="form-control" id="telephone" name="tel" 
						value="${info.tel}"/>
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">MODIFY</button>
					<button type="button" class="btn btn-default btn-sm btnCancel"
					id="cancel">CANCEL</button>
					

				</form>
			</div>
			
		</div><!-- close .panel .panel-default -->
	</div>
</div>



</body>
</html>