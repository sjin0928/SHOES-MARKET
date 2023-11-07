package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("InquiryDeleteCommand");

		HttpSession session = request.getSession();
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		

		String passwordConfirm = request.getParameter("passwordConfirm");
		System.out.println(passwordConfirm);
		int cPage = 1;
		int idx = -1;
		String keyword = null;
		if(request.getParameter("cPage")!="") {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}		
		System.out.println(cPage);
		
		if(request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println(idx);
		if(request.getParameter("keyword") != "") {
			keyword = request.getParameter("keyword");
		}
		System.out.println(keyword);
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		
		
		if(customer == null) {
			return "board_delete_fail.jsp";
		}
		
		if(!(customer.getCusPassword().equals(passwordConfirm)) || customer.getCusNum()!=(vo.getCusNum())) {
			return "board_delete_fail.jsp";
		}
		
		System.out.println("inquiryDelete vo : " + vo );
		
		int result = InquiryDAO.inquiryDelete(vo.getInquiryNum());
		request.setAttribute("result", result);
		
		System.out.println(result);

		if(idx != -1) {
			return "board_delete_ok.jsp";
		}
		return "board_delete_ok.jsp";
	}

}
