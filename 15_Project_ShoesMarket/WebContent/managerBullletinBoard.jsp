<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 관리 게시판</title>
	<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 메뉴바 부트스트랩 템플릿 사용 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<script>
 <%@ include file="include/popup.js" %>
</script>
</head>
<body>
	
	<%@ include file="include/managerHeader.jspf" %>
	<!-- ------------------------------------------------------------------------ -->
	<!-- 상품관리 페이지로 이동 -->
	<br><br><br><br><br><br><br><br><br><br>
	<div>
	<input type="button" onclick="javascript:location.href='controller?type=itemBulletinBoard'" value="상품게시글목록">
	<input type="button" onclick="" value="리뷰게시글목록">
	<input type="button" onclick="javascript:location.href='controller?type=managerInquiry'" value="문의게시글목록">
	</div>
	<br>
	
	
	<!-- ------------------------------------------------------------------------ -->
	<%@ include file="include/managerFooter.jspf" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>