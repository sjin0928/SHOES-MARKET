package com.mystudy.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.InquiryCommentVO;

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
			list = ss.selectList("Shoesmarket.inquiry_comment_all", inquiryNum);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}

}
