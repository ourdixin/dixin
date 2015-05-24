package com.dixin.finance.product.service;

import java.util.List;
import com.dixin.finance.product.vo.ReservationProcessVO;
public interface IReservationProcessService {
	/**
	 * 插入预约进程信息
	 */
	public void insert(ReservationProcessVO reservationProcess);
}
