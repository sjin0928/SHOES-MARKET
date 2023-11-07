package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.InquiryVO;

/* 231024 박수진 */
public class InquiryDAO {

	//게시글 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			totalCount = ss.selectOne("Shoesmarket.totalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return totalCount;
	}

	//게시글 전체 조회
	public static List<InquiryVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = null;
		List<InquiryVO> list = null;
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("Shoesmarket.inquiry", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return list;
	}
	
	//게시글 키워드 검색 수 조회
	public static int getSearchCount(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		System.out.println(">>> getSearchCount idx, keyword : " + idx + ", " +  keyword);
		SqlSession ss = null;
		int searchCount = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			searchCount = ss.selectOne("Shoesmarket.searchCount", map);
			
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
	// 게시글 키워드 검색
	public static List<InquiryVO> getSearch(String idx, String keyword, int begin, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		SqlSession ss = null;
		List<InquiryVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("Shoesmarket.inquiry_search", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return list;
	}
	
	// 게시글 상세 보기	
	public static InquiryVO getView(int inquiryNum) {
		
		SqlSession ss = null;
		InquiryVO vo = null;
		
		try {
			ss = DBService.getFactory().openSession();
			vo = ss.selectOne("Shoesmarket.inquiry_view", inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return vo;
	}
	
	// 게시글 수정하기
	public static int inquiryUpdate(String title, String contents, String inqImgName, String inqImgPath, int inquiryNum) {
		InquiryVO vo = new InquiryVO(inquiryNum, title, contents, inqImgPath, inqImgName);
		
		System.out.println("inquiryUpdate vo : " + vo );
		
		SqlSession ss = null;
		int voUp = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			voUp = ss.update("Shoesmarket.inquiry_update", vo);
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
	
	// 게시글 삭제하기
	public static int inquiryDelete(int inquiryNum) {
	
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.update("Shoesmarket.inquiry_delete", inquiryNum);
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
	// 게시글 작성
	public static int inquiryWrite(InquiryVO vo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("Shoesmarket.inquiry_write", vo);
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
			itemNum = ss.selectOne("Shoesmarket.inquiry_item_search", itemName);
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
