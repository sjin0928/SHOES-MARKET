<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 등록 완료</title>
<script>
	if (${result } == 1){
		alert("상품이 등록되었습니다.");
		// 상품 게시판으로 이동
		location.href="controller?type=itemBulletinBoard";
	} else {
		history.back();
	}
</script>
</head>
<body>
</body>
</html>