package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;
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
	/**
	 * 后台查看所有产品预定信息
	 */
	public List<AppointmentVO> queryAllAppointmentList();
	/**
	 * 设置第一条留言id
	 */
	public void setFirstContactId(Map<String,Integer> map);
	/**
	 * 设置购买状态
	 */
	public void setConstant(Map<String,Integer> map);
	/**
	 * 设置购买id
	 */
	public void setPurchaseId(Map<String,Integer> map);
}
