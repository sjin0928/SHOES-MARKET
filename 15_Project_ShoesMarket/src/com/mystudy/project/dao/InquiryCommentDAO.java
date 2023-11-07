package com.mystudy.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.InquiryCommentVO;
import com.mystudy.project.vo.InquiryVO;

public class InquiryCommentDAO {
	
	/* 231024 박수진 */

	//================= 댓글 ===============
	//게시글에 딸린 댓글 목록
	public static List<InquiryCommentVO> getCommList(int inquiryNum) {
		SqlSession ss = null;
		List<InquiryCommentVO> list = null;
		try {
			ss = DBService.getFactory().openSession();
			System.out.println(inquiryNum);
			list = ss.selectList("shoesmarket.inquiryCommentAll", inquiryNum);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}

	// 게시글 작성
	public static int commentWrite(InquiryCommentVO vo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.commentWrite", vo);
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
	// 게시글 삭제
	public static int deleteComment(int iqCommentNum) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.deleteComment", iqCommentNum);
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

}
