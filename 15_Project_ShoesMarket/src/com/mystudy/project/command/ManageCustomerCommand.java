package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.common.Paging;
import com.mystudy.project.dao.CustomerDAO;
import com.mystudy.project.vo.CustomerVO;

public class ManageCustomerCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 관리자가 고객 정보 조회
		// 고객 정보 리스트하는 클래스 
		Paging p = new Paging();
		
		//1. 전체 고객 수 구하기 
		p.setTotalRecord(CustomerDAO.getCustomerTotalCount());
		p.setTotalPage();
		System.out.println("> 상품 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 상품 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기 
		String cPage = req.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//3-1.(선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		//4-1시작페이지 구하기
		//cPage 마지막페이지 초과로 인해 끝페이지가 전체페이지보다 큰 경우 전체페이지수랑 같게 셋팅
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() - 1);
		
		//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		//끝페이지를 전체 페이지 수로 변경처리(설정)
		if(p.getEndPage() > p.getTotalPage()){
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println(">> 시작페이지(begin) : " + p.getBeginPage());
		System.out.println(">> 끝페이지(end) : " + p.getEndPage());
		//=================================
		//현재 페이지 기준으로 DB 데이터(게시글) 가져오기
		//시작번호(begin), 끝번호(end) 사용해서
		List<CustomerVO> allCustomerList = CustomerDAO.getPagelist(p.getBegin(), p.getEnd());
		req.setAttribute("allCustomerList", allCustomerList);
		req.setAttribute("pvo", p);
		
		
		
		return "manageCustomer.jsp";
	}

}
