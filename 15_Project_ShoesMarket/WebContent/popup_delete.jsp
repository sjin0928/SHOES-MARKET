<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function delete_ok () {
	let form = document.myform;
	
	alert(form.inquiryNum);
	opener.document.myform.passwordConfirm.value = form.passwordConfirm.value;
	form.action="controller?type=inquiryDelete";
	form.submit();
	window.close();
}
</script>
</head>
<body>
	<form method="post" name="myform"><!-- enctype="multipart/form-data" -->
		<p>비밀번호를 입력해주세요. <input type="text" name="passwordConfirm"></p>
		
		<h4>삭제를 누르시면 게시글이 삭제됩니다.</h4>
		<input type="button" value="확인" onclick="delete_ok()">
		<input type="hidden" name="inquiryNum" value="${vo.inquiryNum }">	
		<input type="hidden" name="idx" value="${idx }">	
		<input type="hidden" name="keyword" value="${keyword }">	
		<input type="hidden" name="cPage" value="${cPage }">
	</form>
</body>
</html>