package com.mystudy.project.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class itemUpdateCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상품 번호로 상품 찾고 vo 객체 주고 수정
		System.out.println(">> itemUpdateCommand ");
		HttpSession session = req.getSession();
		// 세션에 저장한 아이템 번호 
		int itemNum = Integer.parseInt((String)session.getAttribute("itemNum"));
		req.setCharacterEncoding("UTF-8");
		String path = "c:/Mystudy/60_web/temp_project/img";
		MultipartRequest mr = new MultipartRequest(req, path, (10 * 1024 * 1024),
								"UTF-8", new DefaultFileRenamePolicy());
		String imagePath = "img/" + mr.getFilesystemName("imagePath");
		ItemVO vo = new ItemVO();
		
		
		// 수정 시 별도로 파일 수정하지 않았을 경우 확인
		File updateFile = mr.getFile("imagePath");
		
		
		if(updateFile == null) {
			// 수정 시 파일 수정 안 하면 이전에 있던 사진 그대로 사용
			System.out.println(">> itemUpdateCommand 파일 업로드 안 함");
			vo.setImagePath((String)session.getAttribute("imagePath"));
		} else {
			// 수정 시 새로 업로드한 사진 사용
			vo.setImagePath(imagePath);
		}
		
				
		vo.setName(mr.getParameter("name"));
		vo.setPrice(Integer.parseInt(mr.getParameter("price")));
		vo.setStock(Integer.parseInt(mr.getParameter("stock")));
		vo.setItemDetail(mr.getParameter("itemDetail"));
		vo.setItemNum(itemNum);
		vo.setBrand(mr.getParameter("brand"));
		System.out.println(">> itemUpdateCommand 상품 번호 확인 : " + itemNum);
		
		int result = ItemDAO.productUpdate(vo);
		req.setAttribute("result", result);
		System.out.println(">> itemUpdateCommand 데이터 update 결과 (1-성공) " + result);
		
		return "itemUpdate_ok.jsp";
	}

}
