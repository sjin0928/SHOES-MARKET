package com.mystudy.project.dao;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.AdminVO;

public class AdminDAO {
	
	public static AdminVO getAdmin() {
		SqlSession ss = null;
		AdminVO vo = null;
		try {
			ss = DBService.getFactory().openSession();
			vo = ss.selectOne("shoesmarket.loginAdmin");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return vo;
	}
	
}
