package com.dixin.finance.authentication.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;

@Controller
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private IUserService userServiceImpl;

	@RequestMapping(value="/authentication/user", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult register(UserVO userVO, HttpSession session){

		logger.info("用户" + userVO.getUserName() + "注册开始");
		userServiceImpl.register(userVO);
		logger.info("用户" + userVO.getUserName() + "注册成功");
		session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSucess(true);
		webResult.setResult(userVO);
		return webResult;
	}

	
	@RequestMapping(value="/authentication/login", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult login(String username,String password, HttpSession session){
		
		BaseWebResult webResult = new BaseWebResult();
		logger.info("用户" + username + "登陆开始");
		UserVO userVO = userServiceImpl.login(username,password);
		if(userVO != null)
		{
			logger.info("用户" + username + "登陆成功");
			webResult.setSucess(true);
			session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
		}
		else
		{
			logger.info("用户" + userVO.getUserName() + "登陆失败");
			webResult.setSucess(false);

		}
		
		webResult.setResult(userVO);	
		
		return webResult;
	}	
	
	
	
	public IUserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(IUserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

}
