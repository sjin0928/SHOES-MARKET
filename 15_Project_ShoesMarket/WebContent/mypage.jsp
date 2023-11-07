<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <script>
    function checkDuplicateNickName() {
        var cusNickName = document.getElementsByName("cusNickName")[0].value;
        if (cusNickName) {
            var xhr = new XMLHttpRequest();
            var encodedNickName = encodeURIComponent(cusNickName);
            xhr.open("GET", "controller?type=checkDuplicateNickName&cusNickName=" + encodedNickName, true);

            xhr.onreadystatechange = function () {
                console.log("onreadystatechange 호출됨"); // 확인용 로그
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    console.log("서버 응답 받음:", response); // 확인용 로그

                    if (response.isDuplicate) {
                        alert("이미 존재하는 닉네임입니다. 다른 닉네임을 사용해주세요.");
                    } else {
                        alert("사용 가능한 닉네임입니다.");
                    }
                }
            };
            xhr.send();
        } else {
            alert("닉네임을 입력해주세요.");
        }
    }

    function checkDelete() {
        var confirmDelete = confirm("정말로 회원 탈퇴하시겠습니까?");
        if (confirmDelete) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "controller?type=myPage", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    alert("회원 탈퇴가 완료되었습니다.");
                    location.href = "home.jsp"; // 홈 페이지로 이동
                }
            };

            xhr.send("action=delete"); // 회원 탈퇴 액션 호출
        }
    }
    </script>
</head>
<body>
    <h1>마이페이지</h1>
    <c:if test="${not empty customer}">
        <form action="controller?type=myPage" method="post">
            <input type="hidden" name="cusNum" value="${customer.cusNum}">
            <p>회원아이디: ${customer.cusId}</p>
            <p>비밀번호: <input type="password" name="cusPassword" value="${customer.cusPassword}"></p>
            <p>이름: <input type="text" name="cusName" value="${customer.cusName}"></p>
            <p>닉네임: <input type="text" name="cusNickName" value="${customer.cusNickName}">
                      <input type="button" value="중복 확인" onclick="checkDuplicateNickName()"></p>
            <p>이메일주소: ${customer.cusEmail}</p>
            <p>전화번호: <input type="text" name="cusPhoneNum" value="${customer.cusPhoneNum}"></p>
            <p>가입일 : ${customer.cusRegDate}</p>
            <input type="hidden" name="action" value="update"> 
            <input type="submit" value="회원정보 수정">
        </form>
        <form action="homelogin.jsp" method="post">
            <input type="submit" value="취소">
        </form>
        <form onsubmit="checkDelete(); return false;">
    		<input type="submit" value="회원 탈퇴">
		</form>
        <c:if test="${not empty param.updateMessage}">
            <p>${param.updateMessage}</p>
        </c:if>
    </c:if>
</body>
</html>
