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
<link rel="stylesheet" type="text/css" href="css/buy.css">  
<script>

/* 
function redirectToPurchasePage() {
    // 페이지를 이동합니다.
    window.location.href = "purchase.jsp";
}
 */

function submitCardDetails() {
    var form = document.querySelector("form"); // 폼 객체 
    //alert(form);
   
    var postalCode = document.getElementById("postalCode").value;
    var address = document.getElementById("address").value;
    var creditCardNumber = document.getElementById("creditcardnumber").value;
    var cvc = document.getElementById("creditcardpassword").value;
    
    
    var creditCardChecked = document.querySelector("input[name='payment'][value='신용카드']").checked;
    var bankTransferChecked = document.querySelector("input[name='payment'][value='계좌이체']").checked;
   
    
    // 제약 조건 (상세주소, 신용카드 체크 여부, 요청사항)
    var constraints = [
        { condition: postalCode.length === 0, message: "우편번호를 입력해 주세요." },
        { condition: address.length === 0, message: "주소를 입력해 주세요." },
        { condition: !creditCardChecked && !bankTransferChecked, message: "결제수단을 선택해 주세요." },
        { condition: !/^\d{12}$/.test(creditCardNumber) || !/^\d{3}$/.test(cvc), message: "카드 번호는 12자리의 숫자이어야 하며, CVC는 3자리 숫자여야 합니다." }
    ];

    for (var i = 0; i < constraints.length; i++) {
        if (constraints[i].condition) {
            alert(constraints[i].message);
            return false;
        }
    }

    form.submit();
}
    
    
    // 제약 조건 (상세주소, 신용카드 체크 여부, 요청사항 for문 써서 title="")
/*    if (postalCode.length === 0 || address.length === 0) {
        alert("우편번호와 주소를 입력해 주세요.");
        return false;
    } else if (!creditCardChecked && !bankTransferChecked) {
       alert("결제수단을 선택해 주세요.");
        return false;
    } else if (!/^\d{12}$/.test(creditCardNumber) || !/^\d{3}$/.test(cvc)) {
        alert("카드 번호는 12자리의 숫자이어야 하며, CVC는 3자리 숫자여야 합니다.");
        console.log("creditCardNumber: " + creditCardNumber);
        console.log("cvc: " + cvc);
        return false;
    } else {
        // If all conditions are met, submit the form
       form.submit();
    }

}
*/
</script>
</head>

<body>
<main>
   <div class="table-container">
      <div class="order-summary-container">
         <h1>ORDER</h1>
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
                     <td>${selectedItemList[cartStatus.index].name }</td>
                     <td>${selectedItemList[cartStatus.index].price }</td>
                     <td>${vo.cartQuantity }</td>
                  </tr>
                </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
      
   <div class="payment-details">
       <form action="controller?type=purchase" method="post" accept-charset="UTF-8">
         
         <c:forEach var="vo" items="${selectedItems}">
             <!-- 이 부분에서 selectedCart에 데이터를 추가 -->
             <c:set var="selectedCart" value="${selectedCart}${vo}" />
         </c:forEach>
            
           <!-- hidden input 선택한 상품 정보 필드 추가 -->
            <input type="hidden" id="selectedItems" name="selectedItems" value="${selectedItems}">
           
       <div class="customer-information-box">
           <h3>CUSTOMER INFORMATION</h3>
           <p style="font-size: 1.2em;">Name : ${customer.cusName}</p>
           <p style="font-size: 1.2em;">Phone : ${customer.cusPhoneNum}</p>
           <p style="font-size: 1.2em;">Email : ${customer.cusEmail}</p>
           <!-- 주소 및 고객정보 입력 -->
           <label for="postalCode" style="font-size: 1.2em; font-weight: bold;">우편번호</label>
           <input type="text" name="zipCode" id="postalCode" pattern="\d{5}" required style="width: 200px;">
           <!-- 주소 -->
           <label for="address" style="font-size: 1.2em; font-weight: bold;">주소</label>
           <input type="text" name="address" id="address" required style="width: 500px;">
           <!-- 상세주소 -->
           <label for="address" style="font-size: 1.2em; font-weight: bold;">상세주소</label>
           <input type="text" name="detailAddress" id="address" required style="width: 500px;">
           <!-- 배송요청사항 -->
           <label for="address" style="font-size: 1.2em; font-weight: bold;">배송 요청사항</label>
           <input type="text" name="deliveryRequest" title="상세주소" id="address" required style="width: 500px;">
      </div>
      <div class="payment-box">    
           <h3>PAYMENT</h3>   
         <div class="form-check">
           <!-- 결제수단 -->
           <!--  <h4>결제수단</h4> -->   
           <input class="form-check-input" type="checkbox" name="payment" value="신용카드" id="flexCheckDefault">
           <label class="form-check-label" for="flexCheckDefault">
             신용카드
           </label>
           <input class="form-check-input" type="checkbox" name="payment" value="계좌이체" id="flexCheckDefault">
           <label class="form-check-label" for="flexCheckDefault">
             계좌이체 
           </label>
        </div>
        <div class="card-detail">
            <!-- 신용카드 정보 입력란 -->
           <label for="creditcardnumber">CARD NUMBER</label> 
           <input type="text" name="creditcardnumber" id="creditcardnumber" pattern="\d{12}" required style="width: 200px;">
           <label for="creditcardpassword">CVC</label> 
           <input type="password" name="creditcardpassword" id="creditcardpassword" pattern="\d{3}" required style="width: 200px;">
          </div>
      </div>     
           <!-- 주문 총액 표시 로직을 여기에 추가 -->
           <p style="font-size: 2em; font-weight: bold; color:black;">
               TOTAL: <span id="totalAmount" font-weight: bold;"><c:out value="${totalCount }" />원</span>
           </p>
           <input type="hidden" id="selectedItemsInput" name="selectedItems" value="${finalPayment}">
          <input type="button" value="결제하기" onclick="submitCardDetails()">

       </form>
   </div>
</main>
</body>
</html>