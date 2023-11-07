package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;

public class ItemDetailCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시판 목록에서 상품명 누르면 이동 
		// 전달받은 파라미터 값 (상품번호)
		String itemNum = req.getParameter("itemNum");
		System.out.println(">> ItemDetailCommand itemNum : " + itemNum);
				
		ItemVO itemVo = ItemDAO.getProductDetail(Integer.parseInt(itemNum));
		System.out.println(">> ItemDetailCommand itemvo : " + itemVo);
		HttpSession session = req.getSession();
		
		// 상품 번호 세션에 저장 
		session.setAttribute("itemNum", itemNum);
		session.setAttribute("imagePath", itemVo.getImagePath());
		session.setAttribute("itemVo", itemVo);
		
		return "itemDetail.jsp";
	}

}
