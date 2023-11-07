package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.dao.NoticeDAO;
import com.mystudy.project.vo.InquiryVO;
import com.mystudy.project.vo.NoticeVO;

public class ManagerNoticeUpdateViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ManagerNoticeUpdateViewCommand");
		
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		
		// 페이지 값, 검색값 호출
		int cPage = 1;
		if(request.getParameter("cPage") != null && request.getParameter("cPage") != "") {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		System.out.println("cPage : " + cPage);
		
		int idx = -1;
		int keyword = -1;

		if(request.getParameter("idx") != null && request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println("idx : " + idx);
		
		if(request.getParameter("keyword") != null && request.getParameter("keyword") != "") {
			keyword = Integer.parseInt(request.getParameter("keyword"));
		}
		System.out.println("keyword : " + keyword);

		
		System.out.println("noticeNum : " + noticeNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		// 게시글 
		NoticeVO vo = NoticeDAO.getView(noticeNum);
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println(vo);
		
		return "manager_notice_update.jsp";
	}

}
