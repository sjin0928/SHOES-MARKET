package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.CustomerDAO;
import com.mystudy.project.vo.CustomerVO;

public class CustomerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. DB연결하고 데이터 가져오기
		List<CustomerVO> customer = CustomerDAO.selectAll();
		
		//2. 응답페이지(customer.jsp)에 전달
		request.setAttribute("customer", customer);
		
		//3. 페이지 전환 - 응답할 페이지(customer.jsp)로 포워딩(위임,전가)
		//request.getRequestDispatcher("customer.jsp").forward(request, response);
		
		return "customer.jsp";
	}

}
