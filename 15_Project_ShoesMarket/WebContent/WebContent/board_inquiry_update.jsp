<!-- 231024 박수진 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시글</title>

<script type="text/javascript" src="popup.js"></script>
<link href="css/style.css" rel="stylesheet" />

<script>
	function save_go(frm) {
		//alert("save_go(frm) 실행~~ frm : " frm)
		// 비밀번호 확인 후 일치하면 수정 요청 처리
		let pwd1 = frm.pwd.value; // 지금 입력한 암호
		let pwd2 = "${vo.pwd }"; // DB에 저장된 암호(암호 노출됨 - 하지말것)
		alert("pwd1 : " + pwd1 + ", pwd2 : " + pwd2);
		if (pwd1 !== pwd2) {
			alert("암호불일치. 암호를 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		
		frm.action = "update_ok.jsp"
		frm.submit();
	}
</script>

</head>
<body>
	<!-- start header section -->
		<%@ include file="header.jsp" %>
	
  	<!-- 게시글 수정 내용 시작 -->
  	
    <div id="container">
		<h2>방명록 : 수정화면</h2>
		<hr>
		
		<form method="get">
		<table>
			<tbody>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="${vo.name }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="${vo.title }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${vo.cusEmail }"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" rows="5" cols="60">${vo.contents }</textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="수 정" onclick="save_go(this.form)">
						<input type="reset" value="취 소">
						<input type="hidden" name="idx" value="${vo.inquiryNum }">
						<c:choose>
						<c:when test="${idx == -1 }"><a href="controller?type=list">목록보기</a></c:when>
						<c:when test="${idx != -1 }"><a href="controller?type=search&idx=${idx }&keyword=${keyword }">목록보기</a></c:when>
						</c:choose>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>

  	<!-- 게시글 수정 내용 끝 -->

  	<!-- footer section -->
  	<%@ include file="footer.jsp" %>

</body>
</html>