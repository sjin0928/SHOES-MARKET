<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
	<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
<meta charset="UTF-8">
<!-- CSS 파일을 추가 -->
<link rel="stylesheet" type="text/css" href="css/cart.css">  

<title>장바구니</title>


<!-- 이거 -->

<script>
<%@ include file="include/popup.js" %>
<%@ include file="include/search.js" %>
	function go_before() {
	    window.history.back(); // 이전 페이지로 이동
	}
	
	//선택 항목 구매하기 
	// F12 개발자도구에서 document.getElementsByName("selectedItems") 전달값 확인하기
	// "구매하기" 버튼 클릭
    function buySelectedItems() {
        var selectedItems = []; // 체크된 체크박스의 값을 저장할 배열 
        var checkboxes = document.getElementsByName("selectedItems");
		//alert(checkboxes);
        
     	
		//존재 여부 확인
     	// 체크가 될 때 실행 
        if (checkboxes && checkboxes.length > 0) {
        	
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedItems.push(checkboxes[i].value); // value = cartNum
                }
            }
            
            if (selectedItems.length > 0) { 
                var selectedItemsParam = selectedItems.join(',');
                location.href = "controller?type=buy&selectedItems=" + encodeURIComponent(selectedItemsParam);
            }
        }
    }
	
	var xhr; // xhr 변수를 전역 범위에 정의
	var selectedItems = []; // 선택된 아이템을 저장할 배열
	
	//  1-1. Update + -로 수량 기능 수행 (Ajax) 
	function decreaseQuantity(cartNum) {
	    var quantityInput = document.getElementById('cartCount_' + cartNum);
	    var currentQuantity = parseInt(quantityInput.value);
	    if (currentQuantity > 1) {
	        quantityInput.value = currentQuantity - 1;
	        updateQuantity(cartNum);
	    }
	}
	
	function increaseQuantity(cartNum) {
	    var quantityInput = document.getElementById('cartCount_' + cartNum);
	    var currentQuantity = parseInt(quantityInput.value);
	    quantityInput.value = currentQuantity + 1;
	    updateQuantity(cartNum);
	}
	
	//  1-2. Update 기능 수행 (Ajax)
	function updateQuantity(cartNum) {
		console.log("Update selected items button clicked.");
	    var newQuantity = document.getElementById('cartCount_' + cartNum).value;
	    
	    // Ajax 요청을 생성
	    var xhr = new XMLHttpRequest();
	    xhr.open('POST', 'controller?type=update', true);
	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    
	    // 요청 완료 시 처리
	    xhr.onload = function() {
	    	if (xhr.status === 200) {
	            // 업데이트가 성공적으로 처리된 경우에 수행할 작업을 여기에 추가
	            alert("수량 업데이트 성공!")
	            
	            location.href="controller?type=cartList"
	        } else {
	            // 오류 처리
	            console.error('수량 업데이트에 실패했습니다.');
	        }
	    };
	 	// 요청 본문 생성 & Ajax 요청 전송
	    var data = 'cartNum=' + cartNum + '&newQuantity=' + newQuantity;
	    xhr.send(data);
	}
	
	
	// 1-1. toggle 토글 체크박스 부분 --------
	function toggleSelection(cartNum) {
	    var checkbox = document.querySelector('input[name="selectedItems"][value="' + cartNum + '"]');
	    var index = selectedItems.indexOf(cartNum);
		
	    if (checkbox.checked) {
	        if (index === -1) {
	            selectedItems.push(cartNum);
	            console.log("Added to selectedItems: " + cartNum);
	        }
	    } else {
	        if (index !== -1) {
	            selectedItems.splice(index, 1);
	            console.log("Removed from selectedItems: " + cartNum);
	        }
	    }
	}
	
	// 1-2. HTML 문서가 완전히 로드될 때 실행!
	window.onload = function() {
	    var checkboxes = document.querySelectorAll('input[name="selectedItems"]');
	    checkboxes.forEach(function(checkbox) {
	        checkbox.addEventListener("click", function() {
	            var cartNum = checkbox.value;
	            toggleSelection(cartNum);
	        });
	    });
	    
	// 전체 선택 체크박스 이벤트 핸들러 추가 (10/28 전체선택 토글 기능 추가!)
	    var selectAllCheckbox = document.getElementById("selectAll");
	    selectAllCheckbox.addEventListener("click", toggleAllSelection);
	};

	// toggleAllSelection 함수 (10/28 전체선택 토글 기능 추가!)
	function toggleAllSelection() {
	    var checkboxes = document.querySelectorAll('input[name="selectedItems"]');
	    var selectAllCheckbox = document.getElementById("selectAll");

	    if (selectAllCheckbox.checked) {
	        checkboxes.forEach(function (checkbox) {
	            checkbox.checked = true;
	            var cartNum = checkbox.value;
	            toggleSelection(cartNum);
	        });
	    } else {
	        checkboxes.forEach(function (checkbox) {
	            checkbox.checked = false;
	            var cartNum = checkbox.value;
	            toggleSelection(cartNum);
	        });
	    }
	}
	
	
	//----------------------------------------------

	// Delete 기능 수행 (Ajax)
	function deleteSelectedItems() {
	    console.log("Delete selected items button clicked.");
	    var confirmed = confirm("선택한 아이템을 삭제하시겠습니까?");
	
	    if (confirmed && selectedItems.length > 0) {
	    	
	        var xhr = new XMLHttpRequest();
	        xhr.open('POST', 'controller?type=delete&selectedItems', true);
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	
	        xhr.onload = function () {
	            console.log("readyState: " + xhr.readyState + ", status : " + xhr.status);
	                	console.log("responseText : " + xhr.responseText);
	        	if (xhr.status === 200) {
	        		alert("성공했습니다.");	
	        		
	        		location.href="controller?type=cartList";
	            } else {
	                alert("상품 삭제에 실패. HTTP 상태 코드: " + xhr.status);
	            }
	        };
	
	        xhr.onerror = function () {
	            alert("상품 삭제 요청에 실패했습니다.");
	        };
	
	        var cartNums = selectedItems.join(',');
	        var data = 'cartNums=' + cartNums;
	        xhr.send(data);
	    }
	}

		// 새로운 장바구니 목록을 가져오고 업데이트
		function updateCartList() {
		    
			var xhr = new XMLHttpRequest();
		    xhr.open('POST', 'controller?type=cartList', true);
		    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		
		    xhr.onload = function () {
        if (xhr.status === 200) {
        	alert("성공했습니다.");	
            // 새로운 장바구니 목록 HTML을 가져와서 업데이트
            var newCartListHTML = xhr.responseText;
            var cartListContainer = document.getElementById('cartListContainer');
            cartListContainer.innerHTML = newCartListHTML;
        } else {
            alert("장바구니 목록 업데이트에 실패. HTTP 상태 코드: " + xhr.status);
        }
    };

    xhr.onerror = function () {
        alert("장바구니 목록 업데이트 요청에 실패했습니다.");
    };

    xhr.send();
}

