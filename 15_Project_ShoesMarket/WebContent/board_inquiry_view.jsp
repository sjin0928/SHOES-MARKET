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
					<a href="download.jsp?inqImgPath=${vo.inqImgPath }">${vo.inqImgName }</a>
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
					<a href="controller?type=updateView&inquiryNum=${vo.inquiryNum }&cPage=${cPage }&idx=${idx }&keyword=${keyword }">수정</a>
					<a href="controller?type=delete">삭제</a>
					<c:set var="idx" value="${idx }"/>
					<c:choose>
						<c:when test="${idx == -1 }"><a href="controller?type=list">목록보기</a></c:when>
						<c:when test="${idx != -1 }"><a href="controller?type=search&idx=${idx }&keyword=${keyword }">목록보기</a></c:when>
					</c:choose>
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