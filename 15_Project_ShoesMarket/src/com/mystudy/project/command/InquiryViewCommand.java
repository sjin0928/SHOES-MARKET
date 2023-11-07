package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.InquiryCommentDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.InquiryCommentVO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("InquiryViewCommand");
		// 세션에 저장된 로그인 정보
		
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		System.out.println("inquiryNum : " + inquiryNum);
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		
		HttpSession session = request.getSession();
		CustomerVO customer = (CustomerVO)session.getAttribute("customer");
		
		System.out.println("customer : " + customer);
		
		if(customer == null && "on".equals(vo.getSecretStatus())) {
			return "not_customer.jsp";
		}
		if(customer != null) {
			if("on".equals(vo.getSecretStatus()) && customer.getCusNum() != vo.getCusNum()) {
				return "not_customer.jsp";
			}
		}
		
		// 파라미터 값 추출(확인)
		request.setCharacterEncoding("UTF-8");
		
		int cPage = 1;
		if(request.getParameter("cPage")!=null) {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		System.out.println("cPage : " + cPage);
		
		
		int idx = -1;
		String keyword = null;

		if(request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println("idx : " + idx);
		
		if(request.getParameter("keyword") != "") {
			keyword = request.getParameter("keyword");
		}
		System.out.println("keyword : " + keyword);
		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		// 게시글 
		// 비밀글 비번 확인
		// 작성자와 로그인 정보 일치 확인
		System.out.println("vo : " + vo);
		System.out.println("secretStatus : " + vo.getSecretStatus());
		System.out.println("customer : " + customer);
		if(customer != null) {
			System.out.println("customer.getCusNum() : " + customer.getCusNum());
		}
		System.out.println("vo.getCusNum() : " + vo.getCusNum());
		

		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println("InquiryVO : " + vo);
		
		//게시글의 댓글 
		List<InquiryCommentVO> list = null;
		
		if(InquiryCommentDAO.getCommList(inquiryNum) != null) {
			list = InquiryCommentDAO.getCommList(inquiryNum);
			request.setAttribute("list", list);
		}
		System.out.println("list" + list);
		
		return "board_inquiry_view.jsp";
	}

	
}
