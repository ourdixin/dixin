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
}
