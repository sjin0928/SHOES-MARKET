package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String keyword = req.getParameter("keyword");
		
		
		System.out.println(">>> SearchCommand idx : " + idx);
		System.out.println(">>> SearchCommand keyword : " + keyword);
		
		// DB연동 데이터 검색
		List<ItemVO> searchList = ItemDAO.getSearch(idx, keyword);
		// 데이터 갯수 검색 
		
		System.out.println("검색 결과(개수) : " + searchList.size());
		System.out.println("검색 결과 : " + searchList);
		int result = searchList.size();
		
		req.setAttribute("keyword", keyword);
		req.setAttribute("result", result);
		req.setAttribute("searchList", searchList);
		
		
		return "searchList.jsp";
	}

}
