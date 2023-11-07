package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;

// 상품 상세 페이지
public class ProductDetailCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 전달받은 파라미터 값 (상품번호)
		int itemNum = Integer.parseInt(req.getParameter("itemNum"));
		System.out.println(">> ProductDetailCommand itemNum : " + itemNum);
		
		ItemVO itemVo = ItemDAO.getProductDetail(itemNum);
		System.out.println(">> ProductDetailCommand itemvo : " + itemVo);
		HttpSession session = req.getSession();
		
		session.setAttribute("itemVo", itemVo);
		
		return "productDetail.jsp";
	}

}
