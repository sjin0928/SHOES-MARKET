package com.mystudy.project.command;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.ItemDAO;
import com.mystudy.project.vo.ItemVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductWriteCommand implements Command{

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 한글처리
		req.setCharacterEncoding("UTF-8");
		// itemVO 객체 생성해서 insert 
		// 전달 받은 값 저장 후 ItemVo set
		System.out.println(">> productWriteCommand 실행 ");
		//System.out.println(">> productWriteCommand name : " + req.getAttribute("name")); // null
		//파일 저장할 경로 지정
		//String realPath = req.getServletContext().getRealPath("/upload");
		
		
		
		String path = "c:/Mystudy/60_web/temp_project/img"; // 수정 전 !!!!!
		
		MultipartRequest mr = new MultipartRequest(req, path, (10 * 1024 * 1024),
								"UTF-8", new DefaultFileRenamePolicy());
		ItemVO vo = new ItemVO();
		
		// vo.setImagePath : 파일 경로 + 파일명 = 이미지 태그 내 src에 사용됨
		String imagePath = "img/" + mr.getFilesystemName("imagePath");
		vo.setName(mr.getParameter("name"));
		vo.setPrice(Integer.parseInt(mr.getParameter("price")));
		vo.setImagePath(imagePath);
		vo.setStock(Integer.parseInt(mr.getParameter("stock")));
		vo.setItemDetail(mr.getParameter("itemDetail"));
		vo.setBrand(mr.getParameter("brand"));
		
		//System.out.println(">> productWriteCommand vo : " + vo);
		int result = ItemDAO.productWrite(vo);
		System.out.println(">> productWriteCommand 데이터 insert 결과 (1-성공) " + result);
		req.setAttribute("result", result);
		
		return "itemWrite_ok.jsp";
	}

}
