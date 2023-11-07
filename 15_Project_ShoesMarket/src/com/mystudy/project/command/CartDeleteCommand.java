package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.mybatis.DBService;

public class CartDeleteCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
            String cartNumsParam = request.getParameter("cartNums");
            int result = 1; 

            if (cartNumsParam != null) {
                String[] cartNums = cartNumsParam.split(",");

                for (String cartNum : cartNums) {
                    int cartItemNum = Integer.parseInt(cartNum);
                    int deleteResult = CartDAO.deleteCart(cartItemNum);
                    if (deleteResult <= 0) {
                        // 삭제 실패 시 result를 0으로 설정
                        result = 0;
                        System.out.println("Failed to delete item with cartNum: " + cartItemNum);
                    } 
                }
            } else {
                // 선택된 상품이 없을 때도 result를 0으로 설정
                result = 0;
            }
            System.out.println("result : " + result);
           
            request.setAttribute("result", result); // 결과를 result로 설정
            
        } catch (Exception e) {
            request.setAttribute("result", 0); // 예외 발생 시도 result를 0으로 설정
        }

        return "cart_delete.jsp";
    }
}