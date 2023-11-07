package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.AdminDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.dao.NoticeDAO;
import com.mystudy.project.vo.AdminVO;
import com.mystudy.project.vo.InquiryVO;

public class ManagerNoticeDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ManagerNoticeDeleteCommand");
		
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		
		String passwordConfirm = request.getParameter("passwordConfirm");
		System.out.println(passwordConfirm);
		
		// 페이지 값, 검색값 호출
		int cPage = 1;
		int idx = -1;
		int keyword = -1;
		
		if(request.getParameter("cPage") != null && request.getParameter("cPage") != "") {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}
		System.out.println("cPage : " + cPage);
		

		if(request.getParameter("idx") != null && request.getParameter("idx") != "") {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		System.out.println("idx : " + idx);
		
		if(request.getParameter("keyword") != null && request.getParameter("keyword") != "") {
			keyword = Integer.parseInt(request.getParameter("keyword"));
		}
		System.out.println("keyword : " + keyword);
		
		
		AdminVO aVO = AdminDAO.getAdmin();
		System.out.println(aVO);
		if(!passwordConfirm.equals(aVO.getAdminPassword())) {
			return "controller?type=managerNoticeView";
		}
		
		int result = NoticeDAO.noticeDelete(noticeNum);
		request.setAttribute("result", result);
		
		System.out.println(result);

		if(idx != -1) {
			return "board_delete_ok.jsp";
		}
		return "board_delete_ok.jsp";
	}

}
