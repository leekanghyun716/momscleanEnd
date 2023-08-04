<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<style>
/* CSS for the table */
th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #blue;
}

th {
	background-color: #f2f2f2;
}

/* CSS for the pagination navigation */
.pagination {
	display: inline-block;
	padding: 8px;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
}

.pagination a:hover {
	background-color: #f2f2f2;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<h2>
		<spring:message code="notice.header.list" />
	</h2>

	<table>
		<tr>
			<th width="80"><spring:message code="notice.no" /></th>
			<th width="320"><spring:message code="notice.title" /></th>
			<th width="180"><spring:message code="notice.regdate" /></th>
		</tr>

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="3"><spring:message code="empty" /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="notice">
					<tr>
						<td>${notice.noticeNo}</td>
						<td><a
							href="/client/notice/noticeDetail${pagination.makeQuery(pagination.pageRequest.page)}&noticeNo=${notice.noticeNo}">
								${notice.noticeTitle} </a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${notice.noticeDate}" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<!-- 페이징 네비게이션 -->
	<div class="pagination">
		<c:if test="${pagination.prev && pagination.endPage > 0}">
			<a
				href="/client/notice/noticeList${pagination.makeQuery(pagination.startPage -1)}">&laquo;</a>


		</c:if>






		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
			var="idx">


			<a href="/client/notice/noticeList${pagination.makeQuery(idx)}">${idx}</a>
		</c:forEach>

		<c:if test="${pagination.next && pagination.endPage > 0}">
			<a
				href="/client/notice/noticeList${pagination.makeQuery(pagination.endPage +1)}">&raquo;</a>


		</c:if>

	</div>

</body>
</html>
