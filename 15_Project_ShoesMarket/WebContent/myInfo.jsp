<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(정보조회)</title>
<!-- 메뉴바 외 코드 -->
<link href="css/style.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<!-- 메뉴바 부트스트랩 템플릿 사용 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css"
	integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG"
	crossorigin="anonymous">
<script>
	
<%@ include file="include/popup.js" %>
	
</script>
<style>
table {
	font-family: Arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	width: 100px;
	white-space: nowrap;
}

td {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	width: 100px;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<%@ include file="include/header.jspf"%>
	<form class="myinfo">
		<div class="container">
			<h1>마이페이지</h1>
			<h3>개인정보 수정</h3>
			<a href="controller?type=myPage">개인정보 수정</a>
			<h3>주문내역</h3>
			<div>
				<!-- 주문 내역 있을 때 조회 가능하도록 설정 -->
				<c:choose>
					<c:when test="${empty orderedList }">
						<p>주문 내역이 없습니다</p>
					</c:when>
					<c:otherwise>
						<!--
						<c:forEach var="buyVo" items="${orderedList }">
							<p>주문내역</p>
							<p>${buyVo.buyNum }, ${buyVo.cusNum }, ${buyVo.phone }</p>
						</c:forEach> -->

						<table>
							<div class="table-container">
								<h2>${vo.cartNum }</h2>
								<form action="orderlist" method="get" id="paymentForm">
									<table>
										<tr>
											<th>주문자</th>
											<td>${customer.cusName}</td>
											<th>전화번호</th>
											<td>${customer.cusPhoneNum}</td>
										</tr>
										<tr>
											<th>상품명</th>
											<td>${customer.cusEmail}</td>
											<th>상품가격</th>
											<td>${param.postalCode}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td colspan="3">${param.address}</td>
										</tr>
									</table>
									<table>
										<thead>
											<tr>
												<th>상품명</th>
												<th>상품가격</th>
												<th>수량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="vo" items="${selectedCart}"
												varStatus="cartStatus">
												<tr>
													<td>${selectedItemList[cartStatus.index].name }</td>
													<td>${selectedItemList[cartStatus.index].price }</td>
													<td>${vo.cartQuantity }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
							<table>
								<tbody>
									<tr>
										<td>주문총액</td>
										<td><span id="totalAmount"
											style="font-size: 1.5em; font-weight: bold;"> <c:out
													value="${totalCount}원" />
										</span></td>
									</tr>
								</tbody>
							</table>

							<!--  	
							<form>
								<c:set var="selectedItems" value="${param.selectedItems}" />

								<!-- 기타 결제 정보 입력 필드 등 추가 -->
							<!-- 주문 총액 표시 로직을 여기에 추가 -->
							<!--   <p style="font-size: 1.5em;">
									주문총액: <span id="totalAmount"
										style="font-size: 1.5em; font-weight: bold;"><c:out
											value="${totalCount }" />원</span>
								</p>
							</form> -->
						</table>

					</c:otherwise>
				</c:choose>
			</div>
			<div class="post-container">
				<h3>게시글 내역</h3>
				<div class="post-content">
					<div>
						<!-- 작성한 게시물이 있을 때 조회 가능하도록 설정 -->
						<c:choose>
							<c:when test="${empty inquiryList }">
								<p>문의 게시글이 없습니다</p>
							</c:when>
							<c:otherwise>
								<h4>문의 게시글</h4>
								<c:forEach var="inquiryVo" items="${inquiryList }">

									<table class="inquiry-table">
										<thead>
											<tr>
												<th>게시글번호</th>
												<th>회원번호</th>
												<th>제목</th>
												<th>내용</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="inquiryVo" items="${inquiryList}">
												<tr>
													<td>${inquiryVo.inquiryNum}</td>
													<td>${inquiryVo.cusNum}</td>
													<td style="max-width: 200px; word-wrap: break-word;">${inquiryVo.title}</td>
													<td style="max-width: 200px; word-wrap: break-word;">${inquiryVo.contents}</td>
												</tr>
												<br>
											</c:forEach>
										</tbody>
									</table>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</form>

	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- 부트스트랩 -->
	<%@ include file="include/footer.jspf"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
