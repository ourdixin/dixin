package com.dixin.framework.base;

import org.apache.commons.lang3.StringUtils;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public abstract class BaseTest {
	
	private ApplicationContext context = null;
	
	@Before
	public void setUp(){
		// 初始化spring配置
		if (this.context == null){
			String configLocation = getConfigLocation();
			if (StringUtils.isBlank(configLocation)){
				throw new NullPointerException("configPath is not init.");
			}
			this.context = new ClassPathXmlApplicationContext(configLocation);
		}
	}
	
	protected abstract String getConfigLocation();
	
	protected Object getBean(String beanName){
		if (context == null){
			throw new NullPointerException("ApplicationContext is not init!");
		}
		return context.getBean(beanName);
	}
}
