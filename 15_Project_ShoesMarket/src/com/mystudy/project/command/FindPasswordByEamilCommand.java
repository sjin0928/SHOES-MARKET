package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;

public class FindPasswordByEamilCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String cusId = request.getParameter("cusId");
            String cusName = request.getParameter("cusName");
            String cusEmail = request.getParameter("cusEmail");

            if (cusId == null || cusId.trim().isEmpty() ||
                cusName == null || cusName.trim().isEmpty() ||
                cusEmail == null || cusEmail.trim().isEmpty()) {

                request.setAttribute("findPasswordMessage", "입력되지 않은 항목이 있습니다.");
                return "find_password_email.jsp";
            }

            String foundPassword = CustomerDAO.findPassword(cusId, cusName, cusEmail);

            if (foundPassword != null) {
                request.setAttribute("foundPassword", foundPassword);
                return "found_password.jsp"; // 비밀번호를 찾았을 때의 페이지로 이동
            } else {
                request.setAttribute("findPasswordMessage", "일치하는 정보가 없습니다.");
                return "find_password_email.jsp";
            }
        }

        return "find_password_email.jsp"; // GET 요청 처리 (기본적으로 비밀번호 찾기 페이지로 돌아감)
    }
}
