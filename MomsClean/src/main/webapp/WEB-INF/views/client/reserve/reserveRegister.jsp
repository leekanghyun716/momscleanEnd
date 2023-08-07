<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
 form {
        margin: 0;
        padding: 0;
    }

    /* Form container style */
    .reserveDiv {
        width: 100%;
        max-width: 1360px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        font-family: 'KCC-Ganpan';
    }

    /* Form header style */
    h2 {
        text-align: center;
        font-size: 28px;
        margin-bottom: 30px;
        color: #007bff;
    }

    /* Image style */
    img {
        display: block;
        margin: 0 auto;
        width: 400px;
    }

    /* Item description style */
    .itemFont {
        font-size: 35px;
        font-weight: bold;
        text-align: center;
        margin: 20px 0;
    }

    /* Table style */
    #table {
        width: 100%;
        border-collapse: collapse;
    }

   #th,
    #td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    #th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
    }

    /* Address input fields style */
    #member_post,
    #member_addr,
    #zonecode,
    #sang {
        width: 150px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* Datepicker input field style */
    #datepicker {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    /* Button container style */
    .btn-container {
        text-align: center;
        margin-top: 30px;
    }

    .btn-container button {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-right: 10px;
        border-radius: 5px;
    }

    /* 주소 검색 버튼 style */
    #btn-address {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-right: 10px;
        border-radius: 5px;
    }
     /* datepicker에 커스텀 스타일 적용 */
    .ui-datepicker {
        font-size: 16px;
    }

    /* datepicker 헤더 스타일 */
    .ui-datepicker-header {
        background-color: #007bff;
        color: #fff;
        text-align: center;
        border: 1px solid #007bff;
    }

    /* 헤더 내 이전/다음 버튼 스타일 */
    .ui-datepicker-prev,
    .ui-datepicker-next {
        background-color: transparent;
        border: none;
        cursor: pointer;
    }

    .ui-datepicker-prev:hover,
    .ui-datepicker-next:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }

    /* 년/월 선택 드롭다운 스타일 */
    .ui-datepicker-year,
    .ui-datepicker-month {
        color: #fff;
        padding: 5px;
    }

    /* 날짜를 표시하는 테이블 스타일 */
    .ui-datepicker-calendar {
        border-collapse: collapse;
        width: 100%;
    }

    /* 개별 날짜 스타일 */
    .ui-datepicker-calendar td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
        cursor: pointer;
    }

    .ui-datepicker-calendar td:hover {
        background-color: rgba(0, 123, 255, 0.1);
    }

    /* 선택된 날짜 스타일 */
    .ui-datepicker-calendar .ui-state-active {
        background-color: #007bff;
        color: #fff;
    }

    /* 다른 달에 속하는 날짜 스타일 */
    .ui-datepicker-other-month {
        color: #ccc;
    }

    /* 헤더에 표시되는 요일 이름 스타일 */
    .ui-datepicker-week-end {
        color: #f00;
    }
    /* input 요소 글자 가운데 정렬 */
    input[type="text"],
    input[type="password"],
    textarea {
        text-align: center;
    }
    
    .quickmenu{
      
   position: fixed;
   top: 50;
   right: 0;
    
    }   
</style>

<div align="right">
 <div style="opacity:0.7;" class="quickmenu"><img src="/img/logo/items&reservations.png"></div>
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

<div class="reserveDiv">
	<h2>예약</h2>
	<hr>
	<form:form modelAttribute="reserve" action="reserveRegister">

		<form:hidden path="reserveNo" id="reserveNo" />
		<form:hidden path="userNo" id="userNo" />
		<form:hidden path="userId" id="userId" />
		<form:hidden path="userName" id="userName" />
		<form:hidden path="itemNo" id="itemNo" />
		<form:hidden path="reserveItemName" id="reserveItemName" />
		<form:hidden path="reserveItemPrice" id="reserveItemPrice" />

		<table border="0" id="table">
			<tr id="tr">
				<td rowspan="3" id="td"><img src="/img${item.itemImgThumb}"></td>
			</tr>
			<tr id="tr">
				<td width="400px" colspan="5" id="td"><font class="itemFont">당신만을
						위한 Mom's clean의 ${item.itemName} 아이템입니다.<br>
						${item.itemName}는 ${item.itemNo}평의 공간을 구석구석 청소해 <br> 사용자분의 집의 상쾌함을
						책임지겠습니다.
				</font></td>
			</tr>
			<tr id="tr">

			</tr>
			<tr id="tr">
				<td id="td">
				<b>옵션선택 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
				<form:select path="reserveOptionName6" id="homeOption">
						<c:choose>
							<c:when test="${empty room}">
								<form:option path="reserveOptionName6" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName6" value="">-선택없음-</form:option>
								<c:forEach items="${room}" var="option">
									<form:option path="reserveOptionName6"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td id="td"><form:select path="reserveOptionName" id="homeOption">
						<c:choose>
							<c:when test="${empty yang}">
								<form:option path="reserveOptionName" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName" value="">-선택없음-</form:option>
								<c:forEach items="${yang}" var="option">
									<form:option path="reserveOptionName"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td id="td"><form:select path="reserveOptionName2" id="homeOption">
						<c:choose>
							<c:when test="${empty gimchi}">
								<form:option path="reserveOptionName2" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName2" value="">-선택없음-</form:option>
								<c:forEach items="${gimchi}" var="option">
									<form:option path="reserveOptionName2"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td id="td"><form:select path="reserveOptionName3" id="homeOption">
						<c:choose>
							<c:when test="${empty common}">
								<form:option path="reserveOptionName3" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName3" value="">-선택없음-</form:option>
								<c:forEach items="${common}" var="option">
									<form:option path="reserveOptionName3"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>



				<td id="td"><form:select path="reserveOptionName4" id="homeOption">
						<c:choose>
							<c:when test="${empty smart}">
								<form:option path="reserveOptionName4" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName4" value="">-선택없음-</form:option>
								<c:forEach items="${smart}" var="option">
									<form:option path="reserveOptionName4"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
				<td id="td"><form:select path="reserveOptionName5" id="homeOption">
						<c:choose>
							<c:when test="${empty home}">
								<form:option path="reserveOptionName5" value="">상품이 없습니다.</form:option>
							</c:when>
							<c:otherwise>
								<form:option path="reserveOptionName5" value="">-선택없음-</form:option>
								<c:forEach items="${home}" var="option">
									<form:option path="reserveOptionName5"
										value="${option.itemName}">${option.itemName}</form:option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</form:select></td>
			</tr>

			<tr id="tr">
				<td id="td"><input type="button" name="bth" id="btn-address"
					onclick="sample6_execDaumPostcode()" value="주소 검색"></td>
				<td id="td"><form:input path="reserveAddr" id="member_post"
						readonly="true" /><br><b>우편주소</b></td>
				<td id="td"><form:input path="reserveAddr" id="member_addr"
						readonly="true" /><br><b>기본주소</b></td>
				<td id="td"><form:input path="reserveAddr" id="zonecode"
						readonly="true" /><br><b>읍면동</b></td>
				<td id="td"><form:input path="reserveAddr" id="sang" /><br><b>상세주소</b></td>
				<td id="td"></td>
			</tr>
			<tr id="tr">
				<td id="td" ><font>청소 날짜 선택</font></td>
				<td id="td" colspan="3"><form:input size="30" type="text" path="cleanDate" id="datepicker" value="클릭해서 청소날짜를 선택해주세요"/></td>
				<td id="td"></td>
				<td id="td"></td>
			</tr>
		</table>
	</form:form>
	<div class="btn-container">
		<!-- 예약하기 버튼 추가 -->
		<button type="submit" id="btnReserve">예약하기</button>
		<button type="submit" id="btnList">취소하기</button>
	</div>
