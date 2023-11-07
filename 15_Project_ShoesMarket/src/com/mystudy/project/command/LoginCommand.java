package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.AdminDAO;
import com.mystudy.project.vo.AdminVO;

public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 효정님이랑 합칠 때 
		// if문 사용해서 관리자인 경우 if문 내 return "managerMain.jsp"; !! 
		// 로그인이랑 비번 틀렸을 경우는 효정님 코드 사용됨 
		HttpSession session = req.getSession();
		
		System.out.println("넘어온 id :  " + req.getParameter("cusId"));
		System.out.println("넘어온 pw :  " + req.getParameter("cusPassword"));
		
		String id = req.getParameter("cusId");
		String pw = req.getParameter("cusPassword");
		
		AdminVO adminVo = AdminDAO.getAdmin();
		// 관리자 아이디와 비밀번호 확인  - 아이디와 패스워드 동일
		if(id.equals(adminVo.getAdminId()) && pw.equals(adminVo.getAdminPassword())) {
			System.out.println(">> 관리자 로그인 완료");
			session.setAttribute("adminVo", adminVo);
			return "managerMain.jsp";
		}
		
		
		// 여긴 손님용 ! 합칠 때 메인 페이지로 바꾸기
		return "managerMain.jsp";
	}

}
