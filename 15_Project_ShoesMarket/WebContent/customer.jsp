<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
    <h1>회원정보조회 [ customer.jsp ]</h1>
    <h3>회원번호, 회원아이디, 비밀번호, 이름, 닉네임, 전화번호, 생성일, 수정일</h3>
    <ul>
    <c:forEach var="vo" items="${customer }">
        <li>
            ${vo.cusNum }, ${vo.cusId }, ${vo.cusPassword }, ${vo.cusName }, ${vo.cusNickName }, ${vo.cusEmail }, ${vo.cusPhoneNum }, ${vo.cusRegDate }, ${vo.cusModDate } 
        </li>
    </c:forEach>
    </ul>
</body>
</html>