package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;
import com.mystudy.project.vo.CustomerVO;

public class MypageCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerVO customer = (CustomerVO) request.getSession().getAttribute("customer");

        if (customer != null) {
            request.setAttribute("customer", customer);

            String action = request.getParameter("action");
            if ("update".equals(action)) {
                String updateMessage = updateCustomer(request, customer);
                request.setAttribute("updateMessage", updateMessage);
            } else if ("delete".equals(action)) {
                deleteCustomer(request, customer);
                request.getSession().invalidate(); // 세션 무효화
                return "home.jsp";
            }

            return "mypage.jsp";
        } else {
            return "error.jsp";
        }
    }

    private String updateCustomer(HttpServletRequest request, CustomerVO customer) {
        String cusPassword = request.getParameter("cusPassword");
        String cusName = request.getParameter("cusName");
        String cusNickName = request.getParameter("cusNickName");
        String cusPhoneNum = request.getParameter("cusPhoneNum");

        String oldNickName = customer.getCusNickName();

        // 닉네임 중복 확인
        if (isDuplicateNickName(cusNickName, oldNickName)) {
            return "이미 존재하는 닉네임입니다. 다른 닉네임을 사용해주세요.";
        }

        customer.setCusNickName(cusNickName);

        customer.setCusPassword(cusPassword);
        customer.setCusName(cusName);
        customer.setCusPhoneNum(cusPhoneNum);

        CustomerDAO.updateCustomerInfo(customer);

        // 업데이트가 성공했을 때 메시지 설정
        return "회원정보가 업데이트되었습니다.";
    }

    private boolean isDuplicateNickName(String newNickName, String oldNickName) {
        if (!newNickName.equals(oldNickName)) {
            return CustomerDAO.isDuplicateNickName(newNickName);
        }
        return false;
    }

    private void deleteCustomer(HttpServletRequest request, CustomerVO customer) {
        // 세션에서 현재 로그인한 사용자 정보를 삭제합니다.
        request.getSession().removeAttribute("customer");
        // DB에서도 회원 정보를 삭제합니다.
        CustomerDAO.deleteCustomer(customer.getCusNum(), customer.getCusId());
    }
}
