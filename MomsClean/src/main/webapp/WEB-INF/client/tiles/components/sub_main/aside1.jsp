<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	
	<style>
        .aside {
       
        font-family: 'IBM Plex Sans KR', sans-serif;

            float:left;
            background-image: linear-gradient(to top, #dfe9f3 0%, white 100%);
            width: 200px; /* 원하는 세로 줄의 높이로 변경하세요 */
            height: 500px;
            border-top: 1px solid #dee5e7;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: white;
        }
      
        
    </style>
<div class="aside">

<br>
<br>
<table align="center">
  
   <tr>
   <td align="center"><a href="/client/mypages/myPageInfo"><h4><spring:message code="mypage.aside.info"/></h4></a></td>
   <td></td>
   
   </tr>
   <tr>
   <td align="center"><a href="/client/mypages/myPageReserveList"><h4><spring:message code="mypage.aside.reserveList"/></h4></a></td>
   <td></td>
   </tr>
   <tr>
   <td align="center"><a href="/client/mypages/logoutSuccess" id="btnLogout"><h4><spring:message code="mypage.action.logout"/></h4></a></td>
   </tr>   
</table>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$("btnLogout").on("click", function(){
		if(confirm("로그아웃을 하시겠습니까?")){
		$.ajax({
			url:"/client/mypages/logoutSuccess",
			method: "GET",
			success: function(response){
				alert("로그아웃에 성공하였습니다.")
				window.location ="/client/page";
			},
			error: function(xhr, status, error){
				alert("로그아웃을 실패하였습니다. 다시시도해주세요.");
			}
			
		});
	};
});
});
</script>


