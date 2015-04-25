package com.dixin.finance.authentication.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import com.dixin.finance.authentication.vo.Financial_institutionVO;

@MapperScan
public interface Financial_institutionMapper {
	/**
	 * 
	 */
	void insert(Financial_institutionVO f_insVO);
	/**
	 * 
	 */
	List<Financial_institutionVO> query();

}
