package com.dixin.framework.base;

import org.apache.commons.lang3.StringUtils;
import org.junit.Before;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;

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
		
		// 初始化日志
//		LoggerContext lc = (LoggerContext)LoggerFactory.getILoggerFactory();
//		JoranConfigurator config = new JoranConfigurator();
//		config.setContext(lc);
//		lc.reset();
//		try {
//			config.doConfigure("/config/log/logback.xml");
//		} catch (JoranException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}
	
	protected abstract String getConfigLocation();
	
	protected Object getBean(String beanName){
		if (context == null){
			throw new NullPointerException("ApplicationContext is not init!");
		}
		return context.getBean(beanName);
	}
}
