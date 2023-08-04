<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>약관 동의</title>
   <style>
    /* 약관 내용을 담을 div 영역의 스타일 */
    .agreement-content {
        max-height: 150px; /* 최대 높이를 설정하여 스크롤이 나타날 기준을 정합니다. */
        overflow-y: auto; /* 스크롤 기능을 추가합니다. */
        margin-bottom: 10px; /* 약관 간의 간격을 조정합니다. */
        border: 1px solid #a2c3db; /* 테두리 스타일을 연한 파란색으로 변경 */
        padding: 10px; /* 내용과 테두리 사이의 여백을 조정합니다. */
        background-color: #f7f7f7; /* 연한 회색 배경색을 설정합니다. */
    }

    /* 체크박스 스타일 */
    input[type="checkbox"] {
        margin-right: 5px;
    }

    /* 버튼 스타일 */
    .light-blue-button {
         background-color: #007BFF;
        color: #fff;
        border: 2px solid #a2c3db; /* 버튼의 테두리를 파란색으로 설정합니다. */
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
    }

    /* 버튼 마우스 오버 효과 */
    .light-blue-button:hover {
        background-color: #a2c3db; /* 파스텔 파란색으로 변경 */
        border-color: #d9e1e7; /* 테두리 색상을 연한 파란색으로 변경 */
        box-shadow: 0 0 5px #007BFF; /* 파스텔 파란색으로 변경 */
    }
