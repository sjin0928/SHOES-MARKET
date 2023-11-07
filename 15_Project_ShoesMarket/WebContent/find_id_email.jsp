<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<h1>아이디 찾기</h1>
	<div class="links">
		<a href="find_id.jsp">휴대폰 번호로 찾기</a>
		 <a>이메일 주소로 아이디 찾기</a>
	</div>
	<form action="controller?type=findIdByEmail" method="post">
		이름: <input type="text" name="cusName" required placeholder="이름을 입력해주세요"><br>
		 이메일 주소: <input type="text" name="cusEmail" required placeholder="이메일 주소를 입력해주세요"><br>
		<input type="submit" value="확인"><br>
	</form>

	<div class="links">
		<a href="find_password.jsp">비밀번호 찾기</a>
		<a href="login.jsp">로그인</a>
		<a href="home.jsp">홈</a>
		<a href="register.jsp">회원가입</a>
	</div>
</body>
</html>
