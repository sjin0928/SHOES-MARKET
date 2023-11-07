<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script>
	
	function go_main() {
		window.location.href = "main.jsp";
	}
	
	function go_login() {
		//location.href = "list.jsp";
		location.href = "login";
	}
	
	function go_before() {
	    window.history.back(); // 이전 페이지로 이동
	}
	
	//선택 항목 구매하기 
	// F12 개발자도구에서 document.getElementsByName("selectedItems") 전달값 확인하기
	// "구매하기" 버튼 클릭
    function buySelectedItems() {
        var selectedItems = [];
        var checkboxes = document.getElementsByName("selectedItems");

     	//존재 여부 확인
        if (checkboxes && checkboxes.length > 0) {
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedItems.push(checkboxes[i].value);
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
	
	// 1-2. HTML 문서 로드될 때 실행되는 코드
	window.onload = function() {
	    var checkboxes = document.querySelectorAll('input[name="selectedItems"]');
	    checkboxes.forEach(function(checkbox) {
	        checkbox.addEventListener("click", function() {
	            var cartNum = checkbox.value;
	            toggleSelection(cartNum);
	        });
	    });
	};
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
	table {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
    }
    
    th, td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    
    th {
        background-color: #f2f2f2;
    }
    
    .quantity-controls {
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    button {
        background-color: #007BFF;
        color: #fff;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
    }
    
    button:hover {
        background-color: #0056b3;
    }
    
    #cart {
        text-align: right;
        margin-top: 10px;
    }
    
    #cartListContainer {
        width: 100%;
        overflow-x: auto;
    }
    
    button#cart-action-button {
        display: inline-block;
        background-color: #007BFF;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
    }
    
    button#cart-action-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <button onclick="go_main()">HOME</button>
    <button onclick="go_login()">로그인</button>

    <h1>장바구니 [ cart.jsp ]</h1>
    <form id="cart" action="buy.jsp" method="post">
        <div id="cartListContainer">
            <table border=bold>
                <thead>
                    <tr>
                        <th width="50">선택</th>
                        <th width="70">상품번호</th>
                        <th width="200">상품명</th>
                        <th width="200">상품설명</th>
                        <th width="100">가격</th>
                        <th width="95">수량</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="vo" items="${cartList}">
                        <tr>
                            <td>
                                <input type="checkbox" name="selectedItems" value="${vo.cartNum}">
                            </td>
                            <td>${vo.cartNum}</td>
                            <td>${vo.itemNum}</td>
                            <td>${vo.cusNum}</td>
                            <td>${vo.cartQuantity}</td>
                            <td>
                                <div class="quantity-controls">
                                    <button type="button" style="font-size: 12px; padding: 3px;" onclick="decreaseQuantity(${vo.cartNum})">-</button>
                                    <input type="number" id="cartCount_${vo.cartNum}" value="${vo.cartQuantity}" style="width: 35px; margin-left:6px; margin-right:6px"; inputmode="numeric">
                                    <button type="button" style="font-size: 12px; padding: 3px;" onclick="increaseQuantity(${vo.cartNum})">+</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:forEach var="itemVo" items="${itemList}">
                    	<p>${itemVo.itemNum}</p>
                    	<p>${itemVo.name}</p>
                    	<p>${itemVo.price}</p>
                    	<p>${itemVo.itemDetail}</p>
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
    </form>
</body>
</html>