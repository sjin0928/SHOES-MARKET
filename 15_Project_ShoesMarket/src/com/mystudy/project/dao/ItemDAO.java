package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.ItemVO;

public class ItemDAO {
	
	// 구매 시 해당 아이템 재고 업데이트 : itemNum , stock
	public static int updateItemStock(int stock, int itemNum) {
		int result = -1;
		SqlSession ss = null;
		Map<String, Integer> map = new HashMap<>();
		map.put("stock", stock);
		map.put("itemNum", itemNum);
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.update("shoesmarket.updateItemStock", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
	// 상품 등록 게시글 전체 조회
	public static int getItemTotalCount() {
		SqlSession ss = null;
		int totalCount = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			totalCount = ss.selectOne("shoesmarket.itemTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기 - 상품 등록 게시판
	public static List<ItemVO> getPageList(int begin, int end){
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.itemList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기 - 베스트순
	public static List<ItemVO> getPageBestList(int begin, int end){
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = null;
		List<ItemVO> list = null;

		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.itemBestList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	// 전체 상품 조회 - 신상품순
	public static List<ItemVO> getAllNew(){
		SqlSession ss = null;
		List<ItemVO> item = null;
		
		try {
			ss = DBService.getFactory().openSession();
			item = ss.selectList("shoesmarket.allNew");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return item;
	}
	
	// 전체 상품 조회 - 판매수량순
	public static List<ItemVO> getAllBest(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.allBest");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	// 주문 내역 있는 제품 조회 
	public static List<ItemVO> getOrderedAll(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.orderedAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
		
	}
	
	// 주문 내역 있는 제품 ITEM_STATUS 'N'으로 update
	public static int productUpdate(int itemNum) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.update("shoesmarket.statusUpdate", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		
		return result;
	}
	
	
	// 상품 상세
	public static ItemVO getProductDetail(int itemNum){
		SqlSession ss = null;
		ItemVO vo = null;

		try {
			ss = DBService.getFactory().openSession();
			vo = ss.selectOne("shoesmarket.productDetail", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return vo;
	}
	
	// 상품 등록 처리
	public static int productWrite(ItemVO itemVo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.insert("shoesmarket.itemWrite", itemVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	// 상품 수정 
	public static int productUpdate(ItemVO itemVo) {
		SqlSession ss = null;
		int result = -1;
		
		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.update("shoesmarket.itemUpdate", itemVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		
		return result;
	}
	
	// 상품 삭제 
	public static int productDelete(int itemNum) {
		SqlSession ss = null;
		int result = -1;

		try {
			ss = DBService.getFactory().openSession(true);
			result = ss.delete("shoesmarket.itemDelete", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	// 상품 검색 
	public static List<ItemVO> getSearch(String idx, String keyword){
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.itemSearch", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	
	
	
	// 브랜드별 리스트 -------------------------
	public static List<ItemVO> getAdidas(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.allAdidas");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	public static List<ItemVO> getNewBal(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.allNewBal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	public static List<ItemVO> getConverse(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.allConverse");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	public static List<ItemVO> getPuma(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.allPuma");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	public static List<ItemVO> getVans(){
		SqlSession ss = null;
		List<ItemVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.allVans");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
}
