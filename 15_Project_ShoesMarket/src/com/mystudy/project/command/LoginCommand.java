package com.mystudy.project.command;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.AdminDAO;
import com.mystudy.project.dao.CustomerDAO;
import com.mystudy.project.vo.AdminVO;
import com.mystudy.project.vo.CustomerVO;

public class LoginCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cusId = request.getParameter("cusId");
        String cusPassword = request.getParameter("cusPassword");
        
        System.out.println("넘어온 id :  " + cusId);
		System.out.println("넘어온 pw :  " + cusPassword);
        
        HttpSession session = request.getSession();
        
        // 관리자 아이디와 비밀번호 확인  - 아이디와 패스워드 동일
        AdminVO adminVo = AdminDAO.getAdmin();
		
		if(cusId.equals(adminVo.getAdminId()) && cusPassword.equals(adminVo.getAdminPassword())) {
			System.out.println(">> 관리자 로그인 완료");
			session.setAttribute("adminVo", adminVo);
			
			return "controller?type=itemBulletinBoard";
		} 
        
		// 아이디랑 , 비번 둘 중 하나라도 입력 안 했을 시 로그인 페이지로 이동 
        if (cusId != null && !cusId.trim().isEmpty()) {
            if (cusPassword == null || cusPassword.trim().isEmpty()) {
                request.setAttribute("idMessage", "비밀번호를 입력하세요.");
                return "login.jsp";
            }

            CustomerVO customer = CustomerDAO.login(cusId, cusPassword);
            
            // 로그인 성공 시 
            if (customer != null) {
            	// 로그인 정보 세션에 저장 
            	session.setAttribute("customer", customer);
            	session.setAttribute("successMessage", "로그인 성공!");
                return "beforeMain.jsp";
            } else {
                request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            }
        } else {
            request.setAttribute("idMessage", "아이디를 입력하세요.");
        }
        
        // 메인으로 가되 , header에서 로그인 / 회원가입 -> 로그아웃으로 변경 
        // 로그아웃 누르면 로그아웃 처리해야 함 
        return "login.jsp";
    }
}
