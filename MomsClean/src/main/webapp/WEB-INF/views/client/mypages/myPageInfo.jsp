<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


 
<style>

  @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');

  .font{
      font-family: 'IBM Plex Sans KR', sans-serif;
    
       }


 .modalSubmit {
        font-family: 'IBM Plex Sans KR', sans-serif;
        background-color: #3CA0E1;
        color: #fff;
        border: solid 1px grey;
        cursor: pointer;
        font-size: 10px;
        margin-right: 10px;
        border-radius: 5px;
        padding: 10px 20px;
    }

    .modalSubmit:hover {
        font-family: 'IBM Plex Sans KR', sans-serif;
        background-color: #0056b3;
    }
 
    .quickmenu{
      
      position: fixed;
      top: 50;
      right: 0;
    
    }   
</style>

<div align="right">
 <div style="opacity:0.7;" class="quickmenu"><img src="/img/logo/mypage.png"></div>
</div>
<script>
$(document).ready(function(){
  var currentPosition = parseInt($(".quickmenu").css("top"));
  $(window).scroll(function() {
    var position = $(window).scrollTop(); 
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
  });
});
</script>

<body>
<div align="center">
	<br>
	
	<h2 class="font">
		<spring:message code="mypage.header.info" />
	</h2>
<br>
	<form:form modelAttribute="mypage">
	
		<form:hidden path="userNo" />
		<form:hidden path="userDivision" />
		<form:hidden path="emailAuth" />

		<table >

			<tr>
				<td><spring:message code="mypage.userId" /></td>
				<td><form:input path="userId" readonly="true" id="userId" /></td>


			</tr>
			<tr>
				<td><spring:message code="mypage.userPw" /></td>
				<td><form:input type="password" path="userPw" readonly="true" /></td>


			</tr>
			<tr>
				<td><spring:message code="mypage.userName" /></td>
				<td><form:input path="userName" readonly="true" /></td>


			</tr>
			<tr>
				<td><spring:message code="mypage.userPhone" /></td>
				<td><form:input path="userPhone" readonly="true" /></td>


			</tr>
			<tr>
				<td><spring:message code="mypage.userEmail" /></td>
				<td><form:input path="userEmail" readonly="true" /></td>


			</tr>

			<tr>
				<td><spring:message code="mypage.regDate" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${mypage.regDate}" /></td>
			</tr>

		
		</table>
</form:form>

		<br>
		<div>
			<button type="submit" id="btnModify" class="modalSubmit">
				<spring:message code="mypage.action.modify" />
			</button>
			<button type="submit" id="btnWithdraw" class="modalSubmit">
				<spring:message code="mypage.action.withdraw" />
			
				
			</button>
		</div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnModify").on("click", function() {
			window.location = "/client/mypages/myPageModify";
		});
		
		$("#btnWithdraw").on("click", function(){
			var userId = $("#userId").val();
			if(confirm("정말로 회원탈퇴를 하시겠습니까?")){
				 $.ajax({
					url: "/client/mypages/withdrawSuccess",
					method: "POST",
					data: {userId: userId},
					
					success: function(response){
						alert("회원탈퇴에 성공하였습니다.");
						window.location = "/client/page";
					},
					error: function(xhr, status, error){
						alert("회원탈퇴에 실패하였습니다 다시 시도해주세요.");
					}
				});
			}
		});
	}); 


</script>