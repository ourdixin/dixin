package com.dixin.framework.base.dao;

import org.springframework.context.ApplicationContext;

import com.dixin.framework.base.BaseTest;

public abstract class BaseDAOTest extends BaseTest {
	
	private ApplicationContext context = null;

	protected String getConfigLocation(){
		return "/config/spring/mybatisContext.xml";
	}
	
}
