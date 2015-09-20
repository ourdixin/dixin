package com.dixin.framework.tools;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class MyContextListener implements ServletContextListener
{
    private static WebApplicationContext webApplicationContext;
    
    private static ApplicationUtil applicationUtil = new ApplicationUtil();

    @Override
    public void contextDestroyed(ServletContextEvent sce)
    {

    }

    @Override
    public void contextInitialized(ServletContextEvent sce)
    {
        webApplicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext());
        applicationUtil.setApplicationContext(webApplicationContext);  
    }

}