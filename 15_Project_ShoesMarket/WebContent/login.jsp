<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
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
	<h2>로그인</h2>
    <form name="loginForm" action="controller?type=login" method="post" onsubmit="return validateForm()">
    	아이디: <input type="text" name="cusId" placeholder="아이디를 입력해주세요"><br> 
    	비밀번호: <input type="password" name="cusPassword" placeholder="비밀번호를 입력해주세요"><br> 
    	<input type="submit" value="Login">
    </form>
    
    <div class="links">
        <a href="find_id.jsp">아이디 찾기</a>
        <a href="find_password.jsp">비밀번호 찾기</a>
        <a href="home.jsp">메인페이지</a>
    </div>
    <br><br><br><br>
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
        <script>
            alert('<%= message %>');
        </script>
    <% } %>
    
     <!-- ------------------------------------------------------------------------ -->
      
     <%@ include file="include/footer.jspf" %>
</body>
</html>