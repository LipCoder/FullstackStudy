<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StudentList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="panel title">
	<h1>성적 관리(SpringMVC + Annotation + Mybatis 버전)</h1>
</div>

<!-- 메인 메뉴 영역 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<!--  
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			-->
			<a class="navbar-brand" href="#">Home</a>
		</div><!-- end .navbar-header -->
		
		<div class="collapse navbar-collapse" id="bs-example-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="studentlist.action">학생 관리<span class="sr-only">(current)</span></a>
				</li>
				<li>
					<a href="gradelist.action">성적 관리</a>
				</li>
			</ul>
		</div><!-- end .collapse .navbar-collapse -->
	</div><!-- end .container-fluid -->
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading row">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					학생 리스트 출력
				</span>
				<span class="col-md-9">
					<a href="studentinsertform.action" role="button"
					class="btn btn-success btn-xs" id="btnAdd"
					style="vertical-align: bottom;">
						학생 추가
					</a>
				</span>
			</div><!-- end panel-heading .row -->
			
			<div class="panel-body">
				전체 학생 수 <span class="badge">${count }</span>
			</div>
			
			<div class="panel-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr class="trTitle">
							<th>
								번호
							</th>
							<th>
								이름
							</th>
							<th>
								전화번호
							</th>
							<th>
								성적 입력 여부
							</th>
							<th>
								수정 및 삭제
							</th>
						</tr>
					</thead>
					<!-- <tbody>
						<tr>
							<td>1</td>
							<td>박다빈</td>
							<td>010-1111-1111</td>
							<td>0</td>
							<td>
								<button type="button" class="btn btn-success">수정</button>
								<button type="button" class="btn btn-danger">삭제</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>진영은</td>
							<td>010-3690-7828</td>
							<td>1</td>
							<td>
								<button type="button" class="btn btn-success">수정</button>
								<button type="button" class="btn btn-danger">삭제</button>
							</td>
						</tr>
					</tbody> -->
					
					<c:forEach var="student" items="${list }">
						<tr>
							<td>${student.sid}</td>
							<td>${student.name }</td>
							<td>${student.tel }</td>
							<c:if test="${student.sub == 0 }">
							<td>Ｘ</td>
							</c:if>
							<c:if test="${student.sub == 1 }">
							<td>○</td>
							</c:if>
							<td>
								<button type="button" class="btn btn-success">수정</button>
								<button type="button" class="btn btn-danger">삭제</button>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
			 
		</div><!-- end .panel .panel-default -->
	</div><!-- end .panel-group -->
</div><!-- end .container -->

</body>
</html>