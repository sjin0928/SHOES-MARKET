package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--InquiryUpdateCommand--");
		String title = request.getParameter("title");
		String inqImgName = request.getParameter("inqImgName");
		String inqImgPath = request.getParameter("inqImgPath");
		String password = request.getParameter("password");
		String contents = request.getParameter("contents");
		String cPage = request.getParameter("cPage");
		if(inqImgName.equals("")) {
			inqImgName=null;
		}
		int idx = -1;
		int keyword = -1;
		System.out.println("title : " + title + ", inqImgName : " + inqImgName
				 + ", inqImgPath : " + inqImgPath + ", password : " + password
				 + ", contents : " + contents + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		int inquiryNum = Integer.parseInt(request.getParameter("vo"));
		
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

		System.out.println(", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		
		//원래 데이터 확인
		InquiryVO oriVO = InquiryDAO.getView(inquiryNum);
		System.out.println("oriVO" + oriVO);

		// 비밀번호 확인(틀렸을때)
		if(!oriVO.getCusPassword().equals(password)) {
			request.setAttribute("oriVO", oriVO);
			request.setAttribute("cPage", cPage);
			request.setAttribute("idx", idx);
			request.setAttribute("keyword", keyword);
			return "password_error.jsp";
		}
		// 업데이트
		int voUp = InquiryDAO.inquiryUpdate(title, contents, inqImgName, inqImgPath, inquiryNum);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		System.out.println("voUp" + voUp);
		
		return "controller?type=view";
		
	}

}
