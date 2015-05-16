package com.dixin.finance.authentication.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.dixin.finance.authentication.service.IAreaService;
import com.dixin.finance.authentication.service.IAsmService;
import com.dixin.finance.authentication.service.IFinService;
import com.dixin.finance.authentication.service.IFmrService;
import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.web.ProductController;

/**
 * 后台管理
 * @author chenlly
 *
 */
@Controller
public class AuthenManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private IUserService userServiceImpl;

	@Resource
	private ISmsService smsServiceImpl;
	
	@Resource
	private IFmrService fmrServiceImpl;
	
	@Resource
	private IAsmService asmServiceImpl;
	
	@Resource
	private IFinService finServiceImpl;
	
	@Resource
	private IMessageService messageServiceImpl;
	
	@Resource
	private IAreaService areaServiceImpl;

	public IUserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(IUserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	public ISmsService getSmsServiceImpl() {
		return smsServiceImpl;
	}

	public void setSmsServiceImpl(ISmsService smsServiceImpl) {
		this.smsServiceImpl = smsServiceImpl;
	}

	public IFmrService getFmrServiceImpl() {
		return fmrServiceImpl;
	}

	public void setFmrServiceImpl(IFmrService fmrServiceImpl) {
		this.fmrServiceImpl = fmrServiceImpl;
	}

	public IAsmService getAsmServiceImpl() {
		return asmServiceImpl;
	}

	public void setAsmServiceImpl(IAsmService asmServiceImpl) {
		this.asmServiceImpl = asmServiceImpl;
	}

	public IFinService getFinServiceImpl() {
		return finServiceImpl;
	}

	public void setFinServiceImpl(IFinService finServiceImpl) {
		this.finServiceImpl = finServiceImpl;
	}

	public IMessageService getMessageServiceImpl() {
		return messageServiceImpl;
	}

	public void setMessageServiceImpl(IMessageService messageServiceImpl) {
		this.messageServiceImpl = messageServiceImpl;
	}

	public IAreaService getAreaServiceImpl() {
		return areaServiceImpl;
	}

	public void setAreaServiceImpl(IAreaService areaServiceImpl) {
		this.areaServiceImpl = areaServiceImpl;
	}
	
	
}
