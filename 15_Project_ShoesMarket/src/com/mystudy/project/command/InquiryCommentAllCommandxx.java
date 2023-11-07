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

public class InquiryCommentAllCommandxx implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 추출(확인)
		System.out.println("InquiryViewCommand");
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		int idx = -1;
		idx = Integer.parseInt(request.getParameter("idx"));
		int keyword = -1;
		keyword = Integer.parseInt(request.getParameter("keyword"));
		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		List<InquiryCommentVO> list = InquiryCommentDAO.getCommList(inquiryNum);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		if(idx > 0) {
			request.setAttribute("idx", idx);
			request.setAttribute("keyword", keyword);
		}
		System.out.println(list);
		
		return "board_inquiry_view.jsp";
	}

	
}
