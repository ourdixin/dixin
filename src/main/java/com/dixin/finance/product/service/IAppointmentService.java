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
	/**
	 * 后台查询所有预约信息
	 */
	public List<AppointmentVO> queryAllAppointmentList();
	/**
	 *  设置第一条留言id
	 */
	public void setFirstContactId(Integer firstContactId,Integer appointmentId);
	/**
	 * 设置状态
	 */
	public void setConstant(Integer reservationId,Integer Constant);
	/**
	 * 设置购买id
	 */
	public void setPurchaseId(Integer reservationId,Integer purchaseId );
}
