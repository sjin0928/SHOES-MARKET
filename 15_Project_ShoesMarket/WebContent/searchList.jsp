<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
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
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>