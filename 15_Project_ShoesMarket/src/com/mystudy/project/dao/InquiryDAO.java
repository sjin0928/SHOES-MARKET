package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CommentVO;
import com.mystudy.project.vo.InquiryVO;

/* 231024 박수진 */
public class InquiryDAO {

	//게시글 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = DBService.getFactory().openSession();
		try {
			totalCount = ss.selectOne("Shoesmarket.totalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
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
			ss.close();
		}
		return list;
	}
	// 게시글 키워드 검색
	public static List<InquiryVO> getSearch(String idx, String keyword, int begin, int end) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		SqlSession ss = DBService.getFactory().openSession();
		List<InquiryVO> list = ss.selectList("Shoesmarket.inquiry_search", map);
		ss.close();
		return list;
	}
	

	//================= 댓글 ===============
	//게시글에 딸린 댓글 목록
	public static List<CommentVO> getCommList(int bbsIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CommentVO> list = ss.selectList("Shoesmarket.commList", bbsIdx);
		ss.close();
		
		return list;
	}
}