</script>
<style>

</style>
</head>
<body class="bg-grey-lighter">
	
<%@ include file="include/header.jspf" %>
<!-- ------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------ -->
<br><br><br><br><br>
	<!-- title area -->
	<h3>CART</h3>
	<div class="basket_txt-container">신규 회원 가입 시, 즉시 사용 가능한 1만원 프모션 코드를 발급해드립니다! 
	(일부 상품 할인 제외, 장바구니 5만원 이상 적용 가능)</div>
	<div class="container"> <!-- 컨테이너 추가 -->
	    
	    <form id="cart" method="post">
	        <div class="row justify-content-center"> <!-- 가운데 정렬을 위한 row와 justify-content-center 추가 -->
	                
            <div id="cartListContainer">
                <table class="tables table-borderless" style="width: 100%; max-width: 100%; font-size: 16px;"> <!-- 부트스트랩 테이블 스타일 적용 -->
                    <thead>
                        <tr>   <!-- 10/28 테이블 데이터 정보 잘 나오게끔 수정함! + 전체 선택 토글 추가! -->
                      <th width="50">
                      <input type="checkbox" id="selectAll" onclick="toggleAllSelection()">
                  	</th>
                      <th width="200">상품명</th>
                      <th width="100">가격</th>
                      <th width="95">수량</th>
                  </tr>
              </thead>
              <tbody>
                  <c:forEach var="vo" items="${cartList}" varStatus="cartStatus">
                      <tr>
                      	<!-- 체크박스 -->
                          <td>
                              <input type="checkbox" name="selectedItems" value="${vo.cartNum}">
                          </td>
                          <!-- 상품명, 가격 -->
                          <td>${itemList[cartStatus.index].name }</td>
                          <!-- 가격 -->
                          <td>${itemList[cartStatus.index].price }</td>
                          <!-- 수량 -->
                          <td>
                              <div class="quantity-controls">
                                  <button type="button" style="font-size: 12px; padding: 3px;" onclick="decreaseQuantity(${vo.cartNum})">-</button>
                                  <input type="number" id="cartCount_${vo.cartNum}" value="${vo.cartQuantity}" style="width: 35px; margin-left:6px; margin-right:6px"; inputmode="numeric">
                                  <button type="button" style="font-size: 12px; padding: 3px;" onclick="increaseQuantity(${vo.cartNum})">+</button>
                              </div>
                          </td>
                      </tr>
                  </c:forEach>

              </tbody>
          </table>
      </div>
      <div style="height: 10px; background-color: white;"></div>
      <button type="button" onclick="deleteSelectedItems()" style="margin-right: 5px;">선택한 아이템 삭제</button>
      <div style="height: 10px; background-color: white;"></div>
      <div style="display: flex; justify-content: flex-left; align-items: center;">
          <button type="button" onclick="go_before()" style="margin-right: 5px;">계속 쇼핑하기</button>
          <button type="button" onclick="buySelectedItems()" style="margin-right: 5px;">구매하기</button>
       </div>
            </div>
    </form>
    </div>
    <br><br><br><br><br><br><br><br>
    <!-- ------------------------------------------------------------------------ -->
    
    <%@ include file="include/footer.jspf" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>