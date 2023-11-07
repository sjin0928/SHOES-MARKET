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
	function update_view() {
		let form = document.myform;
		
		form.action="controller?type=inquiryUpdateView";
		form.submit();
	}
	function delete_inquiry() {
		let form = document.myform;
		
		form.action="controller?type=inquiryDelete";
		form.submit();
	}
	
	function list_go() {
		let form = document.myform;
		
		form.action="controller?type=inquiryList";
		form.submit();
	}
	
	function file_download() {
		let form = document.downloadForm;
		alert(form);
		form.action="controller?type=fileDownload";
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
	<%-- 게시글 내용 시작 --%>
	<br>
	<h4>문의게시글 상세보기</h4>
	<br>
	<table class="table">
		<tbody class="menu_table_content" id="tbody">
			<tr>
				<th>제목</th>
				<td>${vo.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.cusNickname }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				<c:if test="${empty vo.inqImgPath }">
					첨부파일없음
				</c:if>
				<c:if test="${not empty vo.inqImgPath }">
					<form method="post" name="downloadForm" >
						${vo.inqImgName }
						<input type="button" value="다운로드" onclick="file_download()">
						<input type="hidden" name="inqImgPath" value="${vo.inqImgPath}">
						<input type="hidden" name="inqImgName" value="${vo.inqImgName}">
						<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">
						<input type="hidden" name="idx" value="${idx }">	
						<input type="hidden" name="keyword" value="${keyword }">	
						<input type="hidden" name="cPage" value="${cPage }">	
					</form>
				</c:if>
				</td>
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

						<h5>비밀번호 입력 후 삭제를 누르시면 게시글이 삭제 됩니다.</h5>
						<p>
						비밀번호 <input type="text" name="passwordConfirm">
						</p>
						<input class="btn btn-primary" type="button" value="수정" onclick="update_view()">
						<input class="btn btn-primary" type="button" value="목록보기" onclick="list_go()">
						<input class="btn btn-primary" type="button" value="삭제" onclick="delete_inquiry()">
						<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">	
						<input type="hidden" name="cusPassword" value="${vo.cusPassword }">	
						<input type="hidden" name="idx" value="${idx }">	
						<input type="hidden" name="keyword" value="${keyword }">	
						<input type="hidden" name="cPage" value="${cPage }">	
					</form>
						
				</td>
			</tr>
		</tfoot>
	</table>
	<hr>
	
	<%-- 게시글의 댓글 표시 영역 --%>
	<h3>댓글</h3>
	
	<div class="inqComment">
	<hr>
		<c:forEach var="inqCommVO" items="${list }">
	
		<ul>
			<li>작성자: 관리자 &nbsp;&nbsp; </li>
			<li>작성일: ${inqCommVO.regDate }</li>
			<li>내용 : ${inqCommVO.contents }</li>
		</ul>
		<hr>
		</c:forEach>
	</div>
	
	
</div>
	<!-- 게시글 내용 끝 -->
	
	<!-- footer section -->
  	<%@ include file="include/footer.jspf" %>
  	<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>