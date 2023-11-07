package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ItemVO> list = ItemDAO.getAllNew();
		List<ItemVO> bestList = ItemDAO.getAllBest();
		req.setAttribute("list", list);
		req.setAttribute("bestList", bestList);
		
		return "main.jsp";
	}

}
