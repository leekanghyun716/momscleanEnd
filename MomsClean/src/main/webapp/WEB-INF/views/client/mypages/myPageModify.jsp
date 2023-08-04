<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');

 @font-face {
   font-family: 'IBM Plex Sans KR', sans-serif;
    
}
 .modalSubmit {
        font-family: 'IBM Plex Sans KR', sans-serif;
        background-color: #3CA0E1;
        color: #fff;
        border: solid 1px grey;
        cursor: pointer;
        font-size: 12px;
        margin-right: 10px;
        border-radius: 5px;
        padding: 10px 20px;
    }

    .modalSubmit:hover {
        background-color: #0056b3;
    }
 </style>

<div align="center" >
<br>
<h2 class="font"> <spring:message code="mypage.header.modify"/></h2>
<br>
<form:form modelAttribute="mypage">
<form:hidden path="userNo"/>
<form:hidden path="userDivision"/>
<form:hidden path="emailAuth"/>
<table> 

	<tr>
		<td><spring:message code="mypage.userId"/></td>
		<td><form:input path="userId"  disabled="true"/></td>	
	</tr>
	
	<tr>
		<td><spring:message code="mypage.userPw"/></td>
		<td><form:input type="password" path="userPw" id="userPw"/> </td>
	</tr>
	
	<tr>
		<td><spring:message code="mypage.confirmPw"/></td>
		<td><input type="password" id="confirmPw"/></td>
	</tr>
	
	<tr>
		<td><spring:message code="mypage.userName"/></td>
		<td><form:input path="userName" id="name" /></td>	
	</tr>
	
	<tr>
		<td><spring:message code="mypage.userPhone"/></td>
		<td><form:input path="userPhone" id="phone" /></td>		
	</tr>
	
	<tr>
		<td><spring:message code="mypage.userEmail"/></td>
		<td><form:input path="userEmail" id="email" /></td>
	</tr>
	
	<tr>
		<td><spring:message code="mypage.regDate"/></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${mypage.regDate}" /></td>		
	</tr>
	
	
</table>
</form:form>
</div>
<br>
<div align="center">

 	<button type="submit" id="btnModifyComplete" class="modalSubmit" onclick="fn_sendMember">
 	 	<spring:message code="mypage.action.modifyComplete"/>
 	 </button>
 	 <button type="submit" id="btnGoback" class="modalSubmit">
 	 	<spring:message code="mypage.action.goback"/>
 	 </button>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script>
	$(document).ready(function() {
		var formObj = $("#mypage");
		
		$("#btnModifyComplete").on("click", function() {
			var userPw = $("#userPw").val();
			var confirmPw = $("#confirmPw").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			
			var regex1 = /^(?=.*[a-zA-Z0-9])[a-zA-Z0-9!@#%^&*]{4,12}$/;
			
			if(userPw.length == 0 || userPw == ""){
				alert("패스워드는 필수 입력 사항입니다.");
			}else if(!regex1.test(userPw)){
				alert("올바른 형식의 패스워드를 입력해주세요.");
			}else if(confirmPw.length == 0 || confirmPw ==""){
				alert("패스워드 확인을 위해 재입력해주세요");
			}else if(userPw !== confirmPw){
				alert("패스워드가 일치하지 않습니다.");
			}else if(name.length == 0 || name ==""){
				alert("이름 입력은 필수입니다.");
			}else if(phone.length == 0 || phone == ""){
				alert("전화번호 입력은 필수입니다.");
			}else if(email.length == 0 || email == ""){
				alert("이메일 입력은 필수입니다.");	
			}else{
				formObj.submit();
				alert("내정보 수정이 완료되었습니다.");
			}
	});
	    $("#btnGoback").on("click", function() {
		    window.location = "/client/mypages/myPageInfo";
	});
			
	});
</script>