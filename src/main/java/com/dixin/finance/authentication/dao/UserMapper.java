package com.dixin.finance.authentication.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.authentication.vo.UserVO;

@MapperScan
public interface UserMapper {
	
	/**
	 * 插入用户
	 * @param userVO
	 * @return
	 */
	void insert(UserVO userVO);
	
	/**
	 * 
	 * @param userVO
	 */
	List<UserVO> query(UserVO userVO);
	
	/**
	 * 
	 * @param map
	 */
	List<UserVO> selectLoginUser(Map<String, Object> map);	

	/**
	 * 
	 * @param userVO
	 */
	void updateUser(UserVO userVO);		
	
	/**
	 * 
	 * @param userId 
	 */
	void deleteUser(int userId);
	
	/**
	 * 通过用户id查询用户信息
	 * @param userId
	 * @return
	 */
	UserVO findUserById(int userId);
	
	/**
	 * *@param map
	 * 
	 */
	void updatePassword(Map<String,Object> map);
	/**
	 * @param tel
	 * 查询手机号是否存在
	 */
	Integer existsTel(String mobile);
	
	/*
	 * 评测问卷
	 */
	void setRiskTested(int userId);
}
