package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.AppointmentVO;

public interface IAppointmentService {
	
	/**
	 * 插入产品预定
	 * @param appointment
	 */
	public void insertAppointment(AppointmentVO appointment);
	
	/**
	 * 查询产品预定信息
	 * @return
	 */
	public List<AppointmentVO> queryAppointmentList();
	
	/**
	 * 查询用户产品预定信息
	 * @return
	 */
	public List<AppointmentVO> queryUserAppointmentList(int userId);	
}
