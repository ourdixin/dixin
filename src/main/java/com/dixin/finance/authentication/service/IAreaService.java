package com.dixin.finance.authentication.service;

import java.util.List;

import com.dixin.finance.authentication.vo.AreaVO;

public interface IAreaService {
	
	public List<AreaVO> getProvince();
	
	public AreaVO getCity(int pid);
}
