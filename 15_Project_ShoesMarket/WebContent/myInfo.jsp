<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지(정보조회)</title>
    <!-- 메뉴바 외 코드 -->
   <link href="css/style.css" rel="stylesheet" />
   <!-- 메뉴바 부트스트랩 템플릿 사용 -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
    <script>
    <%@ include file="include/popup.js" %>
    
    
    </script>
</head>
<body>
<%@ include file="include/header.jspf" %>
<div class="container">
    <h1>마이페이지</h1>
    <h3>개인정보 수정 - 페이지 이동</h3>
    <a href="controller?type=myPage">개인정보 수정(클릭)</a>
    <h3>주문내역</h3>
    <div>
    <!-- 주문 내역 있을 때 조회 가능하도록 설정 -->
	<c:choose>
	<c:when test="${empty orderedList }">
		<p>주문 내역이 없습니다</p>				
	</c:when>
	<c:otherwise>
	<c:forEach var="buyVo" items="${orderedList }">
	
        <p>주문내역 - 잘 뜸 </p>
        <p>${buyVo.buyNum } , ${buyVo.cusNum }, ${buyVo.phone }</p>
     </c:forEach>
     </c:otherwise>
     </c:choose>
      </div>
    
    <h3>게시글 내역</h3>
    <div>
    <!-- 작성한 게시물이 있을 때 조회 가능하도록 설정 -->
	<c:choose>
	<c:when test="${empty inquiryList }">
		<p>문의 게시글이 없습니다</p>				
	</c:when>
	<c:otherwise>
	<c:forEach var="inquiryVo" items="${inquiryList }">
        <p>문의 게시글</p>
        <p>${inquiryVo.inquiryNum } , ${inquiryVo.cusNum }, ${inquiryVo.title }, ${inquiryVo.contents } </p>
     </c:forEach>
     </c:otherwise>
     </c:choose>
      </div>
    
    
   </div>
    
    <br><br><br><br><br><br>
    <!-- 부트스트랩 -->
    <%@ include file="include/footer.jspf" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
