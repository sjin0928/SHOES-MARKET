package com.mystudy.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.project.mybatis.DBService;
import com.mystudy.project.vo.CustomerVO;
import com.mystudy.project.vo.ItemVO;

public class CustomerDAO {
	
	// 고객수 조회
	public static int getCustomerTotalCount() {
		SqlSession ss = null;
		int totalCount = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			totalCount = ss.selectOne("shoesmarket.customerTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return totalCount;
	}
	
	// 페이지에 해당하는 고객 게시글 가져오기 - 회원 관리 게시판
	public static List<CustomerVO> getPagelist(int begin, int end){
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = null;
		List<CustomerVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("shoesmarket.customerList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return list;
	}
	
	
	// 회원정보 전체 조회
	public static List<CustomerVO> selectAll() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CustomerVO> customer = ss.selectList("shoesmarket.customer");
		ss.close();
		return customer;
	}

	public static CustomerVO login(String cusId, String cusPassword) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> params = new HashMap<>();
		params.put("cusId", cusId);
		params.put("cusPassword", cusPassword);
		CustomerVO customer = ss.selectOne("shoesmarket.login", params);
		ss.close();
		return customer;
	}

	public static int getNextCusNum() {
		SqlSession ss = DBService.getFactory().openSession();
		int nextCusNum = ss.selectOne("shoesmarket.getNextCusNum");
		ss.close();
		return nextCusNum;
	}

	public static void insertCustomer(CustomerVO newCustomer) {
		SqlSession ss = DBService.getFactory().openSession();
		ss.insert("shoesmarket.insertCustomer", newCustomer);
		ss.commit();
		ss.close();
	}

	public static boolean isDuplicateId(String cusId) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("shoesmarket.checkDuplicateId", cusId);
		ss.close();
		return count > 0;
	}
	
	public static boolean isDuplicateNickName(String cusNickName) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("shoesmarket.checkDuplicateNickName", cusNickName);
		ss.close();
		return count > 0;
	}

	public static boolean isDuplicateEmail(String cusEmail) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("shoesmarket.checkDuplicateEmail", cusEmail);
		ss.close();
		return count > 0;
	}
	
	public static boolean isDuplicatePhoneNum(String cusPhoneNum) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("shoesmarket.checkDuplicatePhoneNum", cusPhoneNum);
		ss.close();
		return count > 0;
	}
	
	public static void updateCustomerInfo(CustomerVO updatedCustomer) {
		SqlSession ss = DBService.getFactory().openSession();
		ss.update("shoesmarket.updateCustomerInfo", updatedCustomer);
		ss.commit();
		ss.close();
	}

	public static void deleteCustomer(int cusNum, String cusId) {
	    SqlSession ss = DBService.getFactory().openSession();
	    Map<String, Object> params = new HashMap<>();
	    params.put("cusNum", cusNum);
	    params.put("cusId", cusId);
	    ss.delete("shoesmarket.deleteCustomer", params);
	    ss.commit();
	    ss.close();
	}

	public static String findIdByPhone(String cusName, String cusPhoneNum) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> params = new HashMap<>();
		params.put("cusName", cusName);
		params.put("cusPhoneNum", cusPhoneNum);
		String foundId = ss.selectOne("shoesmarket.findIdByPhone", params);
		ss.close();
		return foundId;
	}
	
	public static String findIdByEmail(String cusName, String cusEmail) {
	    SqlSession ss = DBService.getFactory().openSession();
	    Map<String, String> params = new HashMap<>();
	    params.put("cusName", cusName);
		params.put("cusEmail", cusEmail);
	    String foundId = ss.selectOne("shoesmarket.findIdByEmail", params);
	    ss.close();
	    return foundId;
	}
	
	public static String findPassword(String cusId, String cusName, String cusPhoneNum) {
	    SqlSession ss = DBService.getFactory().openSession();
	    Map<String, String> params = new HashMap<>();
	    params.put("cusId", cusId);
	    params.put("cusName", cusName);
	    params.put("cusPhoneNum", cusPhoneNum);
	    String foundPassword = ss.selectOne("shoesmarket.findPassword", params);
	    ss.close();
	    return foundPassword;
	}
	
	public static String findPasswordByEmail(String cusId, String cusName, String cusEmail) {
	    SqlSession ss = DBService.getFactory().openSession();
	    Map<String, String> params = new HashMap<>();
	    params.put("cusId", cusId);
	    params.put("cusName", cusName);
	    params.put("cusEmail", cusEmail);
	    String foundPassword = ss.selectOne("shoesmarket.findPasswordByEmail", params);
	    ss.close();
	    return foundPassword;
	}

}