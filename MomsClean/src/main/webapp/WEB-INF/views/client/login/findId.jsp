<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ID 찾기</title>
    <style>
        .login-box {
            padding: 20px;
            width: 300px;
            margin: 0 auto;
            background-color: #f7f7f7; /* 연한 베이지색 배경색으로 변경 */
        }

        .input-container {
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            margin-bottom: 10px;
            border: 1px solid #a2c3db; /* 입력창 테두리 스타일을 연한 파란색으로 변경 */
            padding: 10px; /* 입력창 내용과 테두리 사이의 여백을 조정합니다. */
            border-radius: 4px; /* 입력창을 둥글게 처리합니다. */
            width: 100%; /* 입력창의 너비를 100%로 설정하여 부모 요소 크기에 맞게 조정합니다. */
            background-color: #f7f7f7; /* 입력창의 배경색을 연한 베이지색으로 설정합니다. */
        }

        #sub {
            background-color: #007BFF;
            color: #fff;
            border: 2px solid #a2c3db; /* 버튼의 테두리를 연한 파란색으로 설정합니다. */
            padding: 12px 24px; /* 버튼의 패딩을 크게 조정합니다. */
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            max-width: 400px; /* 버튼 텍스트의 크기를 크게 설정합니다. */
        }

        #sub:hover {
            background-color: #a2c3db; /* 파스텔 파란색으로 변경 */
            border-color: #d9e1e7; /* 테두리 색상을 연한 파란색으로 변경 */
            box-shadow: 0 0 5px #007BFF; /* 호버 효과에 파란색 박스 스타일 적용 */
        }

        p a {
            font-size: 12px;
            color: #007BFF; /* 링크 색상을 파란색으로 설정합니다. */
            text-decoration: underline;
        }

        p a:last-child {
            margin-left: 10px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .button-container .login-btn {
            font-size: 16px;
            color: #007BFF;
            text-decoration: underline;
            cursor: pointer;
        }

        .button-container .reset-btn {
            font-size: 16px;
            color: #007BFF;
            text-decoration: underline;
            cursor: pointer;
            margin-left: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function findId() {
            var userName = $("#userName").val();
            var userEmail = $("#userEmail").val();

            $.ajax({
                type: "POST",
                url: "/client/login/findId",
                data: {
                    userName: userName,
                    userEmail: userEmail
                },
                success: function(data) {
                    alert("ID는 " + data + " 입니다.");
                },
                error: function() {
                    alert("ID를 찾을 수 없습니다.");
                }
            });
        }
        
        function findPw() {
            var userId = $("#userId").val();
            var userName = $("#userNameForPw").val();
            var userEmail = $("#userEmailForPw").val();

            $.ajax({
                type: "POST",
                url: "/client/login/findPw",
                data: {
                    userId: userId,
                    userName: userName,
                    userEmail: userEmail
                },
                success: function(data) {
                    alert("비밀번호는 " + data + " 입니다.");
                },
                error: function() {
                    alert("비밀번호를 찾을 수 없습니다.");
                }
            });
        }
        
        function goToLoginPage() {
            window.location.href = "/client/login/login";
        }
        
        function resetForm() {
            $("#userName").val("");
            $("#userEmail").val("");
            $("#userId").val("");
            $("#userNameForPw").val("");
            $("#userEmailForPw").val("");
        }
    </script>
</head>
<body>
    <div class="login-box">
        <h1>ID 찾기</h1>
        <form>
            <div class="input-container">
                <input type="text" id="userName" name="userName" placeholder="이름">
            </div>
            <div class="input-container">
                <input type="text" id="userEmail" name="userEmail" placeholder="이메일">
            </div>
            <div class="button-container">
                <input type="button" value="ID 찾기" onclick="findId()" id="sub">
            </div>
        </form>

        <br><br>
        <h1>비밀번호 찾기</h1>
        <form>
            <div class="input-container">
                <input type="text" id="userId" name="userId" placeholder="아이디">
            </div>
            <div class="input-container">
                <input type="text" id="userNameForPw" name="userNameForPw" placeholder="이름">
            </div>
            <div class="input-container">
                <input type="text" id="userEmailForPw" name="userEmailForPw" placeholder="이메일">
            </div>
            <div class="button-container">
                <input type="button" value="PW 찾기" onclick="findPw()" id="sub">
            </div>
        </form>

        <div class="button-container">
            <p class="login-btn" onclick="goToLoginPage()">로그인 하기</p>
            <p class="reset-btn" onclick="resetForm()">다시 입력</p>
        </div>
    </div>
</body>
</html>

