package com.dixin.finance.product.service.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.AppointmentMapper;
import com.dixin.finance.product.service.IAppointmentService;
import com.dixin.finance.product.vo.AppointmentVO;


@Service("appointmentServiceImpl")
public class AppointmentServceImpl implements IAppointmentService {
	
	@Resource
	private AppointmentMapper appointmentMapper;

	@Override
	public void insertAppointment(AppointmentVO appointment) {
		appointmentMapper.insert(appointment);
	}

	@Override
	public List<AppointmentVO> queryAppointmentList() {
		return appointmentMapper.query();
	}

	@Override
	public List<AppointmentVO> queryUserAppointmentList(int userId) {
		return appointmentMapper.queryUserAppointmentList(userId);
	}

	@Override
	public List<AppointmentVO> queryAllAppointmentList() {
		return appointmentMapper.queryAllAppointmentList();
	}

	@Override
	public void setFirstContactId(Integer firstContactId, Integer appointmentId) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("firstContactId", firstContactId);
		map.put("appointmentId", appointmentId);
		appointmentMapper.setFirstContactId(map);
		
	}

	@Override
	public void setConstant(Integer reservationId, Integer Constant) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("reservationId", reservationId);
		map.put("Constant", Constant);
		appointmentMapper.setConstant(map);
		
	}

	@Override
	public void setPurchaseId(Integer reservationId, Integer purchaseId) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("reservationId", reservationId);
		map.put("purchaseId", purchaseId);
		appointmentMapper.setPurchaseId(map);
		
	}
	
	
}
