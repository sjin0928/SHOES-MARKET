package com.mystudy.project.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;
import com.mystudy.project.vo.CustomerVO;

public class RegisterCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if ("POST".equalsIgnoreCase(request.getMethod())) {
			String cusId = request.getParameter("cusId");
			String cusPassword = request.getParameter("cusPassword");
			String cusPasswordConfirm = request.getParameter("cusPasswordConfirm"); // 비밀번호 확인 값 추가
			String cusName = request.getParameter("cusName");
			String cusNickName = request.getParameter("cusNickName");
			String cusEmail = request.getParameter("cusEmail");
			String cusPhoneNum = request.getParameter("cusPhoneNum");

			if (cusId == null || cusId.trim().isEmpty() || cusPassword == null || cusPassword.trim().isEmpty()
					|| cusPasswordConfirm == null || cusPasswordConfirm.trim().isEmpty() || // 비밀번호 확인 값 체크
					cusName == null || cusName.trim().isEmpty() || cusNickName == null || cusNickName.trim().isEmpty()
					|| cusEmail == null || cusEmail.trim().isEmpty() || cusPhoneNum == null
					|| cusPhoneNum.trim().isEmpty()) {

				request.setAttribute("registerMessage", "입력되지 않은 항목이 있습니다.");
				return "register.jsp";
			}

			if (CustomerDAO.isDuplicateId(cusId)) {
				request.setAttribute("registerMessage", "이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요.");
				return "register.jsp";
			}
			
			if (!cusPassword.equals(cusPasswordConfirm)) {
				request.setAttribute("registerMessage", "비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return "register.jsp";
			}

			if (CustomerDAO.isDuplicateNickName(cusNickName)) {
				request.setAttribute("registerMessage", "이미 존재하는 닉네임입니다. 다른 닉네임을 사용해주세요.");
				return "register.jsp";
			}
			
			if (CustomerDAO.isDuplicateEmail(cusEmail)) {
				request.setAttribute("registerMessage", "이미 존재하는 이메일입니다. 다른 이메일을 사용해주세요.");
				return "register.jsp";
			}

			if (CustomerDAO.isDuplicatePhoneNum(cusPhoneNum)) {
				request.setAttribute("registerMessage", "이미 존재하는 전화번호입니다. 다른 전화번호를 사용해주세요.");
				return "register.jsp";
			}
			
			CustomerVO newCustomer = new CustomerVO(cusId, cusPassword, cusName, cusNickName, cusEmail, cusPhoneNum,
					new Date(System.currentTimeMillis()));
			CustomerDAO.insertCustomer(newCustomer);

			request.setAttribute("registerMessage", "회원가입이 완료되었습니다.");
			return "home.jsp";
		}

		return "register.jsp";
	}
}