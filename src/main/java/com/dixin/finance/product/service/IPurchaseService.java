package com.dixin.finance.product.service;

import java.util.List;



import java.util.Map;

import com.dixin.finance.product.vo.PurchaseStatisticsVO;
import com.dixin.finance.product.vo.PurchaseVO;

public interface IPurchaseService {

	public abstract List<PurchaseVO> queryPurchaseList(int userId,int profitType,int productId);
	public abstract PurchaseVO queryPurchase(int Id);
	public abstract void addPurchase(PurchaseVO purchaseVo);
	public abstract List<PurchaseStatisticsVO> queryPurchaseStatistics();
	public abstract List<PurchaseVO> queryPurchaseDetails(int productId);
}
