package com.dixin.finance.product.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.AssignmentVO;

@MapperScan
public interface AssignmentMapper {
	/**
	 * 插入产品转让信息
	 * @param assignment
	 */
	public void insert(AssignmentVO assignment);
}
