<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	
<style>

.quickmenu{
      
   position: fixed;
   top: 50;
   right: 0;
    
    }   
</style>

<div align="right">
 <div style="opacity:0.7;" class="quickmenu"><img src="/img/logo/reviews.png"></div>
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
<div class="container">
	<form:form id="reviewForm" modelAttribute="review"
		action="reviewRegister">
		<form:hidden path="reserveNo" value="${review.reserveNo}" />
		<form:hidden path="userNo" value="${review.userNo}" />

		<table class="table w-75">
			<thead>
				<th colspan="2" class="text-center p-3">
					<h2>
						<spring:message code="review.register" />
					</h2>
				</th>
			</thead>
			<tbody class="table-group-divider">
				
				<tr>
					<td class="w-25 p-3"><spring:message code="review.serviceName" /></td>
					<td class="p-3">${serviceName}SET</td>
				</tr>
				
				<tr>
					<td class="w-25 p-3"><spring:message code="review.grade" /></td>
					<td class="p-3">
						<div class="d-flex align-items-center">
						<form:radiobutton class="form-check-input" path="reviewGrade" value="1" /><span class="fs-5">★ &nbsp;</span> 
						<form:radiobutton class="form-check-input" path="reviewGrade" value="2" /><span class="fs-5">★★ &nbsp;</span> 
						<form:radiobutton class="form-check-input" path="reviewGrade" value="3" /><span class="fs-5">★★★ &nbsp;</span> 
						<form:radiobutton class="form-check-input" path="reviewGrade" value="4" /><span class="fs-5">★★★★ &nbsp;</span> 
						<form:radiobutton class="form-check-input" path="reviewGrade" value="5" /><span class="fs-5">★★★★★ &nbsp;</span> 
						</div> 
					</td>
				</tr>
				
				<tr>
					<td class="w-25" valign="middle">
					<spring:message code="review.content" /><br>(400자 제한)</td>
					<td class="w-75"><form:textarea path="reviewContent" rows="20"
							cols="100" id="reviewContent" /></td>
				</tr>
				
			</tbody>
		</table>
	</form:form>

	<div>
		<button type="submit" class="btn btn-primary col-sm-1" id="btnRegister">
			<spring:message code="review.save" />
		</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#reviewForm");

		var reviewGrade

		$("#btnRegister").on("click", function() {
			var reviewContent = $("#reviewContent");

			if ($("input[name='reviewGrade']:checked").length == 0) {

				alert("평점을 선택해주세요.");
				return;
			}

			if (reviewContent.val().length == 0 || reviewContent.val() == '') {
				alert('글 내용을 입력해 주세요.');
				return;
			}

			if (reviewContent.val().length > 400) {
				alert('400자 미만으로 입력해주세요');
				return;
			}

			formObj.submit();
		});
	});
</script>
