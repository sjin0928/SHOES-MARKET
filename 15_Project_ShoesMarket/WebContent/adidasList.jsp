<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mainStyles.css" rel="stylesheet" />
<title>인기상품 목록</title>
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
  	
	<div class="products">
      <h3>아디다스</h3>
  	
	<div class="product-list">
	<c:forEach var="adidasVo" items="${adidasList }">
        <a href="controller?type=productDetail&itemNum=${adidasVo.itemNum}" class="product">
          <img src="${adidasVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
          [${adidasVo.brand }] ${adidasVo.name }
          </div>
          <div class="product-price">${adidasVo.price }</div>
        </a>
        </c:forEach>
      </div>
      </div>
      
      <!-- ------------------------------------------------------------------------ -->
      
      <%@ include file="include/footer.jspf" %>
 
</body>
</html>