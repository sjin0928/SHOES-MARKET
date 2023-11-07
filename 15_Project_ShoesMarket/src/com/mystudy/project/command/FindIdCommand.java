package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;

public class FindIdCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String cusName = request.getParameter("cusName");
            String cusPhoneNum = request.getParameter("cusPhoneNum");

            if (cusName == null || cusName.trim().isEmpty() ||
                cusPhoneNum == null || cusPhoneNum.trim().isEmpty()) {

                request.setAttribute("findIdMessage", "입력되지 않은 항목이 있습니다.");
                return "find_id.jsp";
            }
                String foundId = CustomerDAO.findIdByPhone(cusName, cusPhoneNum);

                if (foundId != null) {
                    request.setAttribute("foundId", foundId);
                    return "found_id.jsp";
                } else {
                    request.setAttribute("findIdMessage", "일치하는 정보가 없습니다.");
                    return "find_id.jsp";
                }
            
        }

        return "find_id.jsp"; // GET 요청 처리 (기본적으로 아이디 찾기 페이지로 돌아감)
    }
}