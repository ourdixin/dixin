package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.AssignmentVO;

public interface IAssignmentService {
	
	/**
	 * 插入产品转让信息
	 * @param assignment
	 */
	public void insertAssignment(AssignmentVO assignment);
	
	/**
	 * 查询产品转让信息
	 * @return
	 */
	public List<AssignmentVO> queryAssignmentList();
	
	
}
