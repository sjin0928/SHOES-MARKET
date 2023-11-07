<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제</title>
<script>
	var result = ${result};
	if (result === 0) {
	    alert("상품 삭제 실패.");
	    history.back();
	} else {
		alert("상품 삭제 성공.");
	    window.location.href = "controller?type=cartList"; // 삭제 후에 장바구니 목록으로 이동
	}
</script>
</head>
<body>
</body>
</html>