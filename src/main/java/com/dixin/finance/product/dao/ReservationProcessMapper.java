package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.ReservationProcessVO;

@MapperScan
public interface ReservationProcessMapper {
	/**
	 * 插入预约进程信息
	 */
	public void insert(ReservationProcessVO reservationProcess);
}
