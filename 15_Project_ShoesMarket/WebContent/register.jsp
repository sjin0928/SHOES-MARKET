<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
	<link href="css/style.css" rel="stylesheet" />
	<!-- 메뉴바 부트스트랩 템플릿 사용 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
	<!--     <link rel="stylesheet" type="text/css" href="css/login.css">   -->
	<link href="css/style1.css" rel="stylesheet" />
	 <script>
 	<%@ include file="include/popup.js" %>
 	<%@ include file="include/search.js" %>
 </script>
    <script>
        function go_Home() {
            location.href = "beforeMain.jsp";
        }

        function checkId() {
            var cusId = document.getElementById('cusId').value;
            if (cusId.length > 0 && (cusId.length < 5 || cusId.length > 12)) {
                document.getElementById('idMessage').innerText = "아이디는 5자 이상 12자 이하여야 합니다.";
            } else {
                document.getElementById('idMessage').innerText = "";
            }
        }
        
        function checkPassword() {
            var cusPassword = document.getElementById('cusPassword').value;
            if (cusPassword.length > 0 && cusPassword.length < 5 || cusPassword.length > 12) {
                document.getElementById('passwordMessage').innerText = "비밀번호는 5자 이상 12자 이하여야 합니다.";
            } else {
                document.getElementById('passwordMessage').innerText = "";
            }
        }
        
        function checkPasswordConfirm() {
            var cusPasswordConfirm = document.getElementById('cusPasswordConfirm').value;
            if (cusPasswordConfirm.length > 0 && cusPasswordConfirm.length < 5 || cusPasswordConfirm.length > 12) {
                document.getElementById('passwordConfirmMessage').innerText = "비밀번호 확인은 5자 이상 12자 이하여야 합니다.";
            } else {
                document.getElementById('passwordConfirmMessage').innerText = "";
            }
        }
        
        function checkName() {
            var cusName = document.getElementById('cusName').value;
            if (cusName.length > 0 && cusName.length < 2) {
                document.getElementById('nameMessage').innerText = "이름은 2글자 이상이어야 합니다.";
            } else {
                document.getElementById('nameMessage').innerText = "";
            }
        }

        function isValidEmail(email) {
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return emailRegex.test(email);
        }
        
        function checkEmail() {
            var cusEmail = document.getElementById('cusEmail').value;
            var emailMessage = document.getElementById('emailMessage');
            if (cusEmail.length > 0 && !isValidEmail(cusEmail)) {
                emailMessage.innerText = "올바른 이메일 형식이 아닙니다.";
            } else {
                emailMessage.innerText = "";
            }
        }
        
        function checkPhoneNumber() {
            var cusPhoneNum = document.getElementById('cusPhoneNum').value;
            if (cusPhoneNum.length > 0 && !/^[0-9]+$/.test(cusPhoneNum)) {
                document.getElementById('phoneNumMessage').innerText = "숫자만 입력해주세요.";
            } else {
                document.getElementById('phoneNumMessage').innerText = "";
            }
        }
        
        function checkNickName() {
            var cusNickName = document.getElementById('cusNickName').value;
            if (cusNickName.length > 0 && cusNickName.length < 2) {
                document.getElementById('nickNameMessage').innerText = "닉네임은 2글자 이상이어야 합니다.";
            } else {
                document.getElementById('nickNameMessage').innerText = "";
               
            }
        }

    </script>
</head>
<body>
    <%@ include file="include/header.jspf"%>
    <div class="container register-signup">
    <h1>회원가입</h1>
    <form action="controller?type=register" method="post" onsubmit="return validateForm()">
        아이디: <input type="text" name="cusId" id="cusId" placeholder="아이디를 입력해주세요"
                    value="${not empty cusId ? cusId : ''}" oninput="checkId()"><br>
        <span id="idMessage" style="color:red;"></span><br>

        비밀번호: <input type="password" name="cusPassword" id="cusPassword" placeholder="비밀번호를 입력해주세요" oninput="checkPassword()"><br>
        <span id="passwordMessage" style="color:red;"></span><br>

        비밀번호 확인: <input type="password" name="cusPasswordConfirm"
    	id="cusPasswordConfirm" placeholder="비밀번호를 재입력해주세요" oninput="checkPasswordConfirm()"><br>
		<span id="passwordConfirmMessage" style="color:red;"></span><br>
        이름: <input type="text" name="cusName" id="cusName" placeholder="이름을 입력해주세요" oninput="checkName()"><br>
		<span id="nameMessage" style="color:red;"></span><br>
        닉네임: <input type="text" name="cusNickName" id="cusNickName" placeholder="닉네임을 입력해주세요" oninput="checkNickName()"><br>
		<span id="nickNameMessage" style="color:red;"></span><br>
        이메일: <input type="text" name="cusEmail" id="cusEmail" placeholder="이메일을 입력해주세요" oninput="checkEmail()"><br>
		<span id="emailMessage" style="color:red;"></span><br>
        전화번호: <input type="text" name="cusPhoneNum" id="cusPhoneNum" placeholder="전화번호를 입력해주세요" oninput="checkPhoneNumber()"><br>
<span id="phoneNumMessage" style="color:red;"></span><br>
        <div style="display: flex; align-items: center;">
        <input type="submit" value="가입하기" style="margin-right: 5cm;">
        <button type="button" onclick="go_Home()" style="margin-left: 5cm;">취소</button>
    			</div>
    		</form>
    	</div>

    <%
    String message = (String) request.getAttribute("registerMessage");
    %>
    <%
    if (message != null) {
    %>
        <script>
            alert('<%=message%>');
        </script>
    <%
    }
    %>

    <%@ include file="include/footer.jspf"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
