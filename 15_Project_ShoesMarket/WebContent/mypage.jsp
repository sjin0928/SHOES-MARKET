<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- 메뉴바 외 코드 -->
<link href="css/style.css" rel="stylesheet" />
<!-- 메뉴바 부트스트랩 템플릿 사용 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css"
	integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG"
	crossorigin="anonymous">
<link href="css/style1.css" rel="stylesheet" />
<script>
	
<%@ include file="include/popup.js" %>
	function checkDuplicateNickName() {
		var cusNickName = document.getElementsByName("cusNickName")[0].value;
		if (cusNickName) {
			var xhr = new XMLHttpRequest();
			var encodedNickName = encodeURIComponent(cusNickName);
			xhr.open("GET",
					"controller?type=checkDuplicateNickName&cusNickName="
							+ encodedNickName, true);

			xhr.onreadystatechange = function() {
				console.log("onreadystatechange 호출됨"); // 확인용 로그
				if (xhr.readyState === XMLHttpRequest.DONE
						&& xhr.status === 200) {
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
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");

			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE
						&& xhr.status === 200) {
					alert("회원 탈퇴가 완료되었습니다.");
					location.href = "beforeMain.jsp"; // 홈 페이지로 이동
				}
			};

			xhr.send("action=delete"); // 회원 탈퇴 액션 호출
		}
	}
</script>
</head>
<body>
	<%@ include file="include/header.jspf"%>
	<h1>개인정보수정</h1>
	<c:if test="${not empty customer}">
		<form class="update-form" action="controller?type=myPage"
			method="post">
			<input type="hidden" name="cusNum" value="${customer.cusNum}">
			<p>
				회원아이디: <span style="color: green;">${customer.cusId}</span>
			</p>
			<p>
				비밀번호: <input type="password" name="cusPassword"
					value="${customer.cusPassword}">
			</p>
			<p>
				이름: <input type="text" name="cusName" value="${customer.cusName}">
			</p>
			<p>
				닉네임: <input type="text" name="cusNickName"
					value="${customer.cusNickName}"> <input type="button"
					value="중복 확인" onclick="checkDuplicateNickName()">
			</p>
			<p>
				이메일주소: <span style="color: blue;">${customer.cusEmail}</span>
			</p>
			<p>
				전화번호: <input type="text" name="cusPhoneNum"
					value="${customer.cusPhoneNum}">
			</p>
			<p>
				가입일 : <span style="color: black;">${customer.cusRegDate}</span>
			</p>
			<input type="hidden" name="action" value="update"> <input
				type="submit" value="회원정보 수정">
			<script>
				function checkUpdate() {
					alert("회원정보가 업데이트되었습니다.");
					return true;
				}
			</script>
			<button type="button" onclick="location.href='myInfo.jsp'">취소</button>
		</form>
		<form class="update-form" onsubmit="checkDelete(); return false;">
			<input type="submit" value="회원 탈퇴">
		</form>
		<c:if test="${not empty param.updateMessage}">
			<p>${param.updateMessage}</p>
		</c:if>
		<!-- 업데이트 성공 시 JavaScript 코드 출력 -->
		<c:if test="${not empty param.updateSuccessScript}">
            ${param.updateSuccessScript}
        </c:if>
	</c:if>

	<!-- 부트스트랩 -->
	<%@ include file="include/footer.jspf"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
