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

public class InquiryUpdateViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 추출(확인)
		System.out.println("InquiryUpdateViewCommand");
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		int idx = -1;
		int keyword = -1;
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		if(request.getParameter("idx") == null) {
			idx = -1;
		} else if(request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(request.getParameter("keyword") == null) {
			keyword = -1;
		} else if(request.getParameter("keyword") != null) {
			keyword = Integer.parseInt(request.getParameter("keyword"));
		}

		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		// 게시글 
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println(vo);
		
		return "board_inquiry_update.jsp";
	}

	
}
