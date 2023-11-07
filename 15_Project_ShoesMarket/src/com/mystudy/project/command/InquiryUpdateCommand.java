package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("InquiryUpdateCommand");
		int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		String cusNickname = request.getParameter("cusNickname");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String password = request.getParameter("password");
		String inqImgName = request.getParameter("inqImgName");
		String inqImgPath = request.getParameter("inqImgPath");
		int idx = -1;
		int keyword = -1;
		
		System.out.println("cusNickname : " + cusNickname + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		if(request.getParameter("idx") == null) {
			idx = -1;
		} else if(request.getParameter("idx") != null) {
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		if(request.getParameter("keyword") == null) {
			keyword = -1;
		} else if(request.getParameter("keyword") != null) {
			keyword = Integer.parseInt(request.getParameter("keyword"));
		}

		System.out.println("inquiryNum : " + inquiryNum + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		//원래 데이터 확인
		InquiryVO oriVO = InquiryDAO.getView(inquiryNum);
		System.out.println(oriVO);
		
		if(oriVO.getCusPassword() != password) {
			return "board_inquiry_update.jsp";
		}
		
		// 업데이트
		int voUp = InquiryDAO.inquiryUpdate(cusNickname, title, contents, inqImgName, inqImgPath, inquiryNum);
		/* request.setAttribute("vo", vo); */
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println("voUp" + voUp);
		
		return "board_inquiry_view.jsp";
		
	}

}
