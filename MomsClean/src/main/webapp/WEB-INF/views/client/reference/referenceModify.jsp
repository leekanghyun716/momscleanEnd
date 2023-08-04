<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<h2>회원 문의게시판 수정하기</h2>
<form:form id="referForm" modelAttribute="reference" action="referenceModify">
	<form:hidden path="referenceNo" />
	<table>
		<tr>
			<td><spring:message code="reference.title" /></td>
			<td><form:input path="referenceTitle" /></td>
			<td><font color="red"><form:errors path="referenceTitle" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="reference.writer" /></td>
			<td>${referenceName}</td>
			<td><font color="red"></font></td>
		</tr>
		<tr>
			<td><spring:message code="reference.content" />
			<td><form:textarea path="referenceContent" rows="20" cols="100"/></td>
			<td><font color="red"><form:errors
						path="referenceContent" /></font></td>
		</tr>
	</table>
</form:form>
<div>

	<button type="submit" id="btnModify">수정하기</button>
	<button type="submit" id="btnList">목록</button>
</div>
<script>
	$(document).ready(function() {
		var formObj = $("#referForm");
		$("#btnModify").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/client/reference/referenceList";
		});
	});
</script>