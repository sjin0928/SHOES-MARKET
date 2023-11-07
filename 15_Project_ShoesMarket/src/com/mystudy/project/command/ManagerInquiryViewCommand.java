package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryCommentDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryCommentVO;
import com.mystudy.project.vo.InquiryVO;

public class ManagerInquiryViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 추출(확인)
		request.setCharacterEncoding("UTF-8");
		System.out.println("ManagerInquiryViewCommand");
		int cPage = 1;
		if(request.getParameter("cPage")!=null && request.getParameter("cPage") != "") {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		System.out.println("cPage : " + cPage);
		
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		System.out.println("inquiryNum : " + inquiryNum);
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		System.out.println("vo : " + vo);
		int idx = -1;
		String keyword = null;

		if(null != request.getParameter("idx") && request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println("idx : " + idx);
		
		if(request.getParameter("keyword") != null && request.getParameter("keyword") != "") {
			keyword = request.getParameter("keyword");
		}
		System.out.println("keyword : " + keyword);
		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		// 게시글 
		
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
		System.out.println("list : " + list);
		
		return "manager_inquiry_view.jsp";
	}

}
