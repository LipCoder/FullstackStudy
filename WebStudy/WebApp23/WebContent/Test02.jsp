<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Test02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL �ھ�(Core) if�� �ǽ�</h1>
	<hr>
</div>


<div>
	<!-- form �±׿��� action �Ӽ� ���� �� �����ϴ� �������� ����ó�� �ڱ� �ڽ� -->
	<form method="post">
		���� <input type="text" name="su" class="txt">
		<br><br>
		
		<button type ="submit" class="btn"
		style="width: 120px; font-size: 16pt">��� Ȯ��</button>
	</form>
</div>


<div>
	<%-- <h2>${param.su}</h2> --%>
	
	<%-- ��<c:if test=""></c:if>�� : JSTL Core if �� --%>
	<%-- ��test=""�� : ���ǽ� ����. ��, �Ķ���ͷ� ������ su �� ���� ������...  --%>
	<%-- ��param.su�� : EL �� �̿��� �� ���� ������ �����ϴ� �κ� --%>
	<c:if test="${!empty param.su}"><!-- ���� �� -->
	
		<%-- ��� ���ǹ��� ���� ���� �� ��test=""���� ����� true �� ��� �����ϴ� ���� --%>
		
		<c:if test="${param.su % 2 == 0 }"><%-- ���� �� --%>
				
			<%-- ��� ���ǹ��� ���� ���� --%>
			<h2>${param.su } : ¦��</h2>
				
		</c:if>
		
		<%-- JSTL Core if������ else �� ����. --%>
		<c:if test="${param.su % 2 != 0 }"><%-- ���� �� --%>
		
			<%-- ��� ���ǹ��� ���� ���� --%>
			<h2>${param.su } : Ȧ��</h2>
		
		</c:if>
	
	</c:if>
</div>


</body>
</html>