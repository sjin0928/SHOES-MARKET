package com.mystudy.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.BuyVO;
import com.mystudy.project.vo.CartVO;

public class BuyDAO {
		
	// 주문 insert 
	public static int buyItem(BuyVO buyVo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.buyItem", buyVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	public static int getBuyNum() {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.selectOne("shoesmarket.getBuySeq");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
		
	}
	
	
	
	// 주문 내역 조회
	public static List<BuyVO> getOrderedList(int cusNum){
		SqlSession ss = null;
		List<BuyVO> orderedList = null;
		
		try {
			ss = DBService.getFactory().openSession();
			orderedList = ss.selectList("shoesmarket.getOrderedList", cusNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return orderedList;
	}
		
	// 주문상품 insertOrder
	public static List<CartVO> insertCartOrder(int selectedItems) {
	    SqlSession ss = DBService.getFactory().openSession(true);
	    System.out.println("selctedItems : " + selectedItems);
	    List<CartVO> list = new ArrayList<>();
	    
	    // selectOne 대신 selectList 메서드를 사용하여 리스트로 데이터를 가져옴
	    List<CartVO> cartList = ss.selectList("shoesmarket.getCartList", selectedItems);
	    
	    // 리스트를 별도의 리스트에 추가
	    list.addAll(cartList);

	    ss.close();
	    return list;
	}
	
	
	
	// 주문상품 insertBuyInfo - BuyDAO 클래스에 새로운 메서드 추가
	public static List<CartVO> insertBuyInfo(int cartNum) {
	    SqlSession ss = DBService.getFactory().openSession(true);
	    System.out.println("getCartListFromBuyInfo (cartNum) : " + cartNum);
	    
	    List<CartVO> list = ss.selectList("shoesmarket.getCartListFromBuyInfo", cartNum);
	    
	    System.out.println("getCartListFromBuyInfo (cartNum) : " + cartNum);
	    
	    ss.close();
	    return list;
	}
		
}

//public static int insertBuyInfo(BuyVO buyInfo) {
//SqlSession ss = DBService.getFactory().openSession(true);
//int result = ss.insert("shoesmarket.insertBuyInfo", buyInfo);
//ss.close();
//return result;
//}
