<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <h1><span style="color:red; font-size:24pt;">JSTL Core</span></h1>
   <h2>회원 정보 입력</h2>
   <hr>
</div>

<div>
   <form action="MemberInsert.jsp" method="post">
      <table class="table">
         <tr>
            <th>이름</th>
            <td>
            <c:set var="i" value="1"></c:set>
            <c:forEach var="a" begin="1" end="5" step="1">
               <input type="text" name="name${i }" class="txt">
               <c:set var="i" value="${i+1 }"></c:set>
            </c:forEach>
            </td>
         </tr>
            <tr>
            <th>전화번호</th>
            <td>
            <c:set var="i" value="1"></c:set>
            <c:forEach var="a" begin="1" end="5" step="1">
               <input type="text" name="tel${i }" class="txt">
               <c:set var="i" value="${i+1 }"></c:set>
            </c:forEach>
            </td>
         </tr>
            <tr>
            <th>주소</th>
            <td>
            <c:set var="i" value="1"></c:set>
            <c:forEach var="a" begin="1" end="5" step="1">
               <input type="text" name="addr${i }" class="txt">
               <c:set var="i" value="${i+1 }"></c:set>
            </c:forEach>
            </td>
         </tr>
         <tr>
            <td colspan="6">
               <button type="submit" class="btn" style="width:100%;">입력</button>
            </td>
      </table>
   </form>
</div>
</body>
</html>