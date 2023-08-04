<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<c:set var="count"
	value="${(pagination.pageRequest.page -1) * pagination.pageRequest.sizePerPage}" />
<h2>
	<spring:message code="common.reviewBoard" />
</h2>

<br>

<div class="container ">
<form:form id="reviewForm" modelAttribute="pgrq" method="get"
	action="reviewList${pgrq.toUriStringByPage(1)}">
	
	<div class="d-flex justify-content-center align-items-center">
		<div class="col-sm-2 mx-2">
		<select class="form-select" aria-label="Default select example" name="keyword" id="selectStar">
			<option value="0" <c:if test="${keyword eq '0'}">selected</c:if>>별표 선택</option>
			<option value="1" <c:if test="${keyword eq '1'}">selected</c:if>>★</option>
			<option value="2" <c:if test="${keyword eq '2'}">selected</c:if>>★★</option>
			<option value="3" <c:if test="${keyword eq '3'}">selected</c:if>>★★★</option>
			<option value="4" <c:if test="${keyword eq '4'}">selected</c:if>>★★★★</option>
			<option value="5" <c:if test="${keyword eq '5'}">selected</c:if>>★★★★★</option>
		</select>
		</div>
		<button type="button" class="btn btn-primary col-sm-1" id='searchBtn'>
			<spring:message code="action.search" />
		</button>
	</div>

</form:form>

<br>

	<table class="table table-hover w-75">
		<thead>
			<tr align="center">
				<th scope="col"><spring:message code="review.no" /></th>
				<th scope="col"><spring:message code="review.grade" /></th>
				<th scope="col"><spring:message code="review.content" /></th>
				<th scope="col"><spring:message code="review.date" /></th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="review" varStatus="status">
						<tr>

							<td align="center">${count+ status.index + 1 }</td>
							<td align="center"><c:choose>
									<c:when test="${review.reviewGrade == 1}">★</c:when>
									<c:when test="${review.reviewGrade == 2}">★★</c:when>
									<c:when test="${review.reviewGrade == 3}">★★★</c:when>
									<c:when test="${review.reviewGrade == 4}">★★★★</c:when>
									<c:when test="${review.reviewGrade == 5}">★★★★★</c:when>
									<c:otherwise>Unknown</c:otherwise>
								</c:choose></td>


							<!-- 게시글 상세보기할 때 페이징 요청 정보를 매개변수로 전달한다. -->
							<td align="center"><a
								href="/client/review/reviewDetail${pagination.makeQuery(pagination.pageRequest.page)}&reviewNo=${review.reviewNo}">
									${fn:substring(review.reviewContent, 0, 20)} </a></td>


							<td align="center"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm:ss" value="${review.reviewDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>


<!-- 페이징 네비게이션 -->
<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><c:if test="${pagination.prev}">
					<a class="page-link" href="${pagination.startPage - 1}" aria-label="Previous"> 
					<span aria-hidden="true">&laquo;</span>
					</a>
				</c:if></li>
				
			<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
				<li class="page-item">
				<a class="page-link" href="/client/review/reviewList${pagination.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<li class="page-item"><c:if test="${pagination.next && pagination.endPage > 0}">
					<a class="page-link" href="${pagination.endPage + 1}" aria-label="Next"> 
					<span aria-hidden="true">&raquo;</span>
					</a>
				</c:if></li>
		</ul>
	</nav>
</div>

	<button type="button" class="btn btn-primary" id="btnWrite">
		<spring:message code="review.write" />
	</button>

</div>

<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='review.registerSuccess' />")

	};
</script>


<script>
	$(document).ready(function() {
		$("#searchBtn").on("click", function() {
			if ($("#selectStar option:selected").val() == 0) {
				alert("평점을 선택해주세요.");
				return;
			} else {
				var formObj = $("#reviewForm");
				formObj.submit();
			}
		});

		$("#btnWrite").on("click", function(event) {
			$.ajax({
				url : "/client/review/checkRegister",
				contentType : "application/json; charset=UTF-8",
				type : "get",
				success : function(data) {

					if (data == "SUCCESS") {
						alert("글 쓰기 권한이 없습니다!!!");

					} else {
						location.href = "/client/review/reviewRegister";
					}
				}
			});
		});

	});
</script>
