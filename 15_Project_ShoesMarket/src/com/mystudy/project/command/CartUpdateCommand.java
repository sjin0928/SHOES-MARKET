package com.mystudy.project.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CartVO;

public class CartUpdateCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain"); // 응답 유형을 텍스트로 설정
        try {
        	System.out.println(">> CartUpdateCommand 실행");
        	SqlSession ss = DBService.getFactory().openSession(true); // auto-commit을 true로 설정
        	
            int cartNum = Integer.parseInt(request.getParameter("cartNum"));
            int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));

            // 해당 cartNum에 대한 수량 업데이트
            CartVO cartItem = CartDAO.getCartItemByCartNum(cartNum);
            System.out.println(cartItem	);
            if (cartItem != null) {
                cartItem.setCartQuantity(newQuantity);
                int result = CartDAO.updateCart(cartItem);

                if (result > 0) {
                    response.getWriter().write("success");
                    System.out.println("updateSuccess result : " + result);
                } else {
                    response.getWriter().write("failure");
                    System.out.println("update Failure result : " + result);
                }
            } 
            
        } catch (NumberFormatException e) {
            response.getWriter().write("invalid data");
        }
        // "jsp";
        return ""; // 이 부분에서 반환값은 필요하지 않음
    }
}