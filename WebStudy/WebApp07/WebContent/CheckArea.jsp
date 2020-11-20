<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>CheckArea.jsp → CheckArea_ok.jsp</p>
</div>

<div>
	<form action="CheckArea_ok.jsp" method="post">
		이름 <input type="text" name="name" class="txt" />
		<br>
		
		메모
		<br>
		<textarea name="memo" cols="30" rows="5"></textarea>
		<br><br>
		
		이상형
		<br>
		<label><input type="checkbox" name="checkGroup" value="수지">수지</label>
		<label><input type="checkbox" name="checkGroup" value="이청아">이청아</label>
		<label><input type="checkbox" name="checkGroup" value="슬기">슬기</label>
		<label><input type="checkbox" name="checkGroup" value="박소담">박소담</label>
		<br>
		
		<label><input type="checkbox" name="checkGroup" value="김수현">김수현</label>
		<label><input type="checkbox" name="checkGroup" value="현빈">현빈</label>
		<label><input type="checkbox" name="checkGroup" value="유연석">유연석</label>
		<label><input type="checkbox" name="checkGroup" value="박서준">박서준</label>
		<br><br>
		
		<input type="submit" value="전송" class="btn" style="width: 200px;">
		
	</form>
</div>

</body>
</html>