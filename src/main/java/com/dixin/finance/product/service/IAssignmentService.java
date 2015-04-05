package com.dixin.finance.product.service;

import com.dixin.finance.product.vo.AssignmentVO;

public interface IAssignmentService {
	
	/**
	 * 插入产品转让信息
	 * @param assignment
	 */
	public void insertAssignment(AssignmentVO assignment);
}
