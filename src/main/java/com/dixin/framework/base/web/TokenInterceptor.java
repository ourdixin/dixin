package com.dixin.framework.base.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dixin.framework.constant.WebConstants;


@Component("tokenInterceptor")
public class TokenInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(TokenInterceptor.class);

    //@Autowired
    //private org.springframework.cache.CacheManager cacheManager;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        boolean valid = true;

        String className = handler.getClass().getName();
        if(!className.contains("HandlerMethod") )
        	return super.preHandle(request, response, handler);
        
        HandlerMethod method = (HandlerMethod) handler;

        CheckToken annotation = method.getMethodAnnotation(CheckToken.class);
        if (annotation != null) {
        	valid = TokenHandler.IsValidToken(request);
            
            annotation.remove();

            if (!valid) {
                logger.info("token is not valid , set error to request");
                request.setAttribute("error", "请不要重复提交！");
                response.sendRedirect(request.getContextPath() + "/error.htm"); 
                return false;
            }
        }

        return super.preHandle(request, response, handler);
    }

    @Override  
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav) throws Exception {  
        //response.sendRedirect(request.getContextPath() + "/error.htm");  
    }  
    
}
