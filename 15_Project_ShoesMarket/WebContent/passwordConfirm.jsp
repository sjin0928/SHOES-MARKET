<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function password_go() {
	let form = document.forms["myform"];
	
	window.opener.receiveDataFromPopup(form.paswordConfirm.value);
    window.close(); // 팝업 창 닫기
}
</script>
<title>Insert title here</title>
</head>
<body>
	<div>
	<h4>※ 비밀글은 비밀번호 입력 부탁드립니다.</h4>
		<form method="post" name="myform">
			<input type="text" name="paswordConfirm" title="비밀번호">
			<input type="button" value="확인" onclick="password_go()">
			<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">	
			<input type="hidden" name="idx" value="${idx }">	
			<input type="hidden" name="keyword" value="${keyword }">
			<input type="hidden" name="secretStatus" value="${vo.secretStatus }">
		</form>
	</div>
</body>
</html>