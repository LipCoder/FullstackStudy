<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Hap.jsp → Hap_ok.jsp</p>
</div>

<div>
	<!-- action 속성 지정 시 -->
	<!-- 『Hap_ok.jsp』 -->
	<form action="Hap_ok.jsp">
		정수1 : <input type="text" name="su1" class="txt"><br>
		정수2 : <input type="text" name="su2" class="txt"><br>
		<br>
		
		<input type="submit" value="결과 확인" class="btn">
	</form>
</div>

</body>
</html>