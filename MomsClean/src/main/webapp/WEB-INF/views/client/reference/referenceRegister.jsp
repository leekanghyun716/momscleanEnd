<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.quickmenu{
      
   position: fixed;
   top: 50;
   right: 0;
    
    }   
</style>

<div align="right">
 <div style="opacity:0.7;" class="quickmenu"><img src="/img/logo/qnaboard.png"></div>
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

<h2>
	<spring:message code="reference.header.register" />
</h2>
<form:form id="referRegister" modelAttribute="reference" action="referenceRegister">
<form:hidden path="userNo" value="${reference.userNo}" />
	<table>
		<tr>
			<td><spring:message code="reference.title" /></td>
			<td><form:input path="referenceTitle" style="width:715px;"/></td>
			<td><font color="red"><form:errors path="referenceTitle" /></font></td>
		</tr>
		<tr>
			<td><spring:message code="reference.writer" /></td>
			<td>${referenceName}</td>
			<td><font color="red"></font></td>
		</tr>
		<tr>
			<td><spring:message code="reference.content" />
			
			<td><form:textarea path="referenceContent" rows="20" cols="100" /></td>
			<td><font color="red"><form:errors path="referenceContent" /></font></td>
		</tr>
	</table>
</form:form>
<div>
	
		<button type="submit" id="btnRegister">
			<spring:message code="action.register" />
		</button>
	
	<button type="submit" id="btnList">
		<spring:message code="action.list" />
	</button>
</div>


<script>
	$(document).ready(function() {
		var formObj = $("#referRegister");
		$("#btnRegister").on("click", function() {
			// 알림창 띄우기
            alert("주말, 공휴일 제외, 24시간 이내 답변 드리겠습니다.");
			formObj.submit();//폼 제출
		});
		$("#btnList").on("click", function() {
			// 알림창 띄우기
            alert("주말, 공휴일 제외, 24시간 이내 답변 드리겠습니다.");
			self.location = "/client/reference/referenceList";//페이지 이동
		});
	});
</script>