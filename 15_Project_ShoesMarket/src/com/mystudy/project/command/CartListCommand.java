package com.mystudy.project.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.CartVO;
import com.mystudy.project.vo.ItemVO;

public class CartListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 장바구니 리스트 출력하고 cart.jsp에 위임처리 하는 클래스
		// 상품 정보들 
		System.out.println(">> CartListCommand 실행");
		List<CartVO> cartList = CartDAO.getList();
		List<ItemVO> itemList = new ArrayList<>();
		
		for(CartVO cartVo : cartList) {
			System.out.println(cartVo.getItemNum()); // 리스트 하나씩 꺼내짐 
			ItemVO itemVo = ItemDAO.getProductDetail(cartVo.getItemNum());
			System.out.println(">> List<ItemVO> 에 추가된 아이템 : " + itemVo);
			itemList.add(itemVo);
		}
		
		System.out.println(">> CartListCommand itemList : " + itemList);
		System.out.println(">> CartListCommand 장바구니 리스트 확인 : " + cartList);
		
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("itemList", itemList);
		
		
		System.out.println(">> CartListCommand 끝");
		return "cart.jsp";
	}

}
