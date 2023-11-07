package com.mystudy.project.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;

public class CheckDuplicateNickNameCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cusNickName = request.getParameter("cusNickName");

        // 닉네임 중복 확인
        boolean isDuplicate = CustomerDAO.isDuplicateNickName(cusNickName);

        // JSON 형식으로 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"isDuplicate\": " + isDuplicate + "}");
        out.flush();

        return ""; // 빈 문자열 반환
    }
}
