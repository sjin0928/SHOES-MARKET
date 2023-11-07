package com.mystudy.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CartVO;

public class CartDAO {
	
	// 주문 시, 해당 제품 장바구니 리스트에서 삭제 
	public static int deleteCartItem(int cartNum) {
		SqlSession ss = null;
		int result = -1;

		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.delete("shoesmarket.deleteCartItem", cartNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	// 장바구니 담기 
	public static int putCart(CartVO cartVo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.putCart", cartVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
		
	}
	
	
	// 기타 메서드 (장바구니 목록 조회, 수정, 삭제 등) 추가
	
	// 장바구니 조회 
	public static List<CartVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> cart = ss.selectList("shoesmarket.cart");
		ss.close();
		return cart;
	}
	
//	// 장바구니 담기
//	public static int insertCart(CartVO vo) {
//		SqlSession ss = DBService.getFactory().openSession(true);
//		int result = ss.insert("shoesmarket.cartInsert", vo);
//	    ss.close();
//	    return result; 
//	}
	
	
	// 장바구니에 상품 추가
	public static int addCart(CartVO vo) {
	    SqlSession ss = DBService.getFactory().openSession(true);
	    int result = ss.insert("shoesmarket.cartInsert", vo);
	    ss.close();
	    return result;
	}

    
	// 장바구니 수량 업데이트 (10/28 예외처리 추가)
	public static int updateCart(CartVO vo) {
        SqlSession ss = null;
        int result =  1;	
        
        try {
        	ss = DBService.getFactory().openSession(true);
        	result = ss.update("shoesmarket.cartUpdate", vo);
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	ss.close();
        }
        return result;
    }
	
	// 장바구니 삭제
    public static int deleteCart(int cartNum) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = ss.delete("shoesmarket.cartDelete", cartNum);
        ss.close();
        return result;
    }
	
	// 개별 장바구니 항목 불러오기
	public static CartVO getCartItemByCartNum(int cartNum) {
	    SqlSession ss = DBService.getFactory().openSession();
	    CartVO cartItem = ss.selectOne("shoesmarket.getCartItemByCartNum", cartNum);
	    ss.close();
	    
	    if (cartItem != null) {
	        // 콘솔창으로 값 출력되는지 확인
	    	System.out.println("Cart Item: " + cartItem.toString()); // 모든 필드 출력
	        //System.out.println("Cart Item Name: " + cartItem.getName());
	        //System.out.println("Cart Item Price: " + cartItem.getPrice());
	    } else {
	        System.out.println("Cart Item not found for CartNum: " + cartNum);
	    }
	    
	    return cartItem;
	}
}
