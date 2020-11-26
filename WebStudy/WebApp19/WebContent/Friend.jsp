<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#div01 {display: none;}
	#div02 {display: none;}
</style>
<script type="text/javascript">
	function selGender(obj)
	{
		var gender = obj.value;
		
		var div1 = document.getElementById("div01");
		var div2 = document.getElementById("div02");
		
		div1.style.display = "none";
		div2.style.display = "none";
		
		if(gender == "여자")
			div1.style.display = "inline";
		if(gender == "남자")
			div2.style.display = "inline";
	}
	
	function sendIt()
	{
		var name = document.myForm.userName.value;
		if(name == "")
			return;
		
		var f = document.myForm;
		f.submit();
	}
</script>
</head>
<body>

<div>
	<h1>JSP 액션태그 실습</h1>
	<hr>
</div>

<div>
	<p>데이터 등록</p>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="userName">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="userAge">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" id="male" value="남자" 
						 onclick="selGender(this)"/>남자
					</label>
					<label>
						<input type="radio" name="gender" id="female" value="여자" 
						 onclick="selGender(this)"/>여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<div id="div01">
						<label>
							<input type="checkbox" name="idelType" id="idelType1" 
							value="최우식" />최우식
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType2" 
							value="현빈" />현빈
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType3" 
							value="김수현" />김수현
						</label>	
					</div>
					<div id="div02">
						<label>
							<input type="checkbox" name="idelType" id="idelType4" 
							value="신세경" />신세경
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType5" 
							value="아이유" />아이유
						</label>
						<label>
							<input type="checkbox" name="idelType" id="idelType6" 
							value="조현" />조현
						</label>	
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn"
					style="width: 100%; font-size: 16pt;" onclick="sendIt()">등록</button>
				</td>
			</tr>
		</table>
	
	</form>
</div>

</body>
</html>