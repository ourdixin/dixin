package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.ReservationProcessVO;
public interface IReservationProcessService {
	/**
	 * 插入预约进程信息
	 */
	public abstract void insert(ReservationProcessVO reservationProcess);
	/**
	 * 查询通过预约id
	 */
	public abstract List<ReservationProcessVO>  selectByreservationId(Integer reservationId);
}
