package com.dixin.finance.authentication.service;
import  com.dixin.finance.authentication.vo.FinancialManagerVO;
public interface IFmrService {
	/**
	 * 查找用户的专属财富经理
	 */
	FinancialManagerVO selectFmanager(int id);
	

}
