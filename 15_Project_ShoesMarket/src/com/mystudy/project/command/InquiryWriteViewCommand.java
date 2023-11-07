package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.vo.CustomerVO;

public class InquiryWriteViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("InquiryWriteViewCommand");
		// 세션에 저장된 로그인 정보
		HttpSession session = request.getSession();
		CustomerVO customer = null;
		
		if(session.getAttribute("customer") != null) {
			customer = (CustomerVO)session.getAttribute("customer");
		}
		System.out.println(customer);
		if(session.getAttribute("customer") == null) {
			return "not_login.jsp";
		}
		request.setAttribute("customer", customer);
		
		return "board_inquiry_write.jsp";
	}

}
