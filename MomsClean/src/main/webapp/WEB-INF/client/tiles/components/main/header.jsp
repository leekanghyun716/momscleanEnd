<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');
   
.font {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

hr {
	border: none;
	border-top: 1px solid #ccc;
	margin: 20px 0;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<div align="center">

	<h1>
		<a href="../../client/page" class="font">MOM'S CLEAN</a>
	</h1>

</div>

<div align="right">

	<table>

		<tr>
		
	 <% Object userObj1 = session.getAttribute("user");
    if (userObj1 == null) {%>
   <td width="80"><a href="/client/login/login"><spring:message code="header.login" /></a></td>
   <td width="80"><a href="/client/user/agreement"><spring:message code="header.joinMember" /></a></td>
<%
    }
%>
        <% Object userObj = session.getAttribute("user");
    if (userObj != null) { %>
    <td width ="90"><a href="/client/mypages/myPageInfo"><spring:message code="header.mypage"/></a>&nbsp;&nbsp; </td>
    <td width="90"><a href="/client/login/logoutSuccess"><spring:message code="mypage.action.logout"/></a></td>
    
<%
    }
%>
				
			
		</tr>
		<!-- 로그인을 거친 인증된 사용자인 경우 사용자명을 보여주고 로그아웃 페이지로 이동할 수 있게 한다. -->


	</table>
</div>
<hr>

