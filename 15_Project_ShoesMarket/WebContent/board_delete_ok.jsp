<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${result == 1 }">
		<script>
			alert("삭제되었습니다.");
		</script>
		<c:if test="${empty customer }">
			<script>location.href="controller?type=managerNoticeList";</script>
		</c:if>
		<c:if test="${empty adminVo }">
			<script>location.href="controller?type=inquiryList";</script>
		</c:if>
	</c:if>
</body>
</html>