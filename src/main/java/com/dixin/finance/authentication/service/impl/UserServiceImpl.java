package com.dixin.finance.authentication.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public UserVO login(String username,String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", username);
		map.put("password", password);	
		
		List<UserVO> users = userMapper.selectLoginUser(map);
		
		if(users.size() ==  0)
			return null;
		
		UserVO user= users.get(0);
		
		return user;
	}
	
	@Override
	public void resetPassword(String password, int user_id){
		Map<String, Object> map = new HashMap<String , Object>();
		
		map.put("password", password);
		map.put("user_id", user_id);
		userMapper.updatePassword(map);
	}
	
	@Override
	public int checkWithTel(String mobile){
		
		Integer user_id = userMapper.existsTel(mobile);
		if(user_id ==  null)
			return -1;
		
		return user_id;
	}
	
	@Override
	public void setRiskTested(int userId)
	{
		userMapper.setRiskTested(userId);
	}
	
	
	@Override
	public List<UserVO> findAllUser() {
		return userMapper.query(null);
	}

	@Override
	public UserVO findUserById(int userId) {
		return userMapper.findUserById(userId);
	}
	
	@Override
	public void updateUser(UserVO userVO) {
		userMapper.updateUser(userVO);
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
}
