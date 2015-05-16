package com.dixin.finance.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.ProductMapper;
import com.dixin.finance.product.dao.PurchaseMapper;
import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.finance.product.web.ProductController;

@Service("PurchaseServiceImpl")
public class PurchaseServiceImpl implements IPurchaseService {

	private static final Logger logger = LoggerFactory.getLogger(PurchaseServiceImpl.class);
	
	@Resource
	private PurchaseMapper purchaseMapper;	
	
	@Override
	public List<PurchaseVO> queryPurchaseList(int userId,int profitType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);	
		map.put("profitType", profitType);
		return purchaseMapper.queryPurchaseList(map);
	}

	@Override
	public PurchaseVO queryPurchase(int Id) {

		return purchaseMapper.queryPurchase(Id);
	}

	@Override
	public void addPurchase(PurchaseVO purchaseVo) {
		purchaseMapper.addPurchase(purchaseVo);
	}

}
