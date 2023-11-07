package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;

/* 231024 박수진 */
public class InquirySearchCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// search 요청 처리(화면전환 : 입력폼/ 검색목록)
		// 전달된 파라미터 값 확인
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		int begin = Integer.parseInt(request.getParameter("begin"));
		int end = Integer.parseInt(request.getParameter("end"));
		System.out.println(">>> SearchCommand idx : " + idx);
		System.out.println(">>> SearchCommand keyword : " + keyword);
		
		if (keyword == null || keyword.trim().equals("")) {
			return "board_inquiry.jsp";
		}
		
		// DB연동 데이터 검색 처리
		List<InquiryVO> list = InquiryDAO.getSearch(idx, keyword, begin, end);
		request.setAttribute("list", list);
		System.out.println(list);
		
		return "board_inquiry.jsp";
	}
}
