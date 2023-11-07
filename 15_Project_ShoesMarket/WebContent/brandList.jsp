<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 카테고리</title>
	<!-- 스타일시트 파일의 경로를 지정 -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>

</head>
<body>

	<%@ include file="include/header.jspf" %>
  	<!-- ------------------------------------------------------------------------ -->
	
	<!-- 아디다스 -->
	<!-- class="products" 시작 -->
    <div class="products">
      <h3>아디다스</h3>
      
      <!-- class="product-list" 시작 -->
      <div class="product-list">
      
		  
      	<c:forEach var="adidasVo" items="${adidasList }" begin="0" end="3">
      	
      	<!-- &itemNum=${vo.itemNum} : 컨트롤러에 상품번호 전달 -->
        <a href="controller?type=productDetail&itemNum=${adidasVo.itemNum}" class="product">
          <img src="${adidasVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
            [${adidasVo.brand }] ${adidasVo.name }
          </div>
          <div class="product-price">${adidasVo.price }</div>
        </a>
        </c:forEach>
        
        <!-- 삭제 X 없으면 더보기 옆으로 감-->
        <div class="clearfix"></h3></div>
        <div style="text-align: center;"><a href="controller?type=adidas">+ 더보기</a></div>
        <!-- class="product-list" 끝 -->
      </div>
    </div>
    <!-- class="products" 끝 -->
	
	<!-- 컨버스 -->
	<!-- class="products" 시작 -->
    <div class="products">
      <h3>컨버스</h3>
      
      <!-- class="product-list" 시작 -->
      <div class="product-list">
      
		      
      	<c:forEach var="converseVo" items="${converseList }" begin="0" end="3">
      	
      	<!-- &itemNum=${vo.itemNum} : 컨트롤러에 상품번호 전달 -->
        <a href="controller?type=productDetail&itemNum=${converseVo.itemNum}" class="product">
          <img src="${converseVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
            [${converseVo.brand }] ${converseVo.name }
          </div>
          <div class="product-price">${converseVo.price }</div>
        </a>
        </c:forEach>
        
        <!-- 삭제 X 없으면 더보기 옆으로 감-->
        <div class="clearfix"></h3></div>
        <div style="text-align: center;"><a href="controller?type=converse">+ 더보기</a></div>
        <!-- class="product-list" 끝 -->
      </div>
    </div>
    <!-- class="products" 끝 -->
	
	<!-- 뉴발란스 -->
	<!-- class="products" 시작 -->
    <div class="products">
      <h3>뉴발란스</h3>
      
      <!-- class="product-list" 시작 -->
      <div class="product-list">
      
		<!-- 최신 등록순으로 4개 -->      
      	<c:forEach var="newBalVo" items="${newBalList }" begin="0" end="3">
      	
      	<!-- &itemNum=${vo.itemNum} : 컨트롤러에 상품번호 전달 -->
        <a href="controller?type=productDetail&itemNum=${newBalVo.itemNum}" class="product">
          <img src="${newBalVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
            [${newBalVo.brand }] ${newBalVo.name }
          </div>
          <div class="product-price">${newBalVo.price }</div>
        </a>
        </c:forEach>
        
        <!-- 삭제 X 없으면 더보기 옆으로 감-->
        <div class="clearfix"></h3></div>
        <div style="text-align: center;"><a href="controller?type=newBal">+ 더보기</a></div>
        <!-- class="product-list" 끝 -->
      </div>
    </div>
    <!-- class="products" 끝 -->
	
	<!-- ------------------------------------------------------------------------ -->
    
    <%@ include file="include/footer.jspf" %>

</body>
</html>