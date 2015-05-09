package com.dixin.finance.product.service;

import java.util.List;


import com.dixin.finance.product.vo.PurchaseVO;

public interface IPurchaseService {

	public abstract List<PurchaseVO> queryPurchaseList(int userId,int profitType);
	public abstract PurchaseVO queryPurchase(int Id);
}
