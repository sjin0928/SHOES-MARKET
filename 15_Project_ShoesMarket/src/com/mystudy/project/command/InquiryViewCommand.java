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

public class InquiryViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 추출(확인)
		System.out.println("InquiryViewCommand");
		int cPage = 1;
		if(request.getParameter("cPage")!=null) {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		System.out.println("cPage : " + cPage);
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		System.out.println("inquiryNum : " + inquiryNum);
		
		int idx = -1;
		int keyword = -1;

		if(request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println("idx : " + idx);
		
		if(request.getParameter("keyword") != "") {
			keyword = Integer.parseInt(request.getParameter("keyword"));
		}
		System.out.println("keyword : " + keyword);
		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		// 게시글 
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println("InquiryVO : " + vo);
		
		//게시글의 댓글 
		List<InquiryCommentVO> list = InquiryCommentDAO.getCommList(inquiryNum);
		request.setAttribute("list", list);

		System.out.println("list" + list);
		
		return "board_inquiry_view.jsp";
	}

	
}
