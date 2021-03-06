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
import com.dixin.finance.product.vo.ProductInfoVO;
import com.dixin.finance.product.vo.PurchaseStatisticsVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.finance.product.web.ProductController;

@Service("PurchaseServiceImpl")
public class PurchaseServiceImpl implements IPurchaseService {

	private static final Logger logger = LoggerFactory.getLogger(PurchaseServiceImpl.class);
	
	@Resource
	private PurchaseMapper purchaseMapper;	
	
	@Override
	public List<PurchaseVO> queryPurchaseList(int userId,int profitType,int status,int productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);	
		map.put("productId", productId);	
		map.put("profitType", profitType);
		map.put("status", status);
		return purchaseMapper.queryPurchaseList(map);
	}

	@Override
	public PurchaseVO queryPurchase(int Id) {

		return purchaseMapper.queryPurchase(Id);
	}

	public void addPurchase(PurchaseVO purchaseVo) {
		purchaseMapper.addPurchase(purchaseVo);
	}

	@Override
	public List<PurchaseStatisticsVO> queryPurchaseStatistics() {
		return purchaseMapper.queryPurchaseStatistics();
	}
	
	@Override
	public List<PurchaseStatisticsVO> queryHotPurchaseStatistics() {
		return purchaseMapper.queryHotPurchaseStatistics();
	}
	
	@Override
	public List<PurchaseVO> queryPurchaseDetails(int productId) {
		
		return purchaseMapper.queryPurchaseDetails(productId);
	}

	@Override
	public List<PurchaseVO> queryOrderList(int userId, int productId) {

		return purchaseMapper.queryOrderList(userId,productId);
	}

	@Override
	public List<PurchaseVO> queryPurchaseProductList(int userId,
			int profitType, int status, int productId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);	
		map.put("productId", productId);	
		map.put("profitType", profitType);
		map.put("status", status);
		return purchaseMapper.queryPurchaseProductList(map);
	}

	@Override
	public void setUserProductStatus(int userId, int productId,int status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);	
		map.put("productId", productId);	
		map.put("status", status);
		purchaseMapper.setUserProductStatus(map);
	}

}
