package com.mystudy.project.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.BuyDAO;
import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.vo.CartVO;

public class BuyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 장바구니(cart.jsp)에서 선택한 아이템 목록을 가져옴
		List<CartVO> selectedItems = getSelectedItems(request);
		System.out.println(selectedItems);

		if (!selectedItems.isEmpty()) {
	        List<CartVO> orderSuccessList = new ArrayList<>();

	        // 선택된 모든 아이템에 대한 주문 처리
	        for (CartVO selectedCartItem : selectedItems) {
	            int cartNum = selectedCartItem.getCartNum();
	            
	            // BuyDAO를 사용하여 주문 처리
	            List<CartVO> orderSuccess = BuyDAO.insertCartOrder(cartNum);
	            System.out.println("getListById 결과 : " + orderSuccess);
	            
	            // 이 부분에서 추가 데이터를 가져오도록 수정
	            // BuyDAO 또는 추가로 BuyDAO에 새로운 메서드 생성하라규!!!!!
	            List<CartVO> CartListFromBuyInfo = BuyDAO.insertBuyInfo(cartNum);
	            System.out.println("BuyCommand에서 CartListFromBuyInfo 결과 : " + CartListFromBuyInfo);
	            
	            
	            if (orderSuccess != null && !orderSuccess.isEmpty()) {
	                orderSuccessList.addAll(orderSuccess);
	            }
	        }
	        
	        // 주문 성공한 아이템 목록을 request에 설정
            request.setAttribute("selectedItems", orderSuccessList);
	    }


		// 4. 상품 총액 & 총 결제금액 데이터 생성 & 전달
		int totalPrice = calculateTotalPrice(selectedItems);
		String finalPayment = String.valueOf(totalPrice);

		request.setAttribute("finalPayment", finalPayment);
		System.out.println("finalPaymnet : " + finalPayment);
//        request.setAttribute("selectedItems", selectedItems);
		return "buy.jsp";
	}
	
	
	// 상품 총액 계산
	private int calculateTotalPrice(List<CartVO> selectedItems) {
	    int totalPrice = 0;
	    for (CartVO cartItem : selectedItems) {
	        //totalPrice += cartItem.getPrice() * cartItem.getCartQuantity();
	    }
	    System.out.println("totalPrice : " + totalPrice);
	    return totalPrice;
	}
	
	private List<CartVO> getSelectedItems(HttpServletRequest request) {
		List<CartVO> selectedItems = new ArrayList<>();
		String selectedItemsParam = request.getParameter("selectedItems");

		if (selectedItemsParam != null) {
			String[] selectedCartNumbers = selectedItemsParam.split(",");
			for (String cartNum : selectedCartNumbers) {
				int cartNumInt = Integer.parseInt(cartNum);
				CartVO cartItem = CartDAO.getCartItemByCartNum(cartNumInt);
				if (cartItem != null) {
					selectedItems.add(cartItem);
				}
			}
		}
		return selectedItems;
	}
}
	
	//  for (int i = 0; i < selectedItems.size(); i++) {
	//	CartVO a = selectedItems.get(i);
	//	int b = a.getCartNum();
	//	
	//	 List<CartVO> orderSuccess = BuyDAO.insertOrder(b);
	//	 System.out.println("getListById 결과 : " + orderSuccess);
	//	
	//	 request.setAttribute("list", orderSuccess);
	//	
	//}
	
	// 2. 주문 처리
	//CartVO orderSuccess = processOrder(selectedItems);
	//System.out.println(orderSuccess);
	
	// 3. 주문 처리 결과 buy.jsp에 전달
	//if (orderSuccess.getName() != null) {
	//    request.setAttribute("message", "주문이 완료되었습니다.");
	//    // buy.jsp로 이동 버튼 추가
	//    request.setAttribute("goBuy", true);
	//} else {
	//    request.setAttribute("message", "주문 실패");
	//}
	
	

	// 주문 처리
//    private CartVO processOrder(List<CartVO> selectedItems) {
//        // 주문 처리 로직을 구현\
//    	
//        // BuyDAO를 사용하여 데이터베이스에 주문 정보 저장
//        CartVO orderSuccess = BuyDAO.insertOrder(selectedItems);
//        if (orderSuccess) {
//            System.out.println("주문 처리가 성공했습니다.");
//            // 성공한 경우, CartVO 객체를 반환할 수 있음
//            CartVO order = new CartVO(); // 이 부분에서 CartVO 객체를 적절하게 구성해야 함
//            // 여기에서 CartVO 객체 필드에 주문 정보를 설정
//            order.setCusNum();  // 고객 번호
//            order.setPayStatus(...);  // 결제 상태
//            order.setBuyDate(...);  // 주문 일자
//            // 다른 필드도 필요한 대로 설정
//            
//            return order;
//        } else {
//            System.out.println("주문 처리가 실패했습니다.");
//            // 실패한 경우, null을 반환하거나 실패 상태를 나타내는 CartVO를 반환할 수 있음
//            return null;
//        }
//    }



//	// 배송 정보 생성
//	private String generateDeliveryInfo(HttpServletRequest request) {
//		// 배송 정보 생성 로직을 구현
//		// request 파라미터를 사용하여 배송 정보를 생성
//		// 예를 들어, 배송 주소, 예상 배송일자 등을 조합해서 배송 정보 생성
//		return "배송 주소: " + request.getParameter("deliveryAddress") + ", 예상 배송일: "
//				+ request.getParameter("deliveryDate");
//	}

	