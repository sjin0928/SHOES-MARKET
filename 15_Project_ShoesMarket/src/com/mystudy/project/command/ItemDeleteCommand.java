package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.ItemDAO;

public class ItemDeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이템 삭제 처리 
		HttpSession session = req.getSession();
		// 세션에 저장한 아이템 번호 
		int itemNum = Integer.parseInt((String)session.getAttribute("itemNum"));
		int result = ItemDAO.productDelete(itemNum);
		
		req.setAttribute("result", result);
		System.out.println(">> ItemDeleteCommand 데이터 delete 결과 (1-성공) " + result);

		return "itemDelete_ok.jsp";
	}

}
