<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

<script>
	function notice_update() {
		let form = document.myform;
		alert(form);
		form.action="controller?type=managerNoticeUpdate";
		form.submit();
	}
	function notice_list() {
		let form = document.myform;
		
		form.action="controller?type=managerNoticeList";
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
	<%@ include file="include/managerHeader.jspf" %>

<!-- 공지사항 수정 시작 -->
<br>
<h4>&nbsp; 공지사항 수정</h4>
<hr>
<div class="container" style="margin-top:30px">
	<form method="post" name="myform" >
		<div class="form-group">
			<label for="noticeTitle">제목</label>
			<input class="form-control" type="text" name="noticeTitle" title="제목" value="${vo.noticeTitle }">
		</div>
		<div class="form-group">
			<label for="cusNickName">작성자</label>
			<input class="form-control" type="text" name="cusNickName" title="작성자" value="관리자" readonly>
		</div>
		<div class="form-group">
			<label for="contents">내용</label>
			<textarea class="form-control" name="contents" title="내용" id="exampleFormControlTextarea1" rows="5"></textarea>
		</div>

		<input class="btn btn-primary" type="button" value="수 정" onclick="notice_update()">
		<input class="btn btn-primary" type="reset" value="초기화">
		<input class="btn btn-primary" type="button" value="목록보기" onclick="notice_list()">
		<input type="hidden" name="cPage" value="${cPage}">
		<input type="hidden" name="noticeNum" value="${vo.noticeNum}">
		<input type="hidden" name="idx" value="${idx}">			
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
</div>

<br><br>
<!-- 문의게시글 수정 내용 끝 -->

<div>
	<%@ include file="include/managerFooter.jspf" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>