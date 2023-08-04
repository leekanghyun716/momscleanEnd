<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">

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
	<h2 class="font" >
		<spring:message code="mypage.header.reserveInfo" />
	</h2>
<br>
	<form:form modelAttribute="read">
		<form:hidden path="reserveRequest" id="reserveRequest"/>

		<table>
			<tr>
				<td align="center" ><spring:message code="mypage.reserveNo" /></td>
				<td><form:input path="reserveNo" readonly="true" /></td>
			</tr>
			<td></td>
			<tr>
				<td align="center" ><spring:message code="mypage.userId" /></td>
				<td><form:input path="userId" readonly="true" /></td>
			</tr>
			<tr>
				<td rowspan="2" align="center"  ><spring:message
						code="mypage.itemInfo" /></td>
				<td><form:input path="reserveItemName" readonly="true" /></td>
			</tr>
			<tr>
				<td><form:input path="reserveItemPrice" readonly="true" />원
			</tr>
			</td>
			<tr>
				<td rowspan="2" align="center"  ><spring:message
						code="mypage.itemOption" /></td>
				<td><form:input path="reserveOptionName" readonly="true" /></td>
			</tr>
			<tr>
				<td><form:input path="reserveOptionPrice" readonly="true" />원</td>
			</tr>
			<tr>
				<td align="center"  ><spring:message code="mypage.reserveDate" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${read.reserveDate}" /></td>

			</tr>
			<tr>
				<td align="center" ><spring:message code="mypage.reserveState" /></td>
				<td><form:input path="reserveState" readonly="true" /></td>
			</tr>
			<tr>
				<td align="center"><spring:message code="mypage.cleanDone" /></td>
				<td><form:input path="cleanDone" id="cleandone" readonly="true" /></td>

			</tr>
		</table>
	</form:form>
	<br>
	<div>
		<button id="btnAddReserve" class="modalSubmit">
			<spring:message code="mypage.action.addReserve" />
		</button>

		<button id="btnCancel" class="modalSubmit">
			<spring:message code="mypage.action.cancelReserve" />
		</button>

		<button id="btnGoback" class="modalSubmit">
			<spring:message code="mypage.action.reserveList" />
		</button>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {
		var cleandoneValue = $("#cleandone").val();
		var reserveRequest = $("#reserveRequest").val();
		
		if (cleandoneValue === "Y" || reserveRequest === "취소요청" || reserveRequest === "취소완료") {
			
			$("#btnCancel").prop("disabled", true);
			alert("해당 예약건은 이미 예약취소신청을 하셨거나 취소완료 또는 이미 청소가 완료된건이므로 취소요청이 불가합니다.");
		}else {
			$("#btnCancel").prop("disabled",  false);
		}
	});
	$("#btnAddReserve").on("click", function(){
		self.location = "../item/itemInfo";
	});
	$("#btnCancel").on("click", function() {
			
		if(confirm("정말로 취소요청을 하시겠습니까?")){
			var reserveNo = $("#reserveNo").val();
			var userId = $("#userId").val();
			
		$.ajax ({
			url: "/client/mypages/myPageReserveInfo",
			method: "POST",
			data: {
				reserveNo: reserveNo,
				userId: userId
			},
			success : function(data, status, xhr){
				if(xhr.status === 200){
				alert("취소요청이 완료되었습니다.");
				window.location = "/client/mypages/myPageReserveList";
				
				}else{
					alert("취소요청이 실패되었습니다. 다시 시도해주세요.");
				}	
			} ,
			error: function(xhr, status, error){
				alert("취소요청이 완료되었습니다.");	
				window.location = "/client/mypages/myPageReserveList";
			} 	
		 }); 
			
		}
		
	});
	$("#btnGoback").on("click", function(){
		self.location = "/client/mypages/myPageReserveList";
	});
		
	

</script>