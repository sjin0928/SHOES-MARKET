package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;

public class FindIdByEmailCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
        	System.out.println("Executing FindIdByEmailCommand");
        	String cusName = request.getParameter("cusName");
            String cusEmail = request.getParameter("cusEmail");
            
            if (cusName == null || cusName.trim().isEmpty() ||
            	cusEmail == null || cusEmail.trim().isEmpty()) {
                
            	request.setAttribute("findIdMessage", "입력되지 않은 항목이 있습니다.");
                return "find_id_by_email.jsp";
            }

            String foundId = CustomerDAO.findIdByEmail(cusName, cusEmail);

            if (foundId != null) {
                request.setAttribute("foundId", foundId);
                return "found_id.jsp";
            } else {
                request.setAttribute("findIdMessage", "일치하는 정보가 없습니다.");
                return "find_id_email.jsp";
            }
        }

        return "find_id_email.jsp";
    }
}
