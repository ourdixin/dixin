package com.dixin.framework.base.web;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.stereotype.Component;

import com.dixin.framework.constant.WebConstants;


@Component
public class TokenHandler {

	//@Autowired
    //private org.springframework.cache.support.SimpleCacheManager cacheManager;
	/*
    public String generate() {
        Cache cache = cacheManager.getCache("tokens");
        String token = UUID.randomUUID().toString();
        cache.put(token, token);
        return token;
    }
    */
    public String generate(HttpSession session) {
    	Map<String, String> springmvc_token = null;
    	Object obj = session.getAttribute(WebConstants.DEFAULT_TOKEN);
    	if(obj!=null)
    		springmvc_token = (Map<String,String>)session.getAttribute(WebConstants.DEFAULT_TOKEN);
    	else
    		springmvc_token = new HashMap<String, String>();
        
        String token = UUID.randomUUID().toString();
        springmvc_token.put(WebConstants.DEFAULT_TOKEN_NAME +"."+token, token);
        session.setAttribute(WebConstants.DEFAULT_TOKEN, springmvc_token);
        return token;
    }
    
    public static boolean IsValidToken(HttpServletRequest request)
    {
    	boolean valid = true;
    	String token = request.getParameter("token");

        HttpSession session = request.getSession();
        Map<String, String> tokenMap = (Map<String, String>) session.getAttribute(WebConstants.DEFAULT_TOKEN);
        if (tokenMap == null || tokenMap.size() < 1) {
        	valid = false;
        }
        else{
            String sessionToken = tokenMap.get(WebConstants.DEFAULT_TOKEN_NAME +"." + token);
            if (!token.equals(sessionToken)) {
            	valid = false;
            }
        }
        
        if (valid) {
            tokenMap.remove(WebConstants.DEFAULT_TOKEN_NAME +"."+ token);
            session.setAttribute("SPRINGMVC.TOKEN", tokenMap);
        }
        
        return valid;
    }
    
}
