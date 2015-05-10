package com.dixin.finance.authentication.service;

import com.dixin.finance.authentication.vo.UserVO;

public interface IUserService {
	
	/**
	 * 插入用户
	 */
	void register(UserVO userVO);
	
	/**
	 * 用户登陆
	 */
	UserVO login(String username,String password);	
	/**
	 * 更新密码
	 */
	void  resetPassword(String password,int user_id);
	/**
	 * 查找与手机号匹配的用户；
	 * 
	 */
	int checkWithTel(String mobile);
	
	/**
	 * 通过用户id查找用户信息
	 * @param id
	 * @return
	 */
	UserVO findUserById(int user_id);
	
	/**
	 * 修改用户信息
	 * @param userVO
	 */
	void updateUser(UserVO userVO);
	
	
	void setRiskTested(int userId);
}
