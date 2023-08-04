<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>회원 등록</title>
   <style>
    /* 로그인 창 스타일 */
    .login-box {
        padding: 20px;
        width: 300px;
        margin: 0 auto;
        background-color: #f8f8f8; /* 연한 베이지색 배경색으로 변경 */
    }

    /* 입력창 스타일 */
    input[type="text"],
    input[type="password"] {
        margin-bottom: 10px;
        border: 1px solid #a2c3db; /* 입력창 테두리 스타일을 연한 파란색으로 변경 */
        padding: 10px; /* 입력창 내용과 테두리 사이의 여백을 조정합니다. */
        border-radius: 4px; /* 입력창을 둥글게 처리합니다. */
        width: 100%; /* 입력창의 너비를 100%로 설정하여 부모 요소 크기에 맞게 조정합니다. */
        background-color: #f0f0f0; /* 입력창의 배경색을 연한 베이지색으로 설정합니다. */
    }

      /* 중복확인 버튼 스타일 */
    .check-duplicate-button {
        background-color: #007BFF;
        color: #fff;
        border: 2px solid #a2c3db;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
        margin-left: 30px; /* 오른쪽으로 이동 */
        margin-top: -10px; /* 위로 이동 */
    }

    /* 등록 버튼 스타일 */
    #btnRegister {
        background-color: #007BFF;
        color: #fff;
        border: 2px solid #a2c3db;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px; 
    }

    /* 돌아가기 버튼 스타일 */
    .next-button {
        background-color: #007BFF;
        color: #fff;
        border: 2px solid #a2c3db;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
    }

    /* 버튼 마우스 오버 효과 */
    .check-duplicate-button:hover,
    #btnRegister:hover,
    .next-button:hover {
        background-color: #a2c3db; /* 파스텔 파란색으로 변경 */
        border-color: #d9e1e7; /* 테두리 색상을 연한 파란색으로 변경 */
        box-shadow: 0 0 5px #007BFF; /* 테두리 색상을 연한 파란색으로 변경 */
    }

    /* 아이디/비밀번호 찾기, 회원가입 링크 스타일 */
    p a {
        font-size: 12px;
        color: #007BFF; /* 링크 색상을 파란색으로 설정합니다. */
        text-decoration: underline;
    }

    /* 회원가입 링크 스타일 */
    p a:last-child {
        margin-left: 10px;
    }
    
      #userIdErrorMessage {
        color: red;
    }
</style>
</head>
<body>
	
	<h2>
		<spring:message code="user.header.register" />
	</h2>
	<form:form modelAttribute="user" action="register">
		<table>
			<tr>
            <td><spring:message code="user.userId" /></td>
            <td><form:input path="userId" id="userId" /></td>
            <td>
                   <span id="userIdErrorMessage"></span>
                <span id="duplicateIdMessage"></span>
            </td>
            <td>
                <button type="button" class="check-duplicate-button" onclick="checkDuplicateId()">중복확인</button>
            </td>
			

			<tr>
				<td><spring:message code="user.userPw" /></td>
				<td><form:input path="userPw" /></td>
				<td><font color="red"><form:errors path="userPw" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.confirmPassword" /></td>
				<td><form:input path="confirmPassword" /></td>
				<td><font color="red"><form:errors
							path="confirmPassword" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userName" /></td>
				<td><form:input path="userName" /></td>
				<td><font color="red"><form:errors path="userName" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userPhone" /></td>
				<td><form:input path="userPhone" /></td>
				<td><font color="red"><form:errors path="userPhone" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.userEmail" /></td>
				<td><form:input path="userEmail" /></td>
				<td><font color="red"><form:errors path="userEmail" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="user.emailAuth" /></td>
				<td><form:checkbox path="emailAuth" /></td>
				<td><font color="red"><form:errors path="emailAuth" /></font></td>
			</tr>
			<!--   <tr>
                <td><spring:message code="user.userDivision" /></td>
                <td><form:input path="userDivision" /></td>
                <td><font color="red"><form:errors path="userDivision" /></font></td>
            </tr>  -->
		</table>
		 <div class="button-container">
            <button type="submit" id="btnRegister">
                <spring:message code="action.register" />
            </button>
            <!-- 돌아가기 버튼 -->
            <button type="submit" formaction="/client/user/agreement" class="next-button">돌아가기</button>
        </div>
	</form:form>

	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    var isDuplicateChecked = false;

    function checkDuplicateId() {
        var userId = $("#userId").val().trim();
        if (userId === "") {
            alert("아이디를 입력해주세요.");
            return;
        }

        $.ajax({
            url: "/client/user/checkDuplicateId", // 중복확인을 위한 컨트롤러의 URL
            type: "GET",
            data: {
                userId: userId
            },
            success: function(data) {
                if (data) {
                    alert("입력하신 아이디는 사용이 가능합니다.");
                    $("#btnRegister").prop("disabled", false); // 등록 버튼 활성화
                } else {
                    alert("입력하신 아이디는 사용이 불가능합니다.");
                    $("#btnRegister").prop("disabled", true); // 등록 버튼 비활성화
                }
                isDuplicateChecked = true;
            },
            error: function(xhr, status, error) {
                alert("서버 오류로 중복 확인에 실패하였습니다.");
            }
        });
    }

    $(document).ready(function() {
        $("#btnRegister").on("click", function() {
            if (!isDuplicateChecked) {
                alert("아이디 중복 확인을 해주세요.");
                return false; // 폼 제출을 막음
            }
        });
    });
</script>

</body>
</html>