<%@ page language="java"  contentType="text/html;  charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
h2 {
    color: #007bff; /* Blue color */
}
div{
	color:#007bff;
}


 

</style>
<h2><spring:message code="notice.header.read"/></h2>

<form:form modelAttribute="notice">
<form:hidden path = "noticeNo" />

<table>
	<tr>
		<td><spring:message code="notice.title"/></td>
		<td><form:input path="noticeTitle" readonly="true" /></td>
		<td><font color="red"><form:errors path="noticeTitle"/></font></td>
	</tr>
	
	<tr>
		<td><spring:message code="notice.content"/></td>
		<td><form:textarea path="noticeContent"
							readonly="true" rows="20" cols="80" /></td>
		
		
	</tr>
				
</table>
</form:form>



<div>
<a href="/client/notice/noticeList?page=1&perPageNum=10"><button type="submit" id="btnList"><spring:message code="action.list"/></button></a><!-- 목록 클릭시 목로페이지로 -->
</div>

<div align="right">
 <div valign="bottom" style="opacity:0.7;"> <img src="/img/logo/notice.png"></div>
</div>

<script>
	$(document).ready(function(){
		var formObj = $("#notice");
		
	 $("#btnList").on("click", function(){
		self.location = "list"; 
	 });
	});

</script>

