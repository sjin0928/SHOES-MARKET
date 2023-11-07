package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.CartVO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.ItemVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ToCartCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이템 정보들이랑 수량 장바구니에 insert 화면 전환 후 다시 상세 페이지 
		// 수량 
		System.out.println(">> ToCartCommand 실행 ");
		System.out.println(">> 수량 확인 : " + req.getParameter("cartQuantity"));
		
		// ProductDetailCommand 클래스에서 세션에 저장한 해당 제품의 vo 불러오기
		HttpSession session = req.getSession();
		ItemVO itemVo = (ItemVO)session.getAttribute("itemVo");
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		
		System.out.println(">> 장바구니에 들어갈 상품 : " + itemVo);
		System.out.println(">> 현재 로그인 고객 : " + customer);
		
		CartVO cartVo = new CartVO();
		cartVo.setItemNum(itemVo.getItemNum());
		cartVo.setCusNum(customer.getCusNum());
		cartVo.setCartQuantity(Integer.parseInt(req.getParameter("cartQuantity")));
		
		int result = CartDAO.putCart(cartVo);
		System.out.println(">> 장바구니 추가 결과 (1-성공) : " + result);
		
		
		
		return "productDetail.jsp";
	}

}
