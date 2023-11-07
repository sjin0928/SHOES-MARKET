package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.common.Paging;
import com.mystudy.project.dao.AdminDAO;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.vo.AdminVO;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 파라미터 값 전체조회
		System.out.println("InquiryListCommand");
		Paging p = new Paging();
		
		// 세션에 저장된 로그인 정보
		HttpSession session = request.getSession();
		CustomerVO customer = null;
		
		if(session.getAttribute("customer") != null) {
			customer = (CustomerVO)session.getAttribute("customer");
		}
		
		request.setAttribute("customer", customer);
		AdminVO adminVo = AdminDAO.getAdmin();
		request.setAttribute("adminVo", adminVo);
		
		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(InquiryDAO.getTotalCount());
		System.out.println(InquiryDAO.getTotalCount());
		p.setTotalPage();
		System.out.println(p.getNowPage());
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//3-1. (선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		//4. 블록 시작페이지, 끝페이지 구하기
		//4-1. 시작페이지 구하기
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() - 1);
		System.out.println(p);
		
		//4-2. 끝페이지(endPage)가 전체 페이지 수 (totalPage) 보다 크면
			// 끝페이지를 전체 페이지 수로 변경
		if(p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		//4. DB에서 전체 게시글 조회(DAO사용)
		List<InquiryVO> list = InquiryDAO.getList(p.getBegin(), p.getEnd());
		
		//5. 조회된 데이터를 응답페이지(board_inquiry.jsp)에서 사용토록 scope에 저장
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);

		
		//64. 응답페이지(board_inquiry.jsp)로 위임 처리
				
		return "board_inquiry.jsp";
	}

}
