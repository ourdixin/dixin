package com.dixin.finance.product.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.AssignmentVO;

@MapperScan
public interface AssignmentMapper {
	/**
	 * 插入产品转让信息
	 * @param assignment
	 */
	public void insert(AssignmentVO assignment);
	
	/**
	 * 查询产品转让信息
	 * @return 
	 */
	public List<AssignmentVO> query();
	
	/**
	 * 查询用户产品转让信息
	 * @return 
	 */
	public List<AssignmentVO> queryUserAssignmentList(int userId);	
}
