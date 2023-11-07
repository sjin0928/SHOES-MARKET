<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
 	<link href="css/style.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/style.css">
		<link href="css/style1.css" rel="stylesheet" />	
</head>
<body>
<%@ include file="include/header.jspf" %>    
    <div class="result-page">
        <h1>아이디 찾기 결과</h1>
        <p>찾은 아이디는 <span style="color: red;">${foundId}</span> 입니다</p>

        <div class="links">
            <a href="login.jsp">로그인 화면으로 돌아가기</a>
        </div>
    </div>

<%@ include file="include/footer.jspf" %>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
