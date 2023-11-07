<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보 [item.jsp]</title>

<script>
    // JavaScript 함수는 여기에 추가
    function go_main() {
        window.location.href = "cartMain.jsp";
    }

    function go_login() {
        location.href = "login";
    }
/*

 	//Ajax 사용시
    function addToCart(itemNum, quantity) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'cart_add.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        var data = 'itemNum=' + itemNum + '&quantity=' + quantity;
        xhr.send(data);

        xhr.onload = function () {
            if (xhr.status === 200) {
                if (xhr.responseText === 'success') {
                    alert('상품이 장바구니에 추가되었습니다.');
                } else {
                    alert('상품 추가에 실패했습니다.');
                }
            } else {
                alert('요청 처리 중 오류가 발생했습니다.');
            }
        };
    }
*/
</script>

</head>
<body>
	<button onclick="go_main()">HOME</button>
    <button onclick="go_login()">로그인</button>
    
    <h1>상품 상세 정보</h1>
    
    <div>
        <h2>${itemvo.name }</h2>
        <p>상품 번호: ${itemvo.itemNum }</p>
        <p>가격: ${itemvo.price }</p>
        <p>상품이미지: ${itemvo.imagePath }</p>
        <p>상품 설명: ${itemvo.itemDetail }</p>
     
     
     	<form action="controller" method="post">
            <input type="hidden" name="type" value="cart">
            <input type="hidden" name="itemNum" value="${itemvo.itemNum}">
            <label for="quantity">수량:</label>
            <input type="number" id="quantity" name="quantity" value="1" min="1">
            <button type="submit">장바구니에 추가</button>
        </form>
    </div>

</body>
</html>