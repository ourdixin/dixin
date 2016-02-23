package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.PurchaseStatisticsVO;
import com.dixin.finance.product.vo.PurchaseVO;

@MapperScan
public interface PurchaseMapper {
	public List<PurchaseVO> queryPurchaseList(Map<String, Object> map);
	public PurchaseVO queryPurchase(int Id);
	public void addPurchase(PurchaseVO purchaseVo);
	public List<PurchaseStatisticsVO> queryPurchaseStatistics();
	public List<PurchaseStatisticsVO> queryHotPurchaseStatistics();
	public List<PurchaseVO> queryPurchaseDetails(int productId);
	public List<PurchaseVO> queryOrderList(int userId,int productId);
	public List<PurchaseVO> queryPurchaseProductList(Map<String, Object> map);
}
