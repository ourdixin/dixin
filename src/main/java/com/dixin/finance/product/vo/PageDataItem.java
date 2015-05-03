package com.dixin.finance.product.vo;

import java.util.List;

import com.github.pagehelper.PageInfo;


public class PageDataItem {
	/**
	 * 
	 */
	private int id;
	
	private PageInfo<ProductVO> products;
	private PageInfo<PurchaseVO> purchaseList;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}	
	
	public PageInfo<ProductVO> getProducts() {
		return products;
	}
	
	public void setProducts(PageInfo<ProductVO> products) {
		this.products = products;
	}

	public PageInfo<PurchaseVO> getPurchaseList() {
		return purchaseList;
	}

	public void setPurchaseList(PageInfo<PurchaseVO> purchaseList) {
		this.purchaseList = purchaseList;
	}		
	
}
