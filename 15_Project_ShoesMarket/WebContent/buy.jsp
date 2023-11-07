<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제 페이지</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<link rel="stylesheet" href="styles.css">
<!-- CSS 파일을 추가 -->
<script>


function redirectToPurchasePage() {
    // 페이지를 이동합니다.
    window.location.href = "purchase.jsp";
}


</script>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h1 {
	text-align: center;
	color: #333;
}

.order-summary, .payment-details {
	margin: 20px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

form {
	margin-top: 20px;
}

label, input {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
<body>
	<div class="container">
		<h1>상품 결제</h1>
		<h1>총 금액 확인 : ${totalCount }</h1>
		<div class="order-summary">
			<h2>주문 내역</h2>
			<table>
				<thead>
					<tr>
						<th>상품명</th>
						<th>상품가격</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach var="vo" items="${selectedCart}" varStatus="cartStatus">
						<tr>
							<td>${selectedItemList[cartStatus.index].price }</td>
							<td>${selectedItemList[cartStatus.index].price }</td>
							<td>${vo.cartQuantity }</td>
						</tr>
					 </c:forEach>
				</tbody>
			</table>
			<table>
				<thead>
					<tr>
						<th>우편번호</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>총 결제금액</th>
					</tr>
				</thead>
				<tbody>
					<!-- BuyVO 필드 추가 -->
					<c:forEach var="buyVO" items="${CartListFromBuyInfo}">
						<td>${buyVO.buyNum}</td>
						<td>${buyVO.buyDate}</td>
						<td>${buyVO.zipCode}</td>
						<td>${buyVO.address}</td>
						<td>${buyVO.phone}</td>
						<td>${buyVO.totalPrice}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="payment-details">
			<h2>결제 정보</h2>
			<form action="purchase.jsp" method="post">
				<!-- hidden input 필드를 추가 -->
				<input type="hidden" id="selectedItems" name="selectedItems"
					value=""> <label for="creditcardnumber">신용카드 번호</label> <input
					type="text" name="creditcardnumber" id="creditcardnumber" required>
				<label for="creditcardpassword">CVC</label> <input type="password"
					name="creditcardpassword" id="creditcardpassword" required>
				<!-- 주문 총액 표시 로직을 여기에 추가 -->
				<p>
					총 결제금액: <span id="totalAmount"><c:out
							value="${finalPayment}" />원</span>
				</p>
				<input type="submit" value="결제하기" onclick="redirectToPurchasePage()">
			</form>
			
			<script>
            document.querySelector("form").addEventListener("submit", function (event) {
                // 폼이 서버로 제출됨
                // 필요한 유효성 검사 및 처리를 수행할 수 있음

                // 입력된 카드 번호와 CVC 부분
                var creditCardNumber = document.getElementById("creditcardnumber").value;
                var cvc = document.getElementById("creditcardpassword").value;
                console.log("카드 번호:", creditCardNumber);
                console.log("CVC:", cvc);

                // 카드 번호와 CVC가 숫자로만 구성되고, 카드 번호가 12자리인지 확인
                if (/^\d{12}$/.test(creditCardNumber) && /^\d{3}$/.test(cvc)) {
                    // 유효한 경우에만 폼이 제출됩니다.
                    // 폼은 기본 동작을 중지하고 서버로 이동
                    // 필요한 로직을 수행하고 나중에 서버에서 주문 완료 페이지로 리디렉션
                } else {
                    // 유효하지 않은 입력에 대한 메시지를 표시합니다.
                    alert("카드 번호는 12자리의 숫자이어야 하며, CVC는 3자리 숫자여야 합니다.");
                    event.preventDefault(); // 폼 제출을 중지하고 페이지에서 유지
                }
            });
			</script>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>