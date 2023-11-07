package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.dao.CartDAO;
import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CartVO;

public class CartCommand implements Command {
	
	
	@Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<CartVO> cart = CartDAO.getList();

        request.setAttribute("cart", cart);

        return "cart.jsp";
    }
}