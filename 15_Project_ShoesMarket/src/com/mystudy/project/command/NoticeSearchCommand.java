package com.mystudy.project.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.common.NoticePaging;
import com.mystudy.project.common.Paging;
import com.mystudy.project.dao.InquiryDAO;
import com.mystudy.project.dao.NoticeDAO;
import com.mystudy.project.vo.InquiryVO;
import com.mystudy.project.vo.NoticeVO;

/* 231024 박수진 */
public class NoticeSearchCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// search 요청 처리(화면전환 : 입력폼/ 검색목록)
		// 전달된 파라미터 값 확인
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println(">>> SearchCommand idx, keyword : " + idx + ", " +  keyword);
		
		NoticePaging p = new NoticePaging();
		
		//1. 검색 게시물 수량 구하기
		int searchCount = NoticeDAO.getSearchCount(keyword);
		p.setTotalRecord(searchCount);
		System.out.println("NoticeDAO.getSearchCount" + searchCount);
		p.setTotalPage();
		System.out.println(p.getNowPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		System.out.println(cPage);
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
		
		if (keyword == null || keyword.trim().equals("")) {
			return "board_notice_list.jsp";
		}
		System.out.println(p);
		
		// DB연동 데이터 검색 처리
		List<NoticeVO> list = NoticeDAO.getSearch(keyword, p.getBegin(), p.getEnd());
		request.setAttribute("list", list);
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pvo", p);
		
		System.out.println(list);
		System.out.println(p);
		return "board_notice_list.jsp";
	}
}
