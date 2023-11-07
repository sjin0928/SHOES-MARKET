package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.InquiryVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InquiryUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--InquiryUpdateCommand--");
		
		String path = "C:\\temp";
		System.out.println("> path : " + path);
		
		// 세션에 저장된 로그인 정보
		HttpSession session = request.getSession();
		CustomerVO customer = null;
		if(session.getAttribute("customer") != null) {
			customer = (CustomerVO)session.getAttribute("customer");
		}
		if(customer == null) {
			return "not_login.jsp";
		}
		
		MultipartRequest mr = new MultipartRequest(
			request, //요청객체
			path, //실제 파일을 저장할 경로
			10 * 1024 * 1024, //업로드 파일의 최대크기(byte 단위)
			"UTF-8", //인코딩 형식
			new DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경저장
		);
		System.out.println("inqImgName : " + mr.getFilesystemName("inqImgPath"));
		
		String title = mr.getParameter("title");
		String inqImgName = mr.getFilesystemName("inqImgPath");
		String password = mr.getParameter("password");
		String contents = mr.getParameter("contents");
		String cPage = mr.getParameter("cPage");
		if("".equals(inqImgName)) {
			inqImgName=null;
		}
		int idx = -1;
		int keyword = -1;
		System.out.println("title : " + title + ", inqImgName : " + inqImgName
				 + ", path : " + path + ", password : " + password
				 + ", contents : " + contents + ", cPage : " + cPage
				 + ", idx : " + idx+ ", keyword : " + keyword);
		System.out.println("request.getParameter(\"inquiryNum\") : " + mr.getParameter("inquiryNum"));
		int inquiryNum = Integer.parseInt(mr.getParameter("inquiryNum"));
		
		if(request.getParameter("idx") == null) {
			idx = -1;
		} else if(request.getParameter("idx") != null) {
			idx = Integer.parseInt(mr.getParameter("idx"));
		}
		if(request.getParameter("keyword") == null) {
			keyword = -1;
		} else if(request.getParameter("keyword") != null) {
			keyword = Integer.parseInt(mr.getParameter("keyword"));
		}

		System.out.println("cPage : " + cPage
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
		if(mr.getFilesystemName("inqImgPath") == null) {
			int Up = InquiryDAO.inquiryUpdate(title, contents, inquiryNum);
			request.setAttribute("inquiryNum", inquiryNum);
			request.setAttribute("cPage", cPage);
			request.setAttribute("idx", idx);
			request.setAttribute("keyword", keyword);
			InquiryVO upVO = InquiryDAO.getView(inquiryNum);
			request.setAttribute("vo", upVO);
			
			System.out.println("upVO : " + upVO);
			System.out.println("Up : " + Up);
			
			return "board_inquiry_view.jsp";
		} 
		int Up = InquiryDAO.inquiryUpdateFile(title, contents, inqImgName, path, inquiryNum);
		request.setAttribute("inquiryNum", inquiryNum);
		request.setAttribute("cPage", cPage);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		InquiryVO upVO = InquiryDAO.getView(inquiryNum);
		request.setAttribute("vo", upVO);
		
		System.out.println("upVO" + upVO);
		System.out.println("Up" + Up);
		
		return "board_inquiry_view.jsp";
		
	}

}
