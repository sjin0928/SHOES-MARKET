package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mystudy.project.dao.NoticeDAO;
import com.mystudy.project.vo.NoticeVO;

public class BoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 파라미터 값 전체조회
		System.out.println("Inquiryboard");

		//4. DB에서 전체 게시글 조회(DAO사용)
		int begin = 1;
		int end = 3;
		List<NoticeVO> list = NoticeDAO.getNewList(begin, end);
		System.out.println("NoticeVO" + list);
		//5. 조회된 데이터를 응답페이지(board_inquiry.jsp)에서 사용토록 scope에 저장
		request.setAttribute("list", list);
		
		//6. 응답페이지(board_inquiry.jsp)로 위임 처리
				
		return "board_main.jsp";

	}

}
