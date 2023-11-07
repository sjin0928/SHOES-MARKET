<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script>
	function all_search() {
		location.href = "controller?type=customer";
	}
	function all_login() {
		location.href = "controller?type=login";
	}
	function all_register() {
		location.href = "controller?type=register";
	}
</script>
</head>
<body>
	<h1>메인 [ home.jsp ]</h1>
	<button onclick="all_search()">전체보기(customer)</button>
	<button onclick="all_login()">로그인(login)</button>
	<button onclick="all_register()">회원가입(register)</button>

</body>
</html>