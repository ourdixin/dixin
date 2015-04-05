package com.dixin.finance.product.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.AssignmentMapper;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.vo.AssignmentVO;
@Service
public class AssignmentServceImpl implements IAssignmentService {
	
	@Resource
	private AssignmentMapper assignmentMapper;
	
	@Override
	public void insertAssignment(AssignmentVO assignment) {
		assignmentMapper.insert(assignment);
	}

}
