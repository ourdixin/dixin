package com.dixin.finance.authentication.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.authentication.vo.AreaVO;

@MapperScan
public interface AreaMapper {
	
	
	List<AreaVO> query();
	
	List<AreaVO> findAreaById(int pid);
	
}
