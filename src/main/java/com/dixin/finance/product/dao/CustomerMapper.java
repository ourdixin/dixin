package com.dixin.finance.product.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.MessageVO;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.constant.CustomerConstant;

@MapperScan
public interface CustomerMapper {
	
	/**
	 * 插入在线客服message信息
	 */
	void insert(MessageVO messageVO);
	/**
	 * 查询message总数
	 */
	Integer selectTotal();
	/**
	 * 查询message下一个自增ID
	 */
	Integer selectNextId();
}