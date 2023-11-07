<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 메뉴바 부트스트랩 템플릿 사용 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<!--     <link rel="stylesheet" type="text/css" href="css/login.css">   -->
	<link href="css/style1.css" rel="stylesheet" />
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
    <script src="loginScript.jsp"></script>
    <script>
    function validateForm() {
        var cusId = document.forms["loginForm"]["cusId"].value;
        var cusPassword = document.forms["loginForm"]["cusPassword"].value;

        // 빈칸 있을 경우 확인 
        if (cusId == "" && cusPassword == "") {
            alert("아이디와 비밀번호를 입력하세요.");
            return false;
        }

        if (cusId == "") {
            alert("아이디를 입력하세요.");
            return false;
        }

        if (cusPassword == "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }

        return true;
    }
    </script>
</head>
<body>

	<%@ include file="include/header.jspf" %>
	<!-- ------------------------------------------------------------------------ -->
	<br><br><br><br>
  	 <form name="loginForm" action="controller?type=login" method="post" onsubmit="return validateForm()" class="login-form">
        <h2>로그인</h2>
        아이디: <input type="text" name="cusId" placeholder="아이디를 입력해주세요"><br> 
        비밀번호: <input type="password" name="cusPassword" placeholder="비밀번호를 입력해주세요"><br> 
        <input type="submit" value="로그인">
    </form>
    <div class="links">
        <a href="find_id.jsp">아이디 찾기</a>
        <a href="find_password.jsp">비밀번호 찾기</a>
    </div>
    <br><br><br><br>
    <% String successMessage = (String) session.getAttribute("successMessage"); %>
<% if (successMessage != null) { %>
    <script>
        alert('<%= successMessage %>');
        location.href = 'beforeMain.jsp';
        </script>
        <% session.removeAttribute("successMessage"); %> 
    <% } %>
    
     <!-- ------------------------------------------------------------------------ -->
      
      <%@ include file="include/footer.jspf" %>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>