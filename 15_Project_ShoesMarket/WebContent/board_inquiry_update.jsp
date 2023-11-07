<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시글</title>

<link href="css/style.css" rel="stylesheet" />
<script>
	function inquiry_update() {
		let form = document.myform;
		
		form.action="controller?type=update";
		form.submit();
	}
	function inquiry_search() {
		let form = document.myform;
		
		form.action="controller?type=search";
		form.submit();
	}
</script>
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
</head>
<body>
	<!-- start header section -->
		<%@ include file="include/header.jspf" %>
	
  	<!-- 게시글 수정 내용 시작 -->
  	
    <div id="container">
		<h2>방명록 : 수정화면</h2>
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

  	<!-- 게시글 수정 내용 끝 -->

  	<!-- footer section -->
  	<%@ include file="include/footer.jspf" %>

</body>
</html>