</div>

<script>

	$(document).ready(function () {
		var disabledDays;
		var date1;
	    var date2;
	    var dateArray= [];
		function ajaxfun(callback) {
		    $.ajax({
		        type: "POST",
		        url: "/client/reserve/getDisabledDates", // 실제 컨트롤러 메서드의 URL로 대체하세요.
		        dataType: "json",
		        success: function (data) {
		        	disabledDays = data;
		            //alert(JSON.stringify(disabledDays));
		            

		            // AJAX 요청이 완료되고 disabledDays에 데이터가 할당되면, 콜백 함수를 호출합니다.
		            if (typeof callback === "function") {
		                callback();
		            }
		        },
		        error: function () {
		            alert("비활성화된 날짜를 가져오는데 실패했습니다.");
		        }
		    });
		}

		ajaxfun(function () {
			// AJAX 요청이 완료되고 disabledDays에 데이터가 할당된 이후에 실행할 코드를 작성합니다.
		    date1 = disabledDays; // "2023-01-01"
		    
		    
		    for (var i = 0; i < date1.length; i++) {
		    	dateArray.push(date1[i]);
			}
		});


		// 특정일 선택막기
		function disableAllTheseDays(date) {
			var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
			for (i = 0; i < dateArray.length; i++) {
				if($.inArray(y + '-' +(m+1) + '-' + d,dateArray) != -1) {
					return [false];
				}
			}
			return [true];
		}


		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',

			
			beforeShowDay: disableAllTheseDays, // 선택제한	( 날짜 선택시 주의 )

			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년',


		});

		var now_utc = Date.now();
		var timeOff = new Date().getTimezoneOffset() * 60000;
		var today = new Date(now_utc - timeOff).toISOString()
				.split("T")[0];

		// 오늘로부터 5일 후의 날짜 구하기
		var fiveDaysLater = new Date(now_utc - timeOff + 6 * 24 * 60
				* 60 * 1000);
		var fiveDaysLaterString = fiveDaysLater.toISOString()
				.split("T")[0];
		// 최대 선택 가능한 날짜를 오늘로부터 16일 후로 설정합니다.
		var maxDate = new Date(now_utc - timeOff + 19 * 24 * 60 * 60
				* 1000).toISOString().split("T")[0];
		
		$("#datepicker").datepicker({
			  dateFormat: 'yy-mm-dd',
			  minDate: new Date(fiveDaysLaterString),
			  maxDate: new Date(maxDate)
			});

				
				
				var formObj = $("#reserve");
				// 구매하기 버튼 이벤트 처리
				$("#btnReserve").on("click", function() {
					// reserveAddr 값 읽기
					var reserveAddrValue = $("#member_post").val();

					// cleanDate 값 읽기
					var cleanDateValue = $("#datepicker").val();

					// 값이 없을 경우 alert 띄우기
					if (!reserveAddrValue) {
						alert("주소검색 버튼을 눌러 값을 입력해주세요.");
						return;
					}

					if (cleanDateValue==="클릭해서 청소날짜를 선택해주세요") {
						alert("청소날짜를 입력해주세요.");
						return;
					}
					formObj.submit();
				});
				$("#btnList").on("click", function() {
					self.location = "../item/itemInfo";
				});

			});
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = datajibynAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("zonecode").value = extraAddr;
				} else {
					document.getElementById("zonecode").value = '';
				}
				document.getElementById('member_post').value = data.zonecode;
				document.getElementById("member_addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("chamgo").focus();

			}
		}).open();
	}
</script>