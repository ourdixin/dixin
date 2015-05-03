package com.dixin.finance.authentication.service.impl;


import java.util.List;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.authentication.dao.Financial_institutionMapper;
import com.dixin.finance.authentication.service.IFinService;
import com.dixin.finance.authentication.vo.Financial_institutionVO;

@Service
public class FinServiceImpl implements IFinService{
	@Resource
	private Financial_institutionMapper finMapper;

	@Override
	public void insert(Financial_institutionVO finVO) {
			
		if(finVO!=null){
			finMapper.insert(finVO);
		}
	}

	@Override
	public List<Financial_institutionVO> selectAll() {
		List<Financial_institutionVO> list = finMapper.query();
		if(list.isEmpty()){
			return null;
		}
		return list;
	}
	
	
}
