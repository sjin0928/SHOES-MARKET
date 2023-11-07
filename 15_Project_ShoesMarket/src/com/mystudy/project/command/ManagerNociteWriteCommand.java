package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.AdminDAO;
import com.mystudy.project.dao.NoticeDAO;
import com.mystudy.project.vo.AdminVO;
import com.mystudy.project.vo.NoticeVO;

public class ManagerNociteWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--ManagerNociteWriteCommand--");
		
		AdminVO aVO = AdminDAO.getAdmin();
		System.out.println("aVO : " + aVO);
				
		NoticeVO vo = new NoticeVO();
		vo.setNoticeTitle(request.getParameter("noticeTitle"));
		vo.setContents(request.getParameter("contents"));
		vo.setAdminNum(aVO.getAdminNum());
		System.out.println(vo);
		// 공지사항 입력
		
		int result = NoticeDAO.noticeWrite(vo);
		
		System.out.println("result" + result);
		
		
		return "controller?type=managerNoticeList";
	}

}
