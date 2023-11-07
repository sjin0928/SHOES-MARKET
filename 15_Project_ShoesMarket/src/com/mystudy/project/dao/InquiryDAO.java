package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.InquiryVO;

public class InquiryDAO {
	// 내가 쓴 게시글 조회
	public static List<InquiryVO> getInquiryList(int cusNum){
		SqlSession ss = null;
		List<InquiryVO> inquiryList = null;
		
		try {
			ss = DBService.getFactory().openSession();
			inquiryList = ss.selectList("shoesmarket.getInquiryList", cusNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return inquiryList;
	}
	//박수진

	//게시글 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			totalCount = ss.selectOne("shoesmarket.totalCount");
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
			list = ss.selectList("shoesmarket.inquiry", map);
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
			searchCount = ss.selectOne("shoesmarket.searchCount", map);
			
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
	
	// 게시글 상세 보기	
	public static InquiryVO getView(int inquiryNum) {
		
		SqlSession ss = null;
		InquiryVO vo = null;
		
		try {
			ss = DBService.getFactory().openSession();
			vo = ss.selectOne("shoesmarket.inquiryView", inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) {
				ss.close();
			}
		}
		return vo;
	}
	
	// 게시글 수정하기(파일)
	public static int inquiryUpdateFile(String title, String contents, String inqImgName, String inqImgPath, int inquiryNum) {
		InquiryVO vo = new InquiryVO(inquiryNum, title, contents, inqImgPath, inqImgName);
		
		System.out.println("inquiryUpdate vo : " + vo );
		
		SqlSession ss = null;
		int voUp = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			voUp = ss.update("shoesmarket.inquiryUpdateFile", vo);
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
	// 게시글 수정하기(파일x)
	public static int inquiryUpdate(String title, String contents, int inquiryNum) {
		InquiryVO vo = new InquiryVO(inquiryNum, title, contents);
		
		System.out.println("inquiryUpdate vo : " + vo );
		
		SqlSession ss = null;
		int voUp = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			voUp = ss.update("shoesmarket.inquiryUpdate", vo);
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
			result = ss.update("shoesmarket.inquiryDelete", inquiryNum);
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
	// 게시글 작성 (파일O)
	public static int inquiryWriteFile(InquiryVO vo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.inquiryWriteFile", vo);
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
	// 게시글 작성(파일x)
	public static int inquiryWrite(InquiryVO vo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.inquiryWrite", vo);
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
	// 게시글 등록 아이템 검색
	public static int inquiryItemSearch(String itemName) {
		SqlSession ss = null;
		int itemNum = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			itemNum = ss.selectOne("shoesmarket.inquiryItemSearch", itemName);
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
