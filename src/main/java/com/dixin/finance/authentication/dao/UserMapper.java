package com.dixin.finance.authentication.dao;

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
}
