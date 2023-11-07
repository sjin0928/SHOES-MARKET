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
  	<div class="container" style="margin-top:30px">
  	<div class="row">
		<h2>문의 게시글 수정</h2>
		<hr>
		
		<form method="post" name="myform" enctype="multipart/form-data" >
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="cusNickName" value="${vo.cusNickname }" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${vo.title }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="cusEmail" value="${vo.cusEmail }" readonly></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="inqImgPath" value="${vo.inqImgPath }"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="contents" rows="5" cols="60">${vo.contents }</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="inquiry_update()">
					<input type="reset" value="초기화">
					<input type="button" value="목록보기" onclick="inquiry_search()">
					<input type="hidden" name="cPage" value="${cPage}">								
					<input type="hidden" name="inquiryNum" value="${vo.inquiryNum}">								
					<input type="hidden" name="idx" value="${idx}">								
					<input type="hidden" name="keyword" value="${keyword}">								
					
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	</div>

  	<!-- 게시글 수정 내용 끝 -->

  	<!-- footer section -->
  	<%@ include file="include/footer.jspf" %>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>