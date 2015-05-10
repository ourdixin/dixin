package com.dixin.finance.product.service.impl;

import java.util.List;

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
	
	
}
