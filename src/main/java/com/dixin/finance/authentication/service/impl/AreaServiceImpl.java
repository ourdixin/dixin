package com.dixin.finance.authentication.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.authentication.dao.AreaMapper;
import com.dixin.finance.authentication.service.IAreaService;
import com.dixin.finance.authentication.vo.AreaVO;

@Service
public class AreaServiceImpl implements IAreaService {
	
	@Resource
	private AreaMapper areaMapper;
	
	

	@Override
	public List<AreaVO> getProvince() {
		return areaMapper.query();
	}

	@Override
	public List<AreaVO> getCity(int pid) {
		return areaMapper.findAreaById(pid);
	}

	public AreaMapper getAreaMapper() {
		return areaMapper;
	}

	public void setAreaMapper(AreaMapper areaMapper) {
		this.areaMapper = areaMapper;
	}

	
}
