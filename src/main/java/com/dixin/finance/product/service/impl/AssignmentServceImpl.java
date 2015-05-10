package com.dixin.finance.product.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.AssignmentMapper;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.vo.AssignmentVO;


@Service("assignmentServiceImpl")
public class AssignmentServceImpl implements IAssignmentService {
	
	@Resource
	private AssignmentMapper assignmentMapper;
	
	@Override
	public void insertAssignment(AssignmentVO assignment) {
		assignmentMapper.insert(assignment);
	}

	@Override
	public List<AssignmentVO> queryAssignmentList() {
		List<AssignmentVO> list = assignmentMapper.query();
		return list;
	}
	
	@Override
	public List<AssignmentVO> queryUserAssignmentList(int userId){
		List<AssignmentVO> list = assignmentMapper.queryUserAssignmentList(userId);
		return list;
	}
}
