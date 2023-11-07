package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.BuyDAO;
import com.mystudy.project.vo.CartVO;

public class PurchaseCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // BuyDAO 객체 생성 (가정)
        BuyDAO buyDAO = new BuyDAO();
        
        int cartNum = 88;

        // 결제 로직을 수행한 후 결과에 따라 메시지 설정
        boolean paymentSuccess = true; // 결제 성공 여부를 표시
        if (paymentSuccess) {
            // 결제가 성공한 경우, 결제된 상품 정보를 가져온다고 가정
            List<CartVO> purchasedItems = buyDAO.insertCartOrder(cartNum); // 이 부분은 BuyDAO에서 장바구니에 담긴 상품 정보를 가져오는 메서드로 수정해야 합니다.
            System.out.println("cartNum : " + cartNum);
            // 결과 데이터를 request에 설정
            request.setAttribute("success", true); // 결제 성공 여부
            request.setAttribute("purchasedItems", purchasedItems); // 결제된 상품 정보
            System.out.println("paymentSuccess : " + paymentSuccess);
        } else {
            request.setAttribute("success", false); // 결제 실패 여부
        }

        // 결제 결과 페이지로 이동
        return "purchase.jsp";
    }
}