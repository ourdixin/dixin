package com.dixin.finance.authentication.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.framework.constant.WebConstants;

@Controller
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private IUserService userServiceImpl;

	@RequestMapping("/authentication/register")
	public String register(UserVO userVO, HttpSession session){

		logger.info("用户" + userVO.getUsername() + "注册开始");
		userServiceImpl.insert(userVO);
		logger.info("用户" + userVO.getUsername() + "注册成功");
		session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
		return "authentication/register";
	}

	public IUserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(IUserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

}
