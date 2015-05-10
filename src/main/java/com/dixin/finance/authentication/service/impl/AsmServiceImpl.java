package com.dixin.finance.authentication.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.authentication.dao.AssessmentMapper ;
import com.dixin.finance.authentication.service.IAsmService;
import com.dixin.finance.authentication.vo.AssessmentVO;
@Service
public class AsmServiceImpl implements IAsmService{
	@Resource
	private AssessmentMapper assessmentMapper;
	@Override
	public void insert(AssessmentVO assessmentVO) {
		
		assessmentMapper.insert(assessmentVO);
	}

}
