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
					<input type="button" value="수정" onclick="modify_go">
					<input type="button" value="삭제" onclick="delete_go">
					<input type="button" value="목록보기" onclick="list_go">
				</td>
			</tr>
		</tfoot>
	</table>
	<hr>
	
	
	<%-- 게시글에 대한 댓글 작성 영역 --%>
	<form action="ans_write_ok.jsp" method="post">
		<p>
			작성자 : <input type="text" name="writer">
			비밀번호 : <input type="password" name="pwd">
		</p>
		<p>내용 : <textarea name="content" rows="4" cols="55"></textarea></p>
		<input type="submit" value="댓글저장(개인실습)">
		<input type="hidden" name="bbsIdx" value="${bvo.bbsIdx }">
	</form>
	<hr>
	
	<%-- 게시글에 딸린 댓글 표시 영역 --%>
	<c:forEach var="commVO" items="${c_list }">
	<div class="comment">
		<form action="ans_del.jsp" method="post">
			<p>작성자: ${commVO.writer } &nbsp;&nbsp; 작성일: ${commVO.writeDate }</p>
			<p>내용 : ${commVO.content }</p>
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="commentIdx" value="${commVO.commentIdx }">
			
			<!-- 세션에 게시글데이터, 페이지번호가 없으면 명시적으로 데이터 넘기기 -->
			<%-- <input type="hidden" name="bbsIdx" value="${commVO.bbsIdx }">
			<input type="hidden" name="cPage" value="${cPage }"> --%>
		</form>
	</div>
	</c:forEach>
	<hr>
</div>
	<!-- 게시글 내용 끝 -->
	
	<!-- footer section -->
  	<%@ include file="footer.jsp" %>
</body>
</html>