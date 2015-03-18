package com.dixin.finance.authentication.dao;

import org.junit.Test;

import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.framework.base.dao.BaseDAOTest;

public class UserMapperTest extends BaseDAOTest {
	private UserMapper userMapper = null;
	
	public void setUp(){
		super.setUp();
		this.userMapper = (UserMapper)this.getBean("userMapper");
	}
	
	@Test
	public void testInsert(){
		UserVO userVO = new UserVO();
		userVO.setMobile("13000000000");
		userVO.setPassword("testPassword");
		this.userMapper.insert(userVO);
	}
}
