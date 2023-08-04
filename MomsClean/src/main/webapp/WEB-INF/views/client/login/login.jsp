<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
   <style>
    /* 로그인 창 스타일 */
    .login-box {
        padding: 20px;
        width: 300px;
        margin: 0 auto;
         /* 연한 베이지색 배경색으로 변경 */
    }

    /* 입력창 스타일 */
    input[type="text"],
    input[type="password"] {
        margin-bottom: 10px;
        border: 1px solid #a2c3db; /* 입력창 테두리 스타일을 연한 파란색으로 변경 */
        padding: 10px; /* 입력창 내용과 테두리 사이의 여백을 조정합니다. */
        border-radius: 4px; /* 입력창을 둥글게 처리합니다. */
        width: 100%; /* 입력창의 너비를 100%로 설정하여 부모 요소 크기에 맞게 조정합니다. */
        background-color: #f7f7f7; /* 입력창의 배경색을 연한 베이지색으로 설정합니다. */
    }

    /* 로그인 버튼 스타일 */
    #sub {
        background-color: #007BFF;
        color: #fff;
        border: 2px solid #a2c3db; /* 버튼의 테두리를 연한 파란색으로 설정합니다. */
        padding: 12px 24px; /* 버튼의 패딩을 크게 조정합니다. */
        cursor: pointer;
        float: right;
        border-radius: 4px;
        font-size: 16px; /* 버튼 텍스트의 크기를 크게 설정합니다. */
    }

    /* 버튼 마우스 오버 효과 */
    #sub:hover {
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
</style>
</head>
<body>
    <div class="login-box">
        <h2>로그인</h2>
        <form action="login" method="post">
            <label for="username">아이디</label><br>
            <input type="text" id="username" name="username" /><br>

            <label for="password">비밀번호</label><br>
            <input type="password" id="password" name="password" />

            <button type="button" id="sub">로그인</button>
        </form>

        <!-- 아이디/비밀번호 찾기 링크와 회원가입 링크 -->
        <p><a href="/client/login/findId">아이디/비밀번호 찾기</a><br> <a href="/client/user/agreement">회원가입</a></p>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 페이지가 로드된 후 실행될 함수
        $(document).ready(function () {
            // 로그인 버튼 클릭 이벤트 처리
            $('#sub').on('click', function (event) {
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $('form').serialize(),
                    dataType: 'text',
                    success: function (data) {
                        alert("로그인 성공. 메인페이지로 이동합니다.");
                        window.location = "/client/page";
                    },
                    error: function () {
                        alert('로그인 실패. 아이디와 비밀번호를 확인해주세요.');
                        window.location.reload();
                        // 로그인 실패 시 페이지를 새로고침하여 다시 로그인 페이지로 이동
                    }
                });
            });
        });
    </script>
</body>
</html>

