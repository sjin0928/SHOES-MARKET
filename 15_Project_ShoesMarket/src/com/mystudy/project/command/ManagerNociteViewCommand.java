package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.InquiryCommentDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.dao.NoticeDAO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.InquiryCommentVO;
import com.mystudy.project.vo.InquiryVO;
import com.mystudy.project.vo.NoticeVO;

public class ManagerNociteViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ManagerNociteViewCommand");
		
		// 파라미터 값 추출(확인)
		request.setCharacterEncoding("UTF-8");

		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		System.out.println("noticeNum : " + noticeNum);
		NoticeVO vo = NoticeDAO.getView(noticeNum);

		System.out.println("vo : " + vo);
		
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
		// 비밀글 비번 확인
		// 작성자와 로그인 정보 일치 확인
		

		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println("NoticeVO : " + vo);
		
		return "manager_notice_view.jsp";
	}

}
