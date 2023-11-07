<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mystudy.project.dao.CartDAO" %>
<%@ page import="com.mystudy.project.vo.CartVO" %>
<%
try {
    // 1. 사용자로부터 전달된 파라미터 값 가져오기
    int itemNum = Integer.parseInt(request.getParameter("itemNum"));
    int cusNum = Integer.parseInt(request.getParameter("cusNum"));
    int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
    
    // 2. 데이터베이스에 장바구니 항목을 추가
    CartVO cartItem = new CartVO();
    cartItem.setItemNum(itemNum);
    cartItem.setCusNum(cusNum);
    cartItem.setCartQuantity(cartQuantity);
    
    // CartDAO 클래스를 사용하여 장바구니에 상품을 추가
    int result = CartDAO.addCart(cartItem);
    
    if (result > 0) {
        // 성공한 경우 "success"를 반환
        out.println("success");
    } else {
        // 실패한 경우 "failure"를 반환
        out.println("failure");
    }
} catch (NumberFormatException e) {
    out.println("유효하지 않은 데이터입니다.");
}
%>






