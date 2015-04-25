package com.dixin.finance.authentication.service.impl;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.dixin.finance.authentication.dao.Financial_ManagerMapper;
import com.dixin.finance.authentication.service.IFmrService;
import com.dixin.finance.authentication.vo.FinancialManagerVO;

@Service
public class FmrServiceImpl implements IFmrService {
	@Resource
	private Financial_ManagerMapper fmMapper;

	@Override
	public FinancialManagerVO selectFmanager(int id) {
		List<FinancialManagerVO> fmanagers = fmMapper.queryFmanager(id);
		if(fmanagers.isEmpty()){
			return null;
		}
		FinancialManagerVO fmanager = fmanagers.get(0);
		return fmanager;
	}

	
}
