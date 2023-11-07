<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용</title>
</head>
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
<script>
	function list_go() {
		let form = document.myform;
		
		form.action="controller?type=noticeList";
		form.submit();
	}
	
</script>
<!-- 메뉴바 외 코드 -->
<link href="css/style.css" rel="stylesheet" />
<!-- 메뉴바 부트스트랩 템플릿 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jspf" %>
<div class="container">
	<%-- 공지사항 내용 시작 --%>
	<br>
	<h4>상세보기</h4>
	<br>
	<table class="table">
		<tbody class="menu_table_content" id="tbody">
			<tr>
				<th>제목</th>
				<td>${vo.noticeTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>관리자</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${vo.modDate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${vo.contents }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<form method="post" name="myform" ><!-- enctype="multipart/form-data" -->
						<input class="btn btn-primary" type="button" value="목록보기" onclick="list_go()">		
						<input type="hidden" name="idx" value="${idx }">	
						<input type="hidden" name="keyword" value="${keyword }">	
						<input type="hidden" name="cPage" value="${cPage }">	
					</form>

				</td>
			</tr>
		</tfoot>
	</table>
	<hr>
	
</div>
	<!-- 게시글 내용 끝 -->
	
	<!-- footer section -->
  	<%@ include file="include/footer.jspf" %>
  	<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>