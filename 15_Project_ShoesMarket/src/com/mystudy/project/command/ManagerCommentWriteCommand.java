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

public class ManagerCommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--ManagerCommentWriteCommand--");
		
		InquiryCommentVO commVO = new InquiryCommentVO();
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		
		commVO.setInquiryNum(inquiryNum);
		commVO.setContents(request.getParameter("contents"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		String keyword = request.getParameter("keyword");
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		// 댓글 작성
		int result = InquiryCommentDAO.commentWrite(commVO);
		System.out.println("result : " + result);
		
		List<InquiryCommentVO> list = null;
		
		if(InquiryCommentDAO.getCommList(inquiryNum) != null) {
			list = InquiryCommentDAO.getCommList(inquiryNum);
			request.setAttribute("list", list);
		}
		System.out.println("list" + list);
		request.setAttribute("vo", vo);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		request.setAttribute("cPage", cPage);
		
		System.out.println("result" + result);
		return "manager_inquiry_view.jsp";
	}

}
