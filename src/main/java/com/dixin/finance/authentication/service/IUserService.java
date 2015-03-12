package com.dixin.finance.authentication.service;

import com.dixin.finance.authentication.vo.UserVO;

public interface IUserService {
	
	/**
	 * 插入用户
	 */
	void insert(UserVO userVO);
}
