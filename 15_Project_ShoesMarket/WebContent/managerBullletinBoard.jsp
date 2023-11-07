<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 관리 게시판</title>
	<!-- 스타일시트 파일의 경로를 지정 -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
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
	<input type="button" onclick="" value="문의게시글목록">
	</div>
	<br>
	
	
	<!-- ------------------------------------------------------------------------ -->
	<%@ include file="include/managerFooter.jspf" %>
	
</body>
</html>