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
		
		form.action="controller?type=managerInquiry";
		form.submit();
	}
	function manager_comment_write() {
		let form = document.writeform;
		
		form.action="controller?type=managerCommentWrite";
		form.submit();
	}
	function manager_comment_delete() {
		let form = document.commentform;
		
		form.action="controller?type=managerCommentDelete";
		form.submit();
	}
	
	function file_download() {
		let form = document.downloadForm;

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
	<%@ include file="include/managerHeader.jspf" %>
	
<div class="container">
	<%-- 게시글 내용 시작 --%>
	<br>
	<h4>상세보기</h4>
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
						<input class="btn btn-primary" type="button" value="목록보기" onclick="list_go()">
						<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">		
						<input type="hidden" name="idx" value="${idx }">	
						<input type="hidden" name="keyword" value="${keyword }">	
						<input type="hidden" name="cPage" value="${cPage }">	
					</form>

				</td>
			</tr>
		</tfoot>
	</table>
	
	<%-- 게시글의 댓글 표시 영역 --%>
	
	<div class="inqComment">
	<hr>
		<form method="post" name="writeform">
			<table>
				
				<tr>
					<th>댓글 작성(600자 이내)</th>
				</tr>
				<tr>
					<td>
						<textarea name="contents" rows="8" cols="100" title="내용"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="저장" onclick="manager_comment_write()">
						<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">		
						<input type="hidden" name="idx" value="${idx }">	
						<input type="hidden" name="keyword" value="${keyword }">	
						<input type="hidden" name="cPage" value="${cPage }">	
					</td>
				</tr>
			</table>
		</form>
		<hr>
		
		<form method="post" name="commentform">
		<h4>댓글</h4>
		<hr>
		<c:forEach var="inqCommVO" items="${list }">
		<ul>
			<li>작성자: 관리자 &nbsp;&nbsp; </li>
			<li>작성일: ${inqCommVO.regDate }</li>
			<li>내용 : ${inqCommVO.contents }</li>
			</ul>
			<input type="button" value="삭제" onclick="manager_comment_delete()">
			<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">		
			<input type="hidden" name="iqCommentNum" value="${inqCommVO.iqCommentNum }">		
			<input type="hidden" name="idx" value="${idx }">	
			<input type="hidden" name="keyword" value="${keyword }">	
			<input type="hidden" name="cPage" value="${cPage }">
		<hr>
		</c:forEach>
		</form>
		<c:if test="${result == 1 }">
			<script>
				alert("해당 댓글이 삭제 되었습니다.");
			</script>
		</c:if>
	</div>
</div>
	<!-- 게시글 내용 끝 -->
	
  	<%@ include file="include/managerFooter.jspf" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>