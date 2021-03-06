package com.dixin.finance.product.service;

import java.util.List;



import java.util.Map;

import com.dixin.finance.product.vo.ProductInfoVO;
import com.dixin.finance.product.vo.PurchaseStatisticsVO;
import com.dixin.finance.product.vo.PurchaseVO;

public interface IPurchaseService {

	public abstract List<PurchaseVO> queryPurchaseList(int userId,int profitType,int status,int productId);
	public abstract List<PurchaseVO> queryPurchaseProductList(int userId,int profitType,int status,int productId);
	public abstract PurchaseVO queryPurchase(int Id);
	public abstract void addPurchase(PurchaseVO purchaseVo);
	public abstract List<PurchaseStatisticsVO> queryPurchaseStatistics();
	public abstract List<PurchaseStatisticsVO> queryHotPurchaseStatistics();
	public abstract List<PurchaseVO> queryPurchaseDetails(int productId);
	public abstract List<PurchaseVO> queryOrderList(int userId,int productId);
	public abstract void setUserProductStatus(int userid,int productid, int status);
}
