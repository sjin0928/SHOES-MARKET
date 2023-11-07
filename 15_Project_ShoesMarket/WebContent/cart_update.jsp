<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업데이트 완료</title>
<script>
	var result = ${result};
    if (result === 0) {
        alert("상품 업데이트에 실패했습니다.");
        history.back();
    } else {
        alert("상품이 업데이트되었습니다.");
        location.href = "controller?type=cartList"
    }
</script>
</head>
<body>
</body>
</html>
