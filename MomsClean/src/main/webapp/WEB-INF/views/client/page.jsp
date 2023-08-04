
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>게시글 슬라이드</title>
<style>
    /* Slider Container */
    .slider-container {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f5f5f5;
        padding: 20px;
    }

    /* Slider Wrapper */
    .slider {
        display: flex;
        flex-wrap: wrap;
        overflow: hidden;
        width: 1200px;
        max-width: 100%;
        margin: 0 auto;
    }

    /* Slider Items */
    .slider-items {
        flex: 0 0 100%;
        white-space: nowrap;;
    }

    /* Individual Review Table */
    

.slider-items table {
        display: inline-block;
        margin: 10px;
        vertical-align: top;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }
    .reviewTable td {
        padding: 10px;
        text-align: center;
    }

    /* Slide Buttons */
    button {
    
        background-color: #007bff;
        color: #fff;
        border: none;
        font-size: 1px;
        cursor: pointer;
        padding: 10px 20px;
        margin: 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    } 
    
    .slider1{
            max-width:2000px;
             } 
    .slider1 img {
            width: 1500px;
            height: 600px;} 
</style>
</head>

<body>
<!-- 메인페이지 이미지 슬라이드 -->
<div class="slider1">
  <div><img src="/img/greeting/img9.jpg" alt="Image 1"></div>
  <div><img src="/img/greeting/img10.jpg" alt="Image 2"></div>
  <div><img src="/img/greeting/img11.jpg" alt="Image 3"></div>
</div>
<!-- 메인페이지 이미지 자동 슬라이드 script -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
$(document).ready(function(){
  $('.slider1').slick({
    autoplay: true,          // 자동 슬라이드 활성화
    autoplaySpeed: 5000,     // 슬라이드 간 시간 간격 (밀리초)
    dots: false,              // 하단에 점(닷) 표시
    arrows: false,           // 좌우 화살표 숨김
  });
});
</script>


<!-- 리뷰게시글 슬라이드 -->
	<div align="center" class="slider-container">
    <button id="prev">&lang;</button>
    <div class="slider">
        <!-- 각 슬라이드 아이템에는 실제 게시글 컨텐츠가 들어가야 합니다 -->
        <c:choose>
            <c:when test="${empty list}">
                <p>리뷰가 없습니다.</p>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list}" var="review" varStatus="loop">
                    <c:if test="${loop.index % 3 == 0}">
                        <div class="slider-items">
                    </c:if>
                    <table border="1" class="reviewTable">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${review.reviewGrade == 1}">
                                        <b style="font-size:18px">평점</b>: ★ 
                                    </c:when>
                                    <c:when test="${review.reviewGrade == 2}">
                                        <b style="font-size:18px">평점</b>: ★★
                                    </c:when>
                                    <c:when test="${review.reviewGrade == 3}">
                                        <b style="font-size:18px">평점</b>: ★★★
                                    </c:when>
                                    <c:when test="${review.reviewGrade == 4}">
                                        <b style="font-size:18px">평점</b>: ★★★★
                                    </c:when>
                                    <c:when test="${review.reviewGrade == 5}">
                                        <b style="font-size:18px">평점</b>: ★★★★★
                                    </c:when>
                                    <c:otherwise>Unknown</c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${fn:substring(review.reserveNo, 0, 2) eq '18'}"><B>A_set</B></c:when>
                                    <c:when test="${fn:substring(review.reserveNo, 0, 2) eq '25'}"><B>B_set</B></c:when>
                                    <c:when test="${fn:substring(review.reserveNo, 0, 2) eq '30'}"><B>C_set</B></c:when>
                                    <c:when test="${fn:substring(review.reserveNo, 0, 2) eq '35'}"><B>D_set</B></c:when>
                                    <c:when test="${fn:substring(review.reserveNo, 0, 2) eq '40'}"><B>E_set</B></c:when>
                                    <c:when test="${fn:substring(review.reserveNo, 0, 2) eq '50'}"><B>F_set</B></c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td width="300px" height="300px"><font>${review.reviewContent}</font></td>
                        </tr>
                    </table>
                    <c:if test="${(loop.index + 1) % 3 == 0 || loop.last}">
                        </div>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <button id="next">&rang;</button>
</div>

<!-- 리뷰게시글 슬라이드 script-->
	<script>
    var sliderIndex = 0;
    showSlide(sliderIndex);

    function changeSlide(n) {
        showSlide(sliderIndex += n);
    }

    function showSlide(n) {
        var slides = document.getElementsByClassName("slider-items");
        if (n >= slides.length) { sliderIndex = 0; }
        if (n < 0) { sliderIndex = slides.length - 1; }
        for (var i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[sliderIndex].style.display = "block";
    }

    document.getElementById("prev").addEventListener("click", function() {
        changeSlide(-1);
        updateSlidePosition();
    });

    document.getElementById("next").addEventListener("click", function() {
        changeSlide(1);
        updateSlidePosition();
    });
    function updateSlidePosition() {
        slideContainer.style.transform = `translateX(-${slideIndex * 100}%)`;
    }
</script>

</body>
</html>