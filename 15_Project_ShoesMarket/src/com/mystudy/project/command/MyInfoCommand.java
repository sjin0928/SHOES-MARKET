package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.BuyDAO;
import com.mystudy.project.dao.CustomerDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.BuyVO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.InquiryVO;

public class MyInfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 마이 페이지로 이동하는 클래스 
		// 고객 정보 , 고객 주문 내역 , 고객이 작성한 게시물 내역 
		// 주문 및 게시물 select 해야 함 
		System.out.println(">> MyInfoCommand ");
		
		// 세션에 저장된 고객 정보 가져오기
		HttpSession session = req.getSession();
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		System.out.println(">> CUS 확인 : " + customer); // 잘 넘어옴
		int cusNum = customer.getCusNum();
		List<BuyVO> orderedList = BuyDAO.getOrderedList(cusNum);
		
		// 고객이 작성한 게시물 
		List<InquiryVO> inquiryList = InquiryDAO.getInquiryList(cusNum);
		
		req.setAttribute("orderedList", orderedList);
		req.setAttribute("inquiryList", inquiryList);
		
		return "myInfo.jsp";
	}

}
