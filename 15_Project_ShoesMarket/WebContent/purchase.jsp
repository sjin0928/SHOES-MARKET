<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>결제완료</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
	<!-- CSS 파일을 추가 -->
	<link rel="stylesheet" type="text/css" href="css/purchase.css"> 
</head>

<script>
<%@ include file="include/popup.js" %>
<%@ include file="include/search.js" %>	
	
function go_orderList() {
	var form = document.getElementById("paymentForm");
        
	var aInput = document.createElement("input");
    aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
    aInput.name = "type"; // 이름 설정
    aInput.value = "list"; // 값을 설정

    // 폼에 추가 데이터를 추가
    form.appendChild(aInput);
        
    // 폼을 서버로 제출
    form.submit();
}
</script>

<body>
  	
	<%@ include file="include/header.jspf" %>
	<!-- ------------------------------------------------------------------------ -->

	 	<div class="animation-ctn">
	   	<div class="icon icon--order-success svg">
	      	<svg xmlns="http://www.w3.org/2000/svg" width="154px" height="154px">
	        	<g fill="none" stroke="#22AE73" stroke-width="2">
	          	<circle cx="77" cy="77" r="72" style="stroke-dasharray:480px, 480px; stroke-dashoffset: 960px;"></circle>
	          	<circle id="colored" fill="#22AE73" cx="77" cy="77" r="72" style="stroke-dasharray:480px, 480px; stroke-dashoffset: 960px;"></circle>
	          	<polyline class="st0" stroke="#fff" stroke-width="10" points="43.5,77.8 63.7,97.9 112.2,49.4 " style="stroke-dasharray:100px, 100px; stroke-dashoffset: 200px;" />
	        	</g>
	      	</svg>
	   	</div>
	  	</div>
	
	  	<div>
	    <h1>Successfully Ordered</h1>
	    <p>주문이 완료되었습니다. 감사합니다!</p>
	  	</div>

		<div class=".table-borderless ">
		<h2>${vo.cartNum }</h2>
	 		<form action="orderlist" method="get" id="paymentForm">
			<table>
		        <thead>
		            <tr>
		                <th>상품명</th>
		                <th></th>
		                <th></th>
		                <th>상품가격</th>
		                <th></th>
		                <th></th>
		                <th>수량</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="vo" items="${selectedCart}" varStatus="cartStatus">
							<tr>
								<td>${selectedItemList[cartStatus.index].name }</td>
								<td></td>
								<td></td>
								<td>${selectedItemList[cartStatus.index].price }</td>
								<td></td>
								<td></td>
								<td>${vo.cartQuantity }</td>
							</tr>
					</c:forEach>
		        </tbody>
		    </table> 
		    </form>
		</div>
		<hr>
		<form>    
		    <c:set var="selectedItems" value="${param.selectedItems}" />
		    
		    
		    <!-- buy.jsp에서 전달된 고객 정보 출력 -->
		    <p>Name : ${customer.cusName}</p>
		    <p>Phone : ${customer.cusPhoneNum}</p>
		    <p>Email : ${customer.cusEmail}</p>
		    <p>우편번호 : ${param.zipCode}</p>
		    <p>주소 : ${param.address}</p>
		    <p>상세주소 : ${param.detailAddress}</p>
		
		    <!-- 기타 결제 정보 입력 필드 등 추가 -->
			<!-- 주문 총액 표시 로직을 여기에 추가 -->
	        <p style="font-size: 1.5em;">
	            총 결제금액: <span id="totalAmount" style="font-size: 1.5em; font-weight: bold;"><c:out value="${totalCount }" />원</span>
	        </p>
		</form>
	
	    <!-- 제출 버튼 -->
	    <div class="wrapper paymengt_card-detail">
	    <h2 class="bottom_detail">SHOESMARKET<a class="payment_button-goBack" href="controller?type=main">Go Back</a></h2>
	
	    </div>
	<!-- ------------------------------------------------------------------------ -->
    
    <%@ include file="include/footer.jspf" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html> 