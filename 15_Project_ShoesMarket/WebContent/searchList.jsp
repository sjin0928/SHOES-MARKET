<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
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
      <h3>'${keyword }'에 대한 검색 결과</h3>
      
      <!-- class="product-list" 시작 -->
      <div class="product-list">
      
      	<!-- 검색 결과가 없는 경우 searchList는 empty  -->
      	
      	<c:choose>
      		<c:when test="${empty searchList }">
      			<br><br>
      			<div style="text-align: center;">일치하는 검색결과가 없습니다.</div>
      			<div style="text-align: center;">총 '${result }'개의 상품이 검색되었습니다.</div>
      			
      			<br><br>
      		</c:when>
      		
      		<c:otherwise>
      		<div>총 '${result }'개의 상품이 검색되었습니다.</div>
		      	<c:forEach var="vo" items="${searchList }">
		        	<a href="controller?type=productDetail&itemNum=${vo.itemNum}" class="product">
		         		<img src="${vo.imagePath }" width="225" alt="상품이미지">
			          		<div class="product-name">
			          	  	[${vo.brand }]	${vo.name }
			         	 	</div>
		          <div class="product-price">${vo.price }
		          </div>
		       	 </a>
		        </c:forEach>
      		</c:otherwise>
      	</c:choose>
      		
      	</div>
      </div>
		
        
        <!-- ------------------------------------------------------------------------ -->
      
       <%@ include file="include/footer.jspf" %>
</body>
</html>