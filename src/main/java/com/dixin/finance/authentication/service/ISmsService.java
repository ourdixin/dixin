package com.dixin.finance.authentication.service;

import java.util.List;

import com.dixin.finance.authentication.vo.UserVO;

public interface ISmsService {
	
	/**
	 * 发送短信
	 */
	boolean sendSms(String strMsg,List<String> phoneList);
	
	/**
	 * 发送彩信
	 */
	boolean sendMms(String strMsg,List<String> phoneList);	
}
