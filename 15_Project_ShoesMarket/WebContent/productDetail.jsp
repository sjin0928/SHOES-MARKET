<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<title>상품 상세</title>
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 
function add() { // + 버튼 누르면 수량 증가
	var amountInput = document.getElementsByName("cartQuantity")[0];
	var currentAmount = parseInt(amountInput.value);
	amountInput.value = currentAmount + 1;
}

function del() { // - 버튼 누르면 수량 감소
	var amountInput = document.getElementsByName("cartQuantity")[0];
	var currentAmount = parseInt(amountInput.value);
	if (currentAmount != 1){ // 1일 때는 감소 안 함
		amountInput.value = currentAmount - 1;
	}
	if (currentAmount == 1){ // 1일 때는 감소 안 함
		alert("최소 주문수량은 1개입니다.");
	}
}

function cart_go() {
	var form = document.forms["basket"];
	//alert(form);
	//var cartQuantity = document.querySelector('input[name="cartQuantity"]');
	form.action="controller?type=toCart";
	form.submit();
}

function order_go() {
	
}
 
 </script>
</head>
<body>
	
	<%@ include file="include/header.jspf" %>
  	
  	<!-- ------------------------------------------------------------------------ -->
	
	<!-- List가 아닌 ItemVO 타입 전달받음 ! (${itemVo.name }) -->
	

    <br><br><br>
    <!-- ------------------------------------------------------------------------ -->
    <div id="cart" class="mx-auto" style="width:1000px; ">
    	<div class="th">
    	<img src="${itemVo.imagePath }" alt="상품 이미지" width="350">
    	</div>
    	
	    <form name="basket" method="post">
	    	<div class="items">
	    	<div class="itemBrand">${itemVo.brand }</div>
	    		<div class="itemName"> <h2>${itemVo.name }</h2></div>
	    		<div class="price">${itemVo.price }원</div>
	    		<div class="itemInfo">
	    			<dl class="item1">
						<dt class="tit"></dt>
						<dd class="desc-container">${itemVo.itemDetail }</dd>
					</dl>
					<dl class="item1">
					<!-- 사이즈 추가할 거면 select name , option value 추가 해야함 -->
					 <select class="form-select" aria-label="Default select example" style="width:250px; height:25px ">
					  <option selected>사이즈</option>
					  <option>230</option>
					  <option>240</option>
					  <option>250</option>
					  <option>260</option>
					  <option>270</option>
					  <option >280</option>
					</select>
					</dl>
					<dl class="item1" >
						<dd class="cart">
							 수량 
				            <input type="button" class="amount" value=" - " onclick="del();" style="padding: 3px 3px;">
				            <input type="text" name="cartQuantity" value="1" size="3" readonly>
				            <input type="button" class="amount" value=" + " onclick="add();" style="padding: 3px 2px;">
						</dd>
					</dl>
					
					<dl class="list2">
						<dd class="cart">
						<input type="button" class="cartBtn" value=" 장바구니 " onclick="cart_go();" />
						<input type="button" class="orderBtn" value=" 바로구매 " onclick="order_go();" />
						</dd>
					</dl>
					
	    		</div>
	    	</div>
	    </form>
    
    </div>
    <br><br><br>
    <!-- ------------------------------------------------------------------------ -->
    
    <%@ include file="include/footer.jspf" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>