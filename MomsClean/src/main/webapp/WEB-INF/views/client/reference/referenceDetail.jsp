<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
.quickmenu {
   position: fixed;
   top: 50;
   right: 0;
}
</style>

<div align="right">
   <div style="opacity: 0.7;" class="quickmenu">
      <img src="/img/logo/notice.png">
   </div>
</div>
<script>
   $(document).ready(function() {
      var currentPosition = parseInt($(".quickmenu").css("top"));
      $(window).scroll(function() {
         var position = $(window).scrollTop();
         $(".quickmenu").stop().animate({
            "top" : position + currentPosition + "px"
         }, 1000);
      });
   });
</script>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<h2>문의게시판 상세페이지</h2>
<form:form id="referForm" modelAttribute="reference">
   <form:hidden path="referenceNo" />
   <form:hidden path="userName" />
   <input type="hidden" value="${reference.userName}" id="userId"/>
   <input type="hidden" id="userId2" value="${user.userName}">
   <table>
      <tr>
         <td><spring:message code="reference.title" /></td>
         <td><form:input path="referenceTitle" readonly="true"
               style="width:715px;" /></td>
         <td><font color="red"><form:errors path="referenceTitle" /></font></td>
      </tr>
      <tr>
         <td><spring:message code="reference.writer" /></td>
         <td align="center"><c:choose>
               <c:when test="${empty reference.no}">
                  <b>관리자</b>
               </c:when>
               <c:otherwise>
          ${reference.userName}
        </c:otherwise>
            </c:choose></td>

         <td><font color="red"></font></td>
      </tr>
      <tr>
         <td><spring:message code="reference.content" />
         <td><form:textarea path="referenceContent" readonly="true"
               rows="20" cols="100" /></td>
         <td><font color="red"><form:errors
                  path="referenceContent" /></font></td>
      </tr>
   </table>
</form:form>
<div>


   <c:choose>
      <c:when test="${empty reference.no}">
         <!-- reference.no가 비어있거나 null인 경우에는 아무 동작을 하지 않음 -->
      </c:when>
      <c:otherwise>
         <!-- reference.no가 null이 아닌 경우에는 수정 버튼이 나타남 -->
         <button type="submit" id="btnModify">수정</button>
      </c:otherwise>
   </c:choose>
   <button type="submit" id="btnList">목록</button>
</div>


<script>
   $(document)
         .ready(
               function() {
                  var formObj = $("#referForm");
                  //수정 버튼을 클릭시,삭제 불가능 메시지를 보여줍니다.
                  var uid = $("#userId2").val();
                  var userId = $("#userId").val();
                  $("#btnModify")
                        .on(
                              "click",
                              function() {
                                 // user 객체와 uid 객체가 모두 존재하고 userId 속성이 일치하지 않는 경우
                                 if (uid === null || uid !== userId) {
                                    alert("권한이 없습니다.");

                                    return;
                                 }
                                 var referenceNo = $("#referenceNo");
                                 var referenceNoVal = referenceNo
                                       .val();

                                 //수정 불가능 메시지 출력
                                 var confirmMessage = "삭제를 원하시면 운영자에게 문의해주세요"
                                 var confirmResult = confirm(confirmMessage);

                                 if (!confirmResult) {
                                    return false; // 버튼 클릭 동작 취소
                                 }
                                 self.location = "/client/reference/referenceModify?referenceNo="
                                       + referenceNoVal;
                              });

                  $("#btnList").on("click", function() {
                     self.location = "/client/reference/referenceList";
                  });
               });
</script>