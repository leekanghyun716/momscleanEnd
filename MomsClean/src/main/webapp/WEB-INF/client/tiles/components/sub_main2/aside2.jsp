<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청소업체 홈페이지</title>

<style>

  

  
 .aside {
  float: left;
  width: 150px;
  height: 300px;
  color: white;
  background-color: #FFFFFF;
 position:absolute;
 left:150px;
}
 

 	
 
  

</style>
</head>
<body>
	<div class="aside">
	<table align="center">
		<tr>
      <td align="center"><a href="../intro/commpanyintr">회사소개</a></td>
       </tr>
       <td></td>
       <tr>
     <td align="center"><a href="../notice/noticeList?page=1&perPageNum=10">공지사항</a></td>
    	</tr>
    </table>
    </div>
     <script>
    function adjustLeftPosition() {
      const asideElement = document.querySelector('.aside');
      const windowWidth = window.innerWidth;
      const minWidth = 1150; // 원하는 최소 창 크기
      const minWidth1 = 1050;

      if (windowWidth < minWidth) {
        // 창 크기가 1300px 이하일 때, 창 크기를 1300px로 고정
        window.resizeTo(minWidth, window.innerHeight);
        asideElement.style.display="block";
        asideElement.style.left = '0px';
      } else {
    	  asideElement.style.display="block";
        asideElement.style.left = '150px';
      }
      if(windowWidth<minWidth1){
    	  window.resizeTo(minWidth1, window.innerHeight);
    	  asideElement.style.display="none";
      }
    }

    window.addEventListener('resize', adjustLeftPosition);
    adjustLeftPosition(); // 페이지 로딩 시 초기값 설정
  </script>
</body>
</html>	