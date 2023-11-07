package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryUpdateViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 값 추출(확인)
		// 파일을 저장할 경로 지정
		//String path = "c:/upload/temp";
		/*
		 * String path = this.getServletContext().getRealPath("/upload");
		 * System.out.println("> path : " + path);
		 * 
		 * MultipartRequest mr = new MultipartRequest( request, //요청객체 path, //실제 파일을
		 * 저장할 경로 10 * 1024 * 1024, //업로드 파일의 최대크기(byte 단위) "UTF-8", //인코딩 형식 new
		 * DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경저장 );
		 */
		System.out.println("InquiryUpdateViewCommand");
		
		String cPage = request.getParameter("cPage");
		System.out.println(cPage);
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		
		int idx = -1;
		String keyword = null;
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		if(request.getParameter("idx") == null) {
			idx = -1;
		} else if(request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(request.getParameter("keyword") == null) {
			keyword = null;
		} else if(request.getParameter("keyword") != null) {
			keyword = request.getParameter("keyword");
		}

		
		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		// DB연동 데이터 검색 처리
		// 게시글 
		InquiryVO vo = InquiryDAO.getView(inquiryNum);
		request.setAttribute("vo", vo);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println(vo);
		
		return "board_inquiry_update.jsp";
	}

	
}
