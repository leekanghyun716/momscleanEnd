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

	<form:form modelAttribute="review">
		<form:hidden path="reviewNo" />

		<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
		<input type="hidden" name="page" value="${pqrq.page}">
		<input type="hidden" name="sizePerPage" value="${pqrq.sizePerPage}">

		<table class="table w-75">
			<thead >
				<th colspan="2" class="text-center p-3">
					<h2>
						<spring:message code="common.reviewBoard" />
					</h2>
				</th>
			</thead>
			
			<tbody class="table-group-divider">
				<tr>
					<td class="w-25"><spring:message code="review.serviceName" /></td>
					<td>${serviceName} SET</td>
				</tr>
				
				<tr>
					<td class="w-25"><spring:message code="review.grade" /></td>
					<td><span id="gradeContainer"></span>
					</td>
				</tr>
				
				<tr>
					<td class="w-25"><spring:message code="review.content" /></td>
					<td class="w-75"><form:textarea path="reviewContent"
							readonly="true" rows="20" cols="100" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</div>

<div>

	<button type="submit" class="btn btn-primary col-sm-1 mt-3" id="btnList">
		<spring:message code="common.list" />
	</button>
</div>

<script>
	$(document).ready(function() {
		var formObj = $("#reviewForm");

		// 현재 페이지 번호와 페이징 크기
		var pageObj = $("#page");
		var sizePerPageObj = $("#sizePerPage");
		var pageVal = pageObj.val();
		var sizePerPageVal = sizePerPageObj.val();

		var reviewGrade = "${review.reviewGrade}";
		var stars = "★".repeat(reviewGrade);
		$("#gradeContainer").append('<font">' + stars + '</font>');

		$("#btnList").on("click", function() {
			self.location = "/client/review/reviewList";
		});
	});
</script>