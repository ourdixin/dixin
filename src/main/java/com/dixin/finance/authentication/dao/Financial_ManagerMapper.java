package com.dixin.finance.authentication.dao;


import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import com.dixin.finance.authentication.vo.FinancialManagerVO;


@MapperScan
public interface Financial_ManagerMapper {
	/**
	 * @user_id
	 * 根据当前用户ID查询他的专属财富经理
	 */
	List<FinancialManagerVO> queryFmanager(int id);

}
