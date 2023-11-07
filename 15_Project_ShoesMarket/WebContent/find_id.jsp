<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <a>휴대폰 번호로 찾기</a>
	    <a href="find_id_email.jsp">이메일 주소로 아이디 찾기</a>
    </div>
	<form action="controller?type=findId" method="post">
        이름: <input type="text" name="cusName" required placeholder="이름을 입력해주세요"><br> 
        휴대폰번호: <input type="text" name="cusPhoneNum" required placeholder="휴대폰번호를 입력해주세요"><br>  
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