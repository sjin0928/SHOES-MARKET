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

//231024 박수진
public class InquiryWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--InquiryWriteCommand--");
		request.setCharacterEncoding("UTF-8");
		
		// 세션에 저장된 로그인 정보
		HttpSession session = request.getSession();
		CustomerVO customer = null;
		
		if(session.getAttribute("customer") != null) {
			customer = (CustomerVO)session.getAttribute("customer");
		}

		String path = "C:\\temp";
		System.out.println("> path : " + path);
		
		MultipartRequest mr = new MultipartRequest(
			request, //요청객체
			path, //실제 파일을 저장할 경로
			10 * 1024 * 1024, //업로드 파일의 최대크기(byte 단위)
			"UTF-8", //인코딩 형식
			new DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경저장
		);

		String secretStatus = "off";
		if (secretStatus != null && "on".equals(mr.getParameter("secretStatus"))) {
			secretStatus = mr.getParameter("secretStatus");
		}
		
		String title = mr.getParameter("title");
		String cusNickname = mr.getParameter("cusNickname");
		String contents = mr.getParameter("contents");
		String inqImgName = mr.getFilesystemName("inqImgPath");
		String itemName = mr.getParameter("itemName");
		System.out.println("title : " + title + ", cusNickname : " + cusNickname
				+ ", contents : " + contents + ", secretStatus : " + secretStatus
				+ ", inqImgName : " + inqImgName + ", itemName : " + itemName);
		int itemNum = InquiryDAO.inquiryItemSearch(itemName);
		System.out.println("itemNum : " + itemNum);
		
		int result = -1;
		InquiryVO vo = new InquiryVO();
		// 파일 없을 때
		if(mr.getFilesystemName("inqImgPath") == null) {
			vo.setTitle(title);
			vo.setCusNickname(cusNickname);
			vo.setContents(contents);
			vo.setSecretStatus(secretStatus);
			vo.setCusNum(customer.getCusNum());
			vo.setItemNum(itemNum);
			
			result = InquiryDAO.inquiryWrite(vo);
			
		} 
		//파일 있을 때
		if (mr.getFilesystemName("inqImgPath") != null) {
			vo.setTitle(title);
			vo.setCusNickname(cusNickname);
			vo.setContents(contents);
			vo.setSecretStatus(secretStatus);
			vo.setInqImgName(inqImgName);
			vo.setInqImgPath(path);
			vo.setItemNum(itemNum);
			vo.setCusNum(customer.getCusNum());
			
			result = InquiryDAO.inquiryWriteFile(vo);
		}
		
		System.out.println("inqImgName : " + mr.getFilesystemName("inqImgPath"));
		
		request.setAttribute("mr", mr);
		request.setAttribute("vo", vo);
		
		System.out.println("result" + result);
		
		return "controller?type=inquiryList";
	}

}
