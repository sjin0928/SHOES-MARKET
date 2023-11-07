<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시글</title>

<script>
	function inquiry_update() {
		let form = document.myform;
		
		form.action="controller?type=inquiryUpdate";
		form.submit();
	}
	function inquiry_search() {
		let form = document.myform;
		
		form.action="controller?type=inquirySearch";
		form.submit();
	}
</script>
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 
 </script>
 
<!-- 메뉴바 외 코드 -->
<link href="css/style.css" rel="stylesheet" />
<!-- 메뉴바 부트스트랩 템플릿 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
</head>
<body>
<!-- start header section -->
<%@ include file="include/header.jspf" %>

<!-- 문의게시판 수정 시작 -->
<br>

<div class="container" style="margin-top:30px">
	<h4>&nbsp; 문의게시글 수정</h4>
	<hr>
	<form method="post" name="myform" enctype="multipart/form-data" >
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" title="제목" value="${vo.title }" readonly>
		</div>
		<div class="form-group">
			<label for="cusNickName">작성자</label>
			<input class="form-control" type="text" name="cusNickName" title="작성자" value="${vo.cusNickname }" readonly>
		</div>
		<div class="form-group">
			<label for="cusEmail">이메일</label>
			<input class="form-control" type="text" name="cusEmail" title="이메일" value="${vo.cusEmail }" readonly>
		</div>
		<div class="form-group">
			<label for="inqImgPath" class="form-label">첨부파일</label>
			<input class="form-control" type="file" title="첨부파일" name="inqImgPath" id="formFile" value="${vo.inqImgPath }">
		</div>
		<div class="form-group">
			<label for="password">내용</label>
			<textarea class="form-control" name="contents" title="내용" id="exampleFormControlTextarea1" rows="5" "></textarea>
		</div>
		<div class="form-group">
			<label for="password">비밀번호 확인</label>
			<input class="form-control" type="password" name="password" title="비밀번호 확인">
		</div>


		<input class="btn btn-primary" type="button" value="수 정" onclick="inquiry_update()">
		<input class="btn btn-primary" type="reset" value="초기화">
		<input class="btn btn-primary" type="button" value="목록보기" onclick="inquiry_search()">
		<input type="hidden" name="cPage" value="${cPage}">
		<input type="hidden" name="inquiryNum" value="${vo.inquiryNum}">
		<input type="hidden" name="idx" value="${idx}">			
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
</div>

<br><br>
<!-- 문의게시글 수정 내용 끝 -->

<div>
	<%@ include file="include/footer.jspf" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>