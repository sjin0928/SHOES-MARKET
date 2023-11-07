<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
	<!-- 스타일시트 파일의 경로를 지정 -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
 <script>
 <%@ include file="include/popup.js" %> /* 팝업 사용 시 필요 */
 <%@ include file="include/search.js" %> /* 검색창 사용 시 필요함 */
 </script>
  </head>
  <body>
  
  	<%@ include file="include/header.jspf" %>
  	
  	
  	<!-- ------------------------------------------------------------------------ -->
  	
  	
    <!-- 메인 배경(슬라이드) -->

    <!-- Slideshow container -->
	<div class="slideshow-container" style="width:1920px;">
	
	  <!-- Full-width images with number and caption text -->
	  <div class="mySlides fade">
	    <div class="numbertext">1 / 4</div>
	    <img src="img/main4.jpg" alt="슬라이드1">
	  </div>
	
	  <div class="mySlides fade">
	    <div class="numbertext">2 / 4</div>
	    <img src="img/main2.jpg" alt="슬라이드2">
	  </div>
	
	  <div class="mySlides fade">
	    <div class="numbertext">3 / 4</div>
	    <img src="img/main3.jpg" alt="슬라이드3">
	  </div>
	  
	  <div class="mySlides fade">
	    <div class="numbertext">4 / 4</div>
	    <img src="img/main1.jpg" alt="슬라이드3">
	  </div>
	
	  <!-- Next and previous buttons -->
	  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	  <a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
	<br>
	
	<!-- The dots/circles -->
	<div style="text-align:center">
	  <span class="dot" onclick="currentSlide(1)"></span>
	  <span class="dot" onclick="currentSlide(2)"></span>
	  <span class="dot" onclick="currentSlide(3)"></span>
	  <span class="dot" onclick="currentSlide(4)"></span>
	</div>
     
    
    <!-- ------------------------------------------------------------------------ -->
    
    <!-- class="products" 시작 -->
    <div class="products">
      <h3>NEW</h3>
      
      <!-- class="product-list" 시작 -->
      <div class="product-list">
      
		<!-- 최신 등록순으로 4개 -->      
      	<c:forEach var="vo" items="${list }" begin="0" end="3">
      	
      	<!-- &itemNum=${vo.itemNum} : 컨트롤러에 상품번호 전달 -->
        <a href="controller?type=productDetail&itemNum=${vo.itemNum}" class="product">
          <img src="${vo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
            [${vo.brand }] ${vo.name }
          </div>
          <div class="product-price">${vo.price }</div>
        </a>
        </c:forEach>
        
        <!-- 삭제 X 없으면 더보기 옆으로 감-->
        <div class="clearfix"></h3></div>
        <div style="text-align: center;"><a href="controller?type=new">+ 더보기</a></div>
        <!-- class="product-list" 끝 -->
      </div>
    </div>
    <!-- class="products" 끝 -->
    
    
    
    
    <!-- class="products" 시작 -->
    <div class="products">
     <h3>BEST</h3>
      
      <!-- class="product-list" 시작 -->
      <div class="product-list">
      
		<!-- 판매수량 순으로 4개 -->     
		
      	<c:forEach var="bestVo" items="${bestList }" begin="0" end="3">
        <a href="controller?type=productDetail&itemNum=${bestVo.itemNum}" class="product">
          <img src="${bestVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
            [${bestVo.brand }] ${bestVo.name }
          </div>
          <div class="product-price">${bestVo.price }</div>
        </a>
        </c:forEach>
        
        <!-- 삭제 X 없으면 더보기 옆으로 감-->
        <div class="clearfix"></div>
        <div style="text-align: center;"><a href="controller?type=best">+ 더보기</a></div>
        <!-- class="product-list" 끝 -->
      </div>
 
    </div>
   	
    <br><br>
    <!-- class="products" 끝 -->
    
    <!-- ------------------------------------------------------------------------ -->
    
    <%@ include file="include/footer.jspf" %>
    	
  <script>
 <%@ include file="include/slide.js" %>

 </script> 	
  </body>
</html>