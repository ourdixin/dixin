package com.dixin.finance.authentication.service;

import java.util.List;

import com.dixin.finance.authentication.vo.UserVO;

public interface IUserService {
	
	/**
	 * 插入用户
	 */
	void register(UserVO userVO);
	
	/**
	 * 用户登录
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
	 * 通过用户id查找用户信息
	 * @param id
	 * @return
	 */
	UserVO findUserByMobile(String mobile);
		
	/**
	 * 查找所有用户
	 * @return
	 */
	List<UserVO> findAllUser();
	
	/**
	 * 修改用户信息
	 * @param userVO
	 */
	void updateUser(UserVO userVO);
	
	/**
	 * 设置用户评分
	 * @return
	 */	
	void setRiskTested(int userId,int grade);
}
