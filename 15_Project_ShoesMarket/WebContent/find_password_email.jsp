<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
 	<link href="css/style.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="css/style1.css" rel="stylesheet" />	
</head>
<body>
	<%@ include file="include/header.jspf" %>	
	<h1>비밀번호 찾기</h1>
    <div class="links">
	    <a href="find_password.jsp">휴대폰 번호로 비밀번호 찾기</a>
	    <a>이메일 주소로 비밀번호 찾기</a>
    </div>
    <form action="controller?type=findPasswordByEmail" method="post" class="find-id-form">
        아이디: <input type="text" name="cusId" required placeholder="아이디를 입력해주세요"><br> 
        이름: <input type="text" name="cusName" required placeholder="이름을 입력해주세요"><br> 
        이메일주소: <input type="text" name="cusEmail" required placeholder="이메일주소를 입력해주세요"><br>  
        <input type="submit" value="확인"><br>
    </form>

    <div class="links">
        <a href="login.jsp">로그인</a>
        <a href="register.jsp">회원가입</a>
    </div>
	<%@ include file="include/footer.jspf" %>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
