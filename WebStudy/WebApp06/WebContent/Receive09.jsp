<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send09_re.jsp 혹은 Send09_for.jsp)로 부터 데이터 수신
	// → userName, message
	
	String userName = request.getParameter("userName");

	// setAttribute로 set해준 값은 getAttribute로 받아올 수 있다.
	// getAttribute로 반환받는 값은 객체이기 때문에
	// 객체(Object) 자체를 넘겨주게 된다.
	String message = (String)request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive09.jsp)</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>

<!-- 페이지의 실행 흐름 -->
<!--  
	① 리다이렉트(Send09.jsp → Send09_re.jsp → Receive09.jsp)
	
	   - 리다이렉트는 클라이언트가
	     지정한 주소(『response.sendRedirect("Receive09.jsp")』)를
	     서버에 다시 요청하도록 만드는 것
	   - 처음 요청한 request 객체는 리다이렉트로 넘어가는 과정에서
	     사라지게 된다. (소멸된다.)
	   - 요청이 클라이언트 단위에서 새로 요청하는 것이기 때문에
	     속도가 다소 느릴 수 있다.
	   - DB 에서 insert, update, delete 하고나면
	     리다이렉트를 지정하여 처리해야 수정된 내용을
	     다시 적용하여(갱신) 확인할 수 있다.
	   - 브라우저의 주소를 확인해보면
	     최종 도착 페이지에 해당하는 『Receive09.jsp』인 것을 확인할 수 있다.
	     
	     
	② 포워드(Send09.jsp → Send09_for.jsp → Receive09.jsp)
	
	   - 포워드는 서버 내에 수신된 데이터를 포워딩한 주소로 넘겨주는 것.
	   - 처음 요청한 request 객체가 유지된다.
	   - 서버 내부에서 주소가 변경된 것이기 때문에
	     클라이언트 입장에서는 이 사실을 알지 못한다.
	     그렇기 때문에 클라이언트에게 보여지는 주소는 포워딩 이전 주소만 노출된다.
	   - 보안 측면에서 유리할 수 있다.
	   - 포워딩 하는 과정에서 재전송하는 데이터를 가감할 수 있다.
	     (『setAttribute()』, 『getAttribute()』 메소드 사용)
	     ※ 『setAttribute()』, 『getAttribute()』 메소드는
	        문자열 뿐 아니라 객체를 넘기고 받을 수 있다.
	   - 서블릿에서 작업한 결과를 클라이언트 출력 화면을 구성하는
	     JSP로 넘길 때 포워딩을 많이 사용하게 된다.
	   - 브라우저의 주소를 확인해보면
	     최종 도착 페이지가 아닌 『Send09_for.jsp』인 것을 확인할 수 있다.
-->

</body>
</html>