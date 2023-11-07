package com.mystudy.project.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.BuyDAO;
import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.CartVO;
import com.mystudy.project.vo.ItemVO;

public class BuyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 결제하는 페이지에 보여줄 데이터를 저장하는 클래스 
		
		// 1. 장바구니(cart.jsp)에서 선택한 아이템 목록을 가져옴
		// 필요한 데이터 - 상품 관련 정보(상품명,가격) / 수량 
		// 총 결제 금액 계산 
		HttpSession session = request.getSession();
		
		System.out.println(">> BuyCommand 실행");
		// 선택된 cartVO 추출 - 수량 필요 
		List<CartVO> selectedCart = getSelectedItems(request); // 선택된 CartVO가 넘어옴 
		System.out.println("선택된 cartVO : " + selectedCart);  
		
		List<ItemVO> selectedItemList = new ArrayList<>();
		int totalCount = 0;
		
		// 해당 카트 VO 의 itemNum으로 해당 item 찾기 
		for(CartVO selectedItem : selectedCart) {
			ItemVO selectVO = ItemDAO.getProductDetail(selectedItem.getItemNum()); // itemNum을 통해 아이템 리스트 추출 
			selectedItemList.add(selectVO);
			totalCount += (selectVO.getPrice()*selectedItem.getCartQuantity());
		}
		System.out.println(">> BuyCommand 선택된 아이템들 : " + selectedItemList);
		System.out.println(">> 총 가격 확인 : " + totalCount);
		
		
		// 선택된 아이템 리스트
		session.setAttribute("selectedItemList", selectedItemList);
		// 선택된 장바구니 리스트 
		session.setAttribute("selectedCart", selectedCart);
		// 총 결제 금액 계산 
		session.setAttribute("totalCount", totalCount);
		
		
		
		
		
		return "buy.jsp";
	}
	
	
	
	// 선택된 제품 가져오는 메소드
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
	