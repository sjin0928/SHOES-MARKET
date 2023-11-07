<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
	<!-- 이미지 슬라이드 떄만 필요 : 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 메뉴바 부트스트랩 템플릿 사용 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
	
 <script>
 <%@ include file="include/popup.js" %> /* 팝업 사용 시 필요 */
 <%@ include file="include/search.js" %> /* 검색창 사용 시 필요함 */
 </script>
  </head>
  <body>
  
  	<%@ include file="include/header.jspf" %>
  	
  	
  	<!-- ------------------------------------------------------------------------ -->
  	
   <!-- 이미지 슬라이드 -->
   <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  	<div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/main4.jpg" class="d-block w-100" alt="슬라이드1">
    </div>
    <div class="carousel-item">
      <img src="img/main2.jpg" class="d-block w-100" alt="슬라이드2">
    </div>
    <div class="carousel-item">
      <img src="img/main3.jpg" class="d-block w-100" alt="슬라이드3">
    </div>
    <div class="carousel-item">
      <img src="img/main1.jpg" class="d-block w-100" alt="슬라이드4">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
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

 </script> 	
 
 	<!-- 부트스트랩 -->
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 
  </body>
</html>