</style>
    <script>
    
    function goToLoginPage() {
        window.location.href = "/client/login/login";
    }
        function checkAgreement() {
            var agreement1 = document.getElementById("agreement1");
            var agreement2 = document.getElementById("agreement2");

            if (!agreement1.checked || !agreement2.checked) {
                alert("모든 약관에 동의 후 가입이 가능합니다.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h2>약관 동의</h2>
    <form action="/client/user/agreement" method="post" onsubmit="return checkAgreement();">
        <!-- 첫 번째 약관 -->
        <div class="agreement-content">
            <p><strong>서비스 이용 약관</strong></p>
            <p>제1조 (목적)</p>
            <p>본 약관은 Mom's Clean (이하 "회사")이 제공하는 [서비스명] 서비스의 이용 조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.</p>
            <p>제2조 (약관의 효력 및 변경)</p>
            <p>1. 이 약관은 서비스를 이용하고자 하는 모든 이용자에게 적용되며, 이용자는 본 약관에 동의함으로써 서비스를 이용할 수 있습니다.</p>
            <p>2. 회사는 필요 시 약관을 변경할 수 있으며, 변경된 약관은 회사 웹사이트를 통해 공지됩니다.</p>
            <p>제3조 (서비스의 제공 및 이용)</p>
            <p>1. 회사는 이용자에게 [서비스명] 서비스를 제공합니다. 서비스의 구체적인 내용과 이용 방법은 회사 웹사이트에서 안내합니다.</p>
            <p>2. 이용자는 회사가 제공하는 서비스를 약관에 따라 이용해야 하며, 타인의 권리를 침해하지 않아야 합니다.</p>
            <p>제4조 (이용자의 의무)</p>
            <p>1. 이용자는 회사가 제공하는 서비스를 이용함에 있어 다음의 의무를 준수해야 합니다.</p>
            <p>   가. 회사에 정확하고 최신의 개인 정보를 제공해야 합니다.</p>
            <p>   나. 서비스 이용 중 발생한 모든 거래와 활동에 대해 책임을 져야 합니다.</p>
            <p>2. 이용자는 회사의 동의 없이 제3자에게 서비스 이용을 양도하거나 양수할 수 없습니다.</p>
            <p>제5조 (서비스의 변경 및 중단)</p>
            <p>1. 회사는 운영상 또는 기술적인 필요에 따라 서비스를 변경할 수 있으며, 변경 내용은 회사 웹사이트에서 공지됩니다.</p>
            <p>2. 회사는 특별한 사유가 없는 한 서비스를 계속 제공할 의무가 없으며, 서비스 중단 시 이용자에게 사전 공지합니다.</p>
            <p>제6조 (계약의 해지)</p>
            <p>1. 이용자는 언제든지 회사와의 서비스 이용 계약을 해지할 수 있습니다.</p>
            <p>2. 회사는 이용자가 본 약관 또는 관련 법규를 위반한 경우 이용 계약을 해지할 수 있습니다.</p>
            <p>제7조 (책임의 제한)</p>
            <p>회사는 무료로 제공하는 서비스와 관련하여 어떠한 손해에 대해서도 책임을 지지 않습니다.</p>
        </div>
		
		
		 <!-- 약관 동의 체크박스 -->
        <label>
            <input type="checkbox" id="agreement1" name="agreement1">
            서비스 이용 약관에 동의합니다.
        </label>
        <br>
        
        
        <!-- 두 번째 약관 -->
        <div class="agreement-content">
            <p><strong>개인정보 수집 및 이용 동의</strong></p>
            <p>제1조 (목적)</p>
            <p>본 약관은 Mom's Clean (이하 "회사")이 제공하는 [서비스명] 서비스 이용 시 개인정보를 수집하고 이용하는 조건 및 절차에 관한 사항을 규정함을 목적으로 합니다.</p>
            <p>제2조 (수집하는 개인정보의 항목)</p>
            <p>회사는 [서비스명] 서비스의 제공과 관련하여 다음과 같은 개인정보를 수집합니다.</p>
            <p>- 성명</p>
            <p>- 전화번호</p>
            <p>- 이메일 주소</p>
            <p>- 주소</p>
            <p>제3조 (개인정보의 수집 및 이용 목적)</p>
            <p>회사는 수집한 개인정보를 다음과 같은 목적으로 이용합니다.</p>
            <p>- [서비스명] 서비스 제공을 위한 회원 관리 및 서비스 제공</p>
            <p>- 고객 문의 응대 및 서비스 관련 문제 해결</p>
            <p>- 마케팅 및 이벤트 안내</p>
            <p>제4조 (개인정보의 보유 및 이용 기간)</p>
            <p>회사는 개인정보를 서비스 제공 및 관리의 목적을 달성하는 기간 동안 보유합니다. 단, 회원이 개인정보 삭제를 요청하는 경우 또는 법령에 따라 개인정보의 보존이 필요한 경우 해당 기간까지 개인정보를 보유합니다.</p>
            <p>제5조 (개인정보의 제3자 제공)</p>
            <p>회사는 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 법령에 따라 개인정보의 제공이 요구되는 경우, 또는 이용자의 사전 동의가 있는 경우에는 예외로 합니다.</p>
            <p>제6조 (개인정보의 파기)</p>
            <p>개인정보의 수집 및 이용 목적이 달성되거나 회원이 개인정보 삭제를 요청한 경우, 회사는 해당 개인정보를 즉시 파기합니다.</p>
            <p>제7조 (개인정보 보호 관련 문의처)</p>
            <p>개인정보와 관련하여 궁금한 사항이 있거나 개인정보 보호 관련 문의가 있는 경우, 아래 연락처로 문의하시기 바랍니다.</p>
            <p>[회사명]</p>
            <p>이메일: [회사 이메일]</p>
            <p>전화번호: [회사 전화번호]</p>
        </div>

     
        <label>
            <input type="checkbox" id="agreement2" name="agreement2">
            개인정보 수집 및 이용 동의에 동의합니다.
        </label>
        <br>
        
      <!-- 버튼 영역 -->
        <span>
            <input type="submit" value="다음" class="light-blue-button">
            <button onclick="goToLoginPage();" class="light-blue-button" type="button">돌아가기</button>
        </span>
    </form>

    <script>
        // 로그인 페이지로 이동하는 함수
        function goToLoginPage() {
            window.location.href = "/client/login/login";
        }
    </script>
</body>
</html>

