package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryCommentDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;

public class ManagerCommentDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("InquiryDeleteCommand");

		int cPage = 1;
		int idx = -1;
		int keyword = -1;
		if(request.getParameter("cPage")!="") {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}		
		System.out.println(cPage);
		
		if(request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println(idx);
		if(request.getParameter("keyword") != "") {
			keyword = Integer.parseInt(request.getParameter("keyword"));
		}
		System.out.println(keyword);
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		int iqCommentNum = Integer.parseInt(request.getParameter("iqCommentNum"));
		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		
		System.out.println("inquiryDelete vo : " + vo );
		// DB연동 데이터 검색 처리
		// 게시글 
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println("InquiryVO : " + vo);
		
		//게시글의 댓글 삭제
		int result = InquiryCommentDAO.deleteComment(iqCommentNum);
		System.out.println("result : " + result);
		request.setAttribute("result", result);

		System.out.println(result);

		return "controller?type=managerInquiryView";
	}

}
