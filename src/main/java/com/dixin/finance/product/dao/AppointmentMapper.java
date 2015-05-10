package com.dixin.finance.product.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.AppointmentVO;

@MapperScan
public interface AppointmentMapper {
	/**
	 * 插入产品预定信息
	 * @param assignment
	 */
	public void insert(AppointmentVO appointment);
	
	/**
	 * 查询产品预定信息
	 * @return 
	 */
	public List<AppointmentVO> query();
	
	/**
	 * 查询用户产品预定信息
	 * @return 
	 */
	public List<AppointmentVO> queryUserAppointmentList(int userId);	
}
