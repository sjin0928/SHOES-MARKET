<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	
	function all_search() {
		//location.href = "list.jsp";
		//location.href = "list";
		location.href = "controller?type=cartList";
	}
	
	
	function buy_search() {
		//location.href = "list.jsp";
		//location.href = "list";
		location.href = "controller?type=buy";
	}
	

	// 장바구니에 상품 추가 기능 (Ajax)
	function addToCart(itemID, quantity) {
    // Ajax 요청을 생성
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'cart_add.jsp', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    var data = 'itemNum=' + itemNum + '&quantity=' + quantity; // 요청 본문 생성
    xhr.send(data); // Ajax 요청 전송

    // 요청 완료 시 처리
    xhr.onload = function () {
        if (xhr.status === 200) {
            if (xhr.responseText === 'success') {
                // 성공 메시지 처리
                alert('상품이 장바구니에 추가되었습니다.');
                // 장바구니 페이지로 리디렉션
                window.location.href = 'cart.jsp';
            } else {
                // 실패 메시지 처리
                alert('상품 추가에 실패했습니다.');
            }
        } else {
            // 오류 처리
            alert('요청 처리 중 오류가 발생했습니다.');
        }
    };
}

</script>
</head>
<body>
	<div style="display: flex; justify-content: flex-end; align-items: center;">
	<button onclick="all_search()">로그인(login)</button>
	<button onclick="all_search()">장바구니(cart)</button>
	</div>
	<h1>메인페이지 [ main.jsp ]</h1>
	
	<c:forEach var="item" items="${item }">
	<div>
		<h2>${item.name}</h2>
		<p>상품 번호: ${item.itemNum}</p>
		<p>가격: ${item.price}</p>
		<p>상품 설명: ${item.detail}</p>
		<button onclick="addToCart(${item.itemNum}, 1)">장바구니에 추가</button>
	</div>
	</c:forEach>
	
</body>
</html>