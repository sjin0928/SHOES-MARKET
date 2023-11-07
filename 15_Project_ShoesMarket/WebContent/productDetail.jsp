<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
 	<link href="css/style.css" rel="stylesheet" />
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
	

    
    <!-- ------------------------------------------------------------------------ -->
    <div id="cart" style="width:1000px; ">
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
						<dd class="desc">${itemVo.itemDetail }</dd>
					</dl>
					<dl class="item1">
						<dd class="cart">
							 수량 :  
				            <input type="button" class="amount" value=" - " onclick="del();">
				            <input type="text" name="cartQuantity" value="1" size="3" readonly>
				            <input type="button" class="amount" value=" + " onclick="add();">
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
    
    <!-- ------------------------------------------------------------------------ -->
    
    <%@ include file="include/footer.jspf" %>
    
</body>
</html>