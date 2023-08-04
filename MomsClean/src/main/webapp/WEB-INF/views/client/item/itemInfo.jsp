<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.product-img {
	max-width: 300px;
	max-height: 300px;
	object-fit: cover;
}
.product-img {
        max-width: 300px;
        max-height: 300px;
        object-fit: cover;
    }

    .itemList {
        width: 1080px;
        height: 2000px;
        margin: auto;
        padding: 20px;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 10px;
    }

    .itemTableImg {
        display: inline-block;
        vertical-align: top;
        margin-right: 20px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 10px;
    }

    footer {
        float: none;
    }

    .itemInfoImg {
        width: 100%;
        border-radius: 10px;
    }

    .itemTable {
        width: 100%;
        margin: 10px 0;
    }

    .itemTable td {
        vertical-align: middle;
    }

    #optionDiv {
        float: left;
        width: 100%;
        height: 1130px;
        margin: auto;
    }

    hr {
        border: none;
        border-top: 1px solid #ccc;
        margin: 20px 0;
    }

    /* Modal 스타일 */
    .modal-dialog {
        max-width: 600px;
    }

    .modal-content {
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .modal-header {
        background-color: #f2f2f2;
        border-radius: 10px 10px 0 0;
    }

    .modal-body {
        padding: 20px;
    }

    .modal-footer {
        border-top: none;
        padding: 10px 20px;
        text-align: right;
        background-color: #f2f2f2;
        border-radius: 0 0 10px 10px;
    }

    /* 예약하기 버튼 스타일 */
    #modalSubmit {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-right: 10px;
        border-radius: 5px;
        padding: 10px 20px;
    }

    #modalSubmit:hover {
        background-color: #0056b3;
    }

    .btn-default {
        background-color: #f2f2f2;
        color: #333;
        border: 1px solid #ccc;
        cursor: pointer;
        font-size: 16px;
        border-radius: 5px;
        padding: 10px 20px;
    }

    .btn-default:hover {
        background-color: #e6e6e6;
    }
.option{
	width: 600px;
	margin-left:0px;
	
}
#optionDiv{
	float:left;
	width:100%;
	height:1130px;
	margin:auto;
}
hr{
border:1px solid black;
}
</style>

<div class="itemList">
<h2><b>상품정보</b></h2>
	<c:choose>
		<c:when test="${empty list}">
			<p>상품이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="item">
				<table class="itemTableImg">

					<tr>
						<td align="center"><img class="product-img"
							src="/img${item.itemImgThumb}" data-toggle="modal"
							alt="/img${item.itemImg},${item.itemNo}">
							 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				
			</div>
			<div class="modal-body">
				<table class="itemTable">
					<tr>
						<td>
							<img class="itemInfoImg"
							src="/img${item.itemImg}"  data-toggle="modal">
						</td>
					</tr>					
				</table>
			</div>
										<div class="modal-footer">
											<button id="modalSubmit" type="button"
												class="btn btn-success">예약하기</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
	</div>
</div></td>
					</tr>
				</table>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<div id="optionDiv"><img class="option"
							src="/img/option/option.png"></div>
	
</div>
<script type="text/javascript">
	var action = '';
	var type = '';

	$(document).ready(function() {
			var itemName2;
			var itemArr;
			var uid = '<%=session.getAttribute("user")%>';
		// 새 글 쓰기 버튼 클릭
		$(".product-img").click(function() {

			var itemName = $(this).attr("alt");
			itemName2= $(this).attr("alt");
			itemArr = itemName.split(",");
			$(".itemInfoImg").attr("src",itemArr[0]);
			action = 'create';
			type = 'POST'
			$("#myModal").modal();
		});

		// Modal의 Submit 버튼 클릭
		$("#modalSubmit").click(function() {
			if(uid=="null"){ 
	             alert("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요"); 
	             window.location= "/client/page";
	             return;
	          }
			self.location = "../reserve/reserveRegister?itemNo="+itemArr[1];
		});

	});
</script>