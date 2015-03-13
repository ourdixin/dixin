package com.dixin.finance.authentication.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.authentication.constant.UserStatusConstant;
import com.dixin.finance.authentication.constant.UserTypeConstant;
import com.dixin.finance.authentication.dao.UserMapper;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserVO;

@Service
public class UserServiceImpl implements IUserService {
	
	@Resource
	private UserMapper userMapper;

	@Override
	public void register(UserVO userVO) {
		userVO.setUserType(UserTypeConstant.REGISTER);
		userVO.setEnabled(UserStatusConstant.ENABLED_YES);
		userMapper.insert(userVO);
	};
	
	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
}
