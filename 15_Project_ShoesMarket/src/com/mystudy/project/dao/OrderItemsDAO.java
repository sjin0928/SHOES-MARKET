package com.mystudy.project.dao;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.BuyVO;
import com.mystudy.project.vo.OrderItemsVO;

public class OrderItemsDAO {
	// 주문 처리 (insert) 
	public static int buyOrderItem(OrderItemsVO orderItemsVo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.buyOrderItem", orderItemsVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	
}
