package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.InquiryVO;

@WebServlet("/getBoardInquiry")
public class GetJsonInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행----");
		//한글깨짐 방지를 위한 문자타입(UTF-8)
		response.setContentType("text/html; charset=UTF-8");
		
		//DB 데이터 가져오기
		List<InquiryVO> list = null;//InquiryDAO.getList();
		System.out.println("list : " + list);
		
		//JSON 형식 문자열 만들고 응답처리
		// {"list" : [{}, {}, .... , {}] }
		String result = makeJosn(list);
		
		//클라이언트에게 응답처리
		PrintWriter out = response.getWriter();
		out.print(result);
		}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행----");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
	
	private String makeJosn(List<InquiryVO> list) {
		/* {"list" : [{}, {}, .... , {}] }
		{ "list" : [
			{
				"idx" : 1,
				"name" : "홍길동",
				"age" : 27,
				"addr" : "서울",
				"regdate" : "2023-10-27"
			},
			{}, {}, ......, {}
		]}
		*******************************/
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		
		for (InquiryVO vo : list) {
			result.append("{");
			result.append("\"inquiryNum\": " + vo.getInquiryNum() + ", ");
			result.append("\"secretStatus\": \"" + vo.getSecretStatus() + "\", ");
			result.append("\"cusNickname\": \"" + vo.getCusNickname() + "\", ");
			result.append("\"title\": \"" + vo.getTitle() + "\", ");
			result.append("\"itemNum\": \"" + vo.getItemNum() + "\", ");
			result.append("\"regdate\": \"" + vo.getRegDate() + "\", ");
			result.append("\"moddate\": \"" + vo.getModDate() + "\" ");
			result.append("},");
		}
		//result.delete(result.length() - 1, result.length());
		result.deleteCharAt(result.length() - 1);
		result.append("]}");
		
		System.out.println(result.toString());
		
		return result.toString();
	}
}
