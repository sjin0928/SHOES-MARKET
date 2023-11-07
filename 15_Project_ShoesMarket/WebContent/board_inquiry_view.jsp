<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용</title>
</head>
<script type="text/javascript" src="popup.js"></script>
<link href="css/style.css" rel="stylesheet" />
<script>
	function update_view() {
		let form = document.myform;
		
		form.action="controller?type=updateView";
		form.submit();
	}
	function delete_inquiry() {
		let form = document.myform;
		
		form.action="controller?type=inquiryDelete";
		form.submit();
	}
	
	function list_go() {
		let form = document.myform;
		
		form.action="controller?type=list";
		form.submit();
	}
</script>
<body>
<%@ include file="header.jsp" %>
<div id="contents_view">
	<%-- 게시글 내용 시작 --%>
	<table>
		<caption>상세보기</caption>
		<tbody>
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
					<a href="controller?type=fileDownload&inqImgPath=upload&inqImgName=${vo.inqImgName }">${vo.inqImgName }</a>
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
						<input type="button" value="수정" onclick="update_view()">
						<input type="button" value="목록보기" onclick="list_go()">
						<h4>비밀번호를 입력후 삭제를 누르시면 게시글이 삭제 됩니다.</h4>
						<p>
						비밀번호 <input type="text" name="passwordConfirm">
						<input type="button" value="삭제" onclick="delete_inquiry()">
						</p>
						
						
						

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
			<li>작성자: admin &nbsp;&nbsp; </li>
			<li>작성일: ${inqCommVO.regDate }</li>
			<li>내용 : ${inqCommVO.contents }</li>
		</ul>
			<!-- 세션에 게시글데이터, 페이지번호가 없으면 명시적으로 데이터 넘기기 -->
			<%-- <input type="hidden" name="bbsIdx" value="${commVO.bbsIdx }">
			<input type="hidden" name="cPage" value="${cPage }"> --%>
		<hr>
		</c:forEach>
	</div>
	
	
</div>
	<!-- 게시글 내용 끝 -->
	
	<!-- footer section -->
  	<%@ include file="footer.jsp" %>
</body>
</html>