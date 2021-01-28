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
<title>RegionUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/mainStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

   $(document).ready(function()
   {
      // 에러(span 엘리먼트) 안내 초기화
      $("#err").css("display", "none");
      
      $("#regionName").on("keyup", function()
      {
         // keyup 이벤트가 발생할 때마다
         // 실시간으로 입력값을 담아둘 변수 search
         var search = $(this).val()
         
         if(search.replace(" ", "") == "")
         {
            $("#err").css("display", "none");
            return;
         }
         
         // 입력 내용이 한글 완성형인 경우에만 전송할 수 있도록 처리
         var regEx = /^[가-힣]{1,}$/;
         
         if(!regEx.test(search))
            return;
         
         ajaxRequest();
      });
      
      // 지역 추가 버튼이 클릭되었을 때 수행할 코드 처리
      $("#submitBtn").click(function()
      {
         // 1. 데이터 검사
         if( $("#regionName").val()=="" )
         {
            $("#err").html("입력 항목이 누락되었습니다.");
            $("#err").css("display", "inline");
            return;            //-- submit 액션 처리 중단
         }
         
         if( !/^[가-힣]{1,}$/.test($("#regionName").val()) )      // 『!』 check~!!!
         {
            $("#err").html("입력 항목이 잘못되었습니다.");
            $("#err").css("display", "inline");
            return;
         }
         
         // 2. 중복확인 유효성 검사
         if( $("#err").html().trim() == "이미 사용중인 이름이 존재합니다."
               || $("#err").html().trim() == "사용중인 이름은 등록할 수 없습니다.")
         {
            $("#err").html("사용중인 이름은 등록할 수 없습니다.");
            $("#err").css("display", "inline");
            return;
         }
         
         // submit 액션 처리 수행
         $("#regionForm").submit();
         
      });
      
   });
   
   function ajaxRequest()
   {
      $.post("regionajax.action", {regionName : $("#regionName").val()}, function(data)
      {
         $("#err").html(data).css("display", "inline");
      });
   }
   
   
</script>

</head>
<body>

<!----------------------------------------------
   #38. RegionUpdateForm.jsp
   - 지역 수정 페이지
  ---------------------------------------------->

<div>
   <!-- 메뉴 영역 -->
   <div>
      <c:import url="EmployeeMenu.jsp"></c:import>
   </div>
   
   <!-- 콘텐츠 영역 -->
   <div id="content">
      <h1>[지역 관리] > [지역 정보 수정]</h1>
      <hr>
      
      
      <form action="regionupdate.action" method="post" id="regionForm"> 
         <table>
         
         	<tr>
         		<th>지역아이디</th>
         		<td>
         			<input type="text" id="regionId" name="regionId" readonly="readonly"
         			value="${region.regionId}">
         		</td>
         	</tr>
         
            <tr>
               <th>지역명</th>
               <td>
                  <input type="text" id="regionName" name="regionName" placeholder="지역명"
                  value="${region.regionName }">
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <span id="err" style="color:red; font-weight: bold; display: none;"></span>
               </td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <br><br>
                  
                  <button type="button" class="btn btn-primary" id="submitBtn"
                  style="width: 45%;">지역 수정</button>
                  <button type="button" class="btn btn-primary" id="listBtn"
                  style="width: 45%;">지역 리스트</button>
                  <br><br>
               </td>
            </tr>
         </table>
      </form>
   </div>
   
   <!-- 회사 소개 및 애플리케이션 소개 영역 -->
   <div id="footer">
   </div>
</div>

</body>
</html>