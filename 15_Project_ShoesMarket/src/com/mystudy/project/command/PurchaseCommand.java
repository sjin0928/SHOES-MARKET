package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.BuyDAO;
import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.dao.OrderItemsDAO;
import com.mystudy.project.vo.BuyVO;
import com.mystudy.project.vo.CartVO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.ItemVO;
import com.mystudy.project.vo.OrderItemsVO;

public class PurchaseCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(">> PurchaseCommand 실행 ------------------------------");
    	// 한글처리
    	request.setCharacterEncoding("UTF-8");
    	
    	// 주문 insert 처리하는 클래스 (BUY insert 후 해당 buyNum 가지고 ORDERITEMS 테이블 insert 해야 함) 
    	// 아이템VO , 회원cusNum, BUYVO , 
		HttpSession session = request.getSession();
		
		// 데이터 전부 잘 넘어 옴 
		// 결제할 아이템 리스트 
		List<ItemVO> selectedItemList = (List<ItemVO>)session.getAttribute("selectedItemList");
		// 장바구니 리스트 - 수량 컬럼 필요하기 때문에 물러옴   cartQuantity 
		List<CartVO> selectedCart = (List<CartVO>)session.getAttribute("selectedCart");
		//총 금액
		int totalCount = (Integer)session.getAttribute("totalCount");
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		
		// 데이터 전부 잘 넘어 옴
		System.out.println(">> 결제할 아이템 : " + selectedItemList);
		System.out.println(">> 결제할 장바구니 리스트(수량 추출) : " + selectedCart);
		System.out.println(">> 총 금액 : " + totalCount);
		System.out.println(">> 현재 구매하는 고객 : " + customer.getCusNum());
		
		// BUY INSERT할 때 필요한 데이터 
		// cusNum, zipCode, address, detailAddress, PHONE, PAYMENT, TOTAL_PRICE, deliveryRequest
		
		// 폼 객체에서 가져 올 데이터 : zipCode, address, detailAddress, phone, payment, deliveryRequest

		
		
		BuyVO vo = new BuyVO();
		vo.setCusNum(customer.getCusNum());
		vo.setZipCode(request.getParameter("zipCode"));
		vo.setAddress(request.getParameter("address"));
		vo.setDetailAddress(request.getParameter("detailAddress"));
		vo.setPhone(customer.getCusPhoneNum());
		vo.setDeliveryRequest(request.getParameter("deliveryRequest"));
		vo.setPayment(request.getParameter("payment"));
		vo.setTotalPrice(totalCount);
		
		int result = BuyDAO.buyItem(vo);
		System.out.println(">> buy 데이터 insert 결과 (1-성공) : " + result);	

		//방금 insert된 buyNum 값 가져와야 함 (selelct) 
		int buyNum = BuyDAO.getBuyNum(); 
		System.out.println(">> 방금 insert된 buy_num 조회 : " + buyNum); // 조회 잘 됨 !!]	
		
		// ORDERITEMS insert 
		OrderItemsVO orderVo = new OrderItemsVO();
		
		// 여러 종류의 제품을 구매할 경우를 고려하여 반복문 사용 
		// 선택한 장바구니 리스트 갯수만큼 orderitems insert 되는 거임 
		int orderitesmResult = 0;
		
		// 주문 시, 해당 제품 장바구니 리스트에서 삭제
		// 주문한 장바구니 리스트 갯수만큼 리턴해야 함
		int deleteCartItemResult = 0;
		
		// 구매 시 해당 아이템 재고 업데이트
		int updateStockResult = 0;
		
		for (int i = 0; i < selectedItemList.size(); i++) {
			ItemVO itemVO = selectedItemList.get(i);
	        CartVO cartVO = selectedCart.get(i);
	        orderVo.setItemNum(itemVO.getItemNum());
	        orderVo.setBuyNum(buyNum);
	        orderVo.setQuantity(cartVO.getCartQuantity());
	        orderVo.setPrice(itemVO.getPrice()*cartVO.getCartQuantity());
	        orderitesmResult += OrderItemsDAO.buyOrderItem(orderVo);
	        
	        // 주문 시, 해당 제품 장바구니 리스트에서 삭제
	        deleteCartItemResult += CartDAO.deleteCartItem(cartVO.getCartNum());
	        
	        // 주문 제품 item stock 주문 수량한 만큼 빼기 
	        System.out.println(">> 해당 아이템 주문 전 재고 : " + itemVO.getStock());
	        System.out.println(">> 해당 아이템 주문 수량 : " + cartVO.getCartQuantity());
	        int orderedQuantity = itemVO.getStock() - cartVO.getCartQuantity();
	        System.out.println(">> 해당 아이템 주문 후 재고 : " + orderedQuantity);
	        
	        updateStockResult += ItemDAO.updateItemStock(orderedQuantity, itemVO.getItemNum());
	        
		}
		
		
		System.out.println(">> 주문 시, 해당 제품 장바구니 리스트에서 삭제한 개수 : " + deleteCartItemResult);
		// 즉, orderitesmResult는 장바구니 선택한 리스트 개수와 동일해야 함  
		System.out.println(">> orderitems insert 결과 : " + orderitesmResult);
		System.out.println(">> 아이템 재고 업데이트 결과 : " + updateStockResult);
		
		
		
		System.out.println(">> PurchaseCommand 끝 ------------------------------");
        // 결제 결과 페이지로 이동
        return "purchase.jsp";
    }
}