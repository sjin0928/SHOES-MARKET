<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
<script>
	function go_Home() {
		location.href = "home.jsp";
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="controller?type=register" method="post">
		아이디: <input type="text" name="cusId" placeholder="아이디를 입력해주세요" value="${not empty cusId ? cusId : ''}"><br>  
    	비밀번호: <input type="password" name="cusPassword" placeholder="비밀번호를 입력해주세요"><br> 
        비밀번호 확인: <input type="password" name="cusPasswordConfirm" placeholder="비밀번호를 재입력해주세요"><br>
		이름: <input type="text" name="cusName" placeholder="이름을 입력해주세요"><br>
		닉네임: <input type="text" name="cusNickName" placeholder="닉네임을 입력해주세요"><br>
		이메일: <input type="text" name="cusEmail" placeholder="이메일을 입력해주세요"><br>
		전화번호: <input type="text" name="cusPhoneNum" placeholder="전화번호를 입력해주세요"><br>
		<input type="submit" value="가입하기">
	</form>
	<button onclick="go_Home()">취소</button>
	
	<% String message = (String) request.getAttribute("registerMessage"); %>
    <% if (message != null) { %>
        <script>
            alert('<%= message %>');
        </script>
    <% } %>
</body>
</html>