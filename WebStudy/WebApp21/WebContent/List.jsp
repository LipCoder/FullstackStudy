<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div id="bbsList">
	
	<div id="bbsList_title">
	     게 시 판 (JDBC 연동 버전)
	</div><!-- #bbsList_title -->
	
	<div id="bbsList_header">
	
		<div id="leftHeader">
			<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectField">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchValue" class="textField">
				<!-- event -->
				<input type="button" value="검색" class="btn2" onclick="">
			</form>
		</div><!-- #leftHeader -->
	
		<div id="rightHeader">
		</div><!-- #rightHeader --> 
	
	</div><!-- #bbsList_header -->
	
</div>

</body>
</html>