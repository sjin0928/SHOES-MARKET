<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mainStyles.css" rel="stylesheet" />
<title>인기상품 목록</title>
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
      <h3>뉴발란스</h3>
  	
	<div class="product-list">
	<c:forEach var="newBalVo" items="${newBalList }">
        <a href="controller?type=productDetail&itemNum=${newBalVo.itemNum}" class="product">
          <img src="${newBalVo.imagePath }" width="225" alt="상품이미지">
          <div class="product-name">
          [${newBalVo.brand }] ${newBalVo.name }
          </div>
          <div class="product-price">${newBalVo.price }</div>
        </a>
        </c:forEach>
      </div>
      </div>
      
      <!-- ------------------------------------------------------------------------ -->
      
      <%@ include file="include/footer.jspf" %>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>