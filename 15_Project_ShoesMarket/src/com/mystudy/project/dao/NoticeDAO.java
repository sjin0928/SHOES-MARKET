package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.InquiryVO;
import com.mystudy.project.vo.NoticeVO;

/* 231024 박수진 */
public class NoticeDAO {

	//공지사항 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			totalCount = ss.selectOne("shoesmarket.noticeTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return totalCount;
	}
	// 공지사항 메인 페이지 용 최신 공지사항 조회
	public static List<NoticeVO> getNewList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = null;
		List<NoticeVO> list = null;
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.noticeList", map);
			System.out.println("noticeList : " + list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return list;
	}

	//공지사항 전체 조회
	public static List<NoticeVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = null;
		List<NoticeVO> list = null;
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.noticeList", map);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return list;
	}
	
	//공지사항 키워드 검색 수 조회
	public static int getSearchCount(String keyword) {
		System.out.println(">>> getSearchCount idx, keyword : " + keyword);
		SqlSession ss = null;
		int searchCount = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			searchCount = ss.selectOne("shoesmarket.searchCount", keyword);
			
			System.out.println(searchCount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		
		return searchCount;
	}
	// 공지사항 키워드 검색
	public static List<NoticeVO> getSearch(String keyword, int begin, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		SqlSession ss = null;
		List<NoticeVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.inquirySearch", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return list;
	}
	
	// 공지사항 상세 보기	
	public static NoticeVO getView(int noticeNum) {
		
		SqlSession ss = null;
		NoticeVO vo = null;
		
		try {
			ss = DBService.getFactory().openSession();
			vo = ss.selectOne("shoesmarket.noticeView", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return vo;
	}
	
	// 관리자 페이지에서 씀
	/*
	// 공지사항 수정하기(파일) 

	public static int inquiryUpdateFile(String title, String contents, String fileName, String filePath, int noticeNum) {
		NoticeVO vo = new NoticeVO(noticeNum, title, contents, filePath, fileName);
		
		System.out.println("inquiryUpdate vo : " + vo );
		
		SqlSession ss = null;
		int voUp = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			voUp = ss.update("shoesmarket.inquiry_update", vo);
			System.out.println("voUp" + voUp);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return voUp;
	}
	*/
	
	// 공지사항 수정하기(파일x)
	public static int inquiryUpdate(String title, String contents, int inquiryNum) {
		InquiryVO vo = new InquiryVO(inquiryNum, title, contents);
		
		System.out.println("inquiryUpdate vo : " + vo );
		
		SqlSession ss = null;
		int voUp = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			voUp = ss.update("shoesmarket.inquiry_update", vo);
			System.out.println("voUp" + voUp);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return voUp;
	}
	
	// 공지사항 삭제하기
	public static int inquiryDelete(int inquiryNum) {
	
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.update("shoesmarket.inquiry_delete", inquiryNum);
			System.out.println("result" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}
	// 공지사항 작성
	public static int inquiryWrite(InquiryVO vo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.inquiry_write", vo);
			System.out.println("result" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return result;
	}

	public static int inquiryItemSearch(String itemName) {
		SqlSession ss = null;
		int itemNum = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			itemNum = ss.selectOne("shoesmarket.inquiry_item_search", itemName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return itemNum;
		
	}
	
	
}
