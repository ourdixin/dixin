package com.dixin.finance.product.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.service.IReservationProcessService;
import com.dixin.finance.product.vo.ReservationProcessVO;
import com.dixin.finance.product.dao.ReservationProcessMapper;

@Service("reservationProcessServiceImpl")
public class ReservationProcessServiceImpl implements IReservationProcessService{
	@Resource
	private ReservationProcessMapper reservationProcessMapper;
	@Override
	public void insert(ReservationProcessVO reservationProcess) {
		
		if(reservationProcess!=null){
			reservationProcessMapper.insert(reservationProcess);
		}
	}
	@Override
	public List<ReservationProcessVO> selectByreservationId(
			Integer reservationId) {
		
		return  reservationProcessMapper.selectByreservationId(reservationId);
	}

}
