<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>


@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');

 @font-face {
    font-family: 'IBM Plex Sans KR', sans-serif;
    
}


   td.row:hover { background-color: lightyellow; }

</style>



<div align="center" >
<h2 class="font">
	<spring:message code="mypage.header.reserveList" />
</h2>
<br>
<form:form modelAttribute="list" >
	

<table border="2", style="border:2px solid #DCDCDC;">
   
	<tr>
	    
		<th align="center" style="font-size: 18px;"><spring:message code="mypage.reserveNo" /></th>

		<th align="center" style="font-size: 18px;" ><spring:message code="mypage.userName" /></th>

		<th align="center" style="font-size: 18px;" ><spring:message code="mypage.itemInfo" /></th>
		
		<th align="center" style="font-size: 18px;"><spring:message code="mypage.itemOption" /></th>

		<th align="center" style="font-size: 18px;"><spring:message code="mypage.cleanDate" /></th>
		
		<th align="center" style="font-size: 18px;"><spring:message code="mypage.reserveRequest"/><th>
	</tr>
	<c:choose>
	   <c:when test="${empty list}">
	    <tr class="row">
	         <td colspan="5">
	                 <spring:message code="mypage.listEmpty"/>
	                 </td>
	   </tr>
	  </c:when>
	  
	  <c:otherwise>
	        <c:forEach items="${list}" var="list">
	            <tr>
	                 
	                   <td  align="center" style="font-size: 18px;" class="row"><a href="/client/mypages/myPageReserveInfo${pagination.makeQuery(pagination.pageRequest.page)}&reserveNo=${list.reserveNo}">${list.reserveNo}</a></td>
	                   <td  align="center" style="font-size: 18px; color="#"" >${list.userName}</td>
	                   <td  align="center" style="font-size: 18px;">${list.reserveItemName}</td>
	                   <td  align="center" style="font-size: 18px;">${list.reserveOptionName}</td>
	                   <td  align="center" style="font-size: 18px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.cleanDate}"/></td>
	                   <td  align="center" width="80" style="font-size: 18px;">${list.reserveRequest}</td>
	           </tr>
	        </c:forEach>       
	  </c:otherwise>
	 </c:choose>
	  </table>
	
	  </form:form>
	
	  <!-- 페이징 네비게이션 -->
	  <br>
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
				<a class="page-link" href="/client/mypages/myPageReserveList${pagination.makeQuery(idx)}">${idx}</a>
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
</div>





