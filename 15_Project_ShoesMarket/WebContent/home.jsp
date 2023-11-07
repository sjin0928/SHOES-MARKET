<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
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