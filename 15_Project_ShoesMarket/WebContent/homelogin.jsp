<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script>
        function my_page() {
            location.href = "controller?type=myPage";
        }
        function logout() {
            location.href = "controller?type=logout";
        }
    </script>
</head>
<body>
    <h1>메인 [ homelogin.jsp ]</h1>
    <c:if test="${sessionScope.customer != null}">
        <p>환영합니다. ${sessionScope.customer.cusNickName}님!</p>
    </c:if>
    <button onclick="my_page()">마이페이지</button>
    <button onclick="logout()">로그아웃</button>
</body>
</html>
