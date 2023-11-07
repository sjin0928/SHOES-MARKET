package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//231024 박수진
public class InquiryWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--InquiryWriteCommand--");
		
		String path = "C:\\temp";
		System.out.println("> path : " + path);
		
		MultipartRequest mr = new MultipartRequest(
			request, //요청객체
			path, //실제 파일을 저장할 경로
			10 * 1024 * 1024, //업로드 파일의 최대크기(byte 단위)
			"UTF-8", //인코딩 형식
			new DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경저장
		);
		
		InquiryVO vo = new InquiryVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setCusNickname(mr.getParameter("cusNickname"));
		vo.setContents(mr.getParameter("contents"));
		vo.setSecretStatus(mr.getParameter("secretStatus"));
		vo.setInqImgName(mr.getFilesystemName("inqImgPath"));
		vo.setInqImgPath(path);
		
		String itemName = mr.getParameter("itemName");
		System.out.println(itemName);
		
		int itemNum = InquiryDAO.inquiryItemSearch(itemName);
		System.out.println("itemNum : " + itemNum);
		vo.setItemNum(itemNum);
		
		System.out.println("inqImgPath : " + mr.getFilesystemName("inqImgPath"));
		
		// 합친 후 session에서 고객번호 받아서 넣어주기
		vo.setCusNum(1);
		int result = InquiryDAO.inquiryWrite(vo);
		
		request.setAttribute("mr", mr);
		request.setAttribute("vo", vo);
		
		System.out.println("result" + result);
		
		return "controller?type=list";
	}

}
