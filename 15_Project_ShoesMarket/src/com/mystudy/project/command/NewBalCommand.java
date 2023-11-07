package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;

public class NewBalCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ItemVO> newBalList = ItemDAO.getNewBal();
		req.setAttribute("newBalList", newBalList);
		
		return "newBalList.jsp";
	}

}
