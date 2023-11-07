package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;

public class BrandCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ItemVO> adidasList = ItemDAO.getAdidas();
		List<ItemVO> newBalList = ItemDAO.getNewBal();
		List<ItemVO> converseList = ItemDAO.getConverse();
		
		req.setAttribute("adidasList", adidasList);
		req.setAttribute("newBalList", newBalList);
		req.setAttribute("converseList", converseList);
		
		return "brandList.jsp";
	}

}
