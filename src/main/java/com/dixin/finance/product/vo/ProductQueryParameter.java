/**
 * 
 */
package com.dixin.finance.product.vo;

import com.dixin.finance.product.constant.ProductTypeConstant;

/**
 * @author john
 *
 */
public class ProductQueryParameter {

	/**
	 * 
	 */
	private int pageNum = 1;
	
	/**
	 * 
	 */	
	private int pageSize = 10;
	
	/**
	 * 
	 */	
	private int productType = ProductTypeConstant.ALL;
	
	/**
	 * 
	 */	
	private	String  searchText;
	
	/**
	 * 
	 */	
	private	int  state=-1;	
	
	/**
	 * 投资起点
	 */	
	private	int  minAmount = -1;		
	
	/**
	 * 投资期限
	 */	
	private	int  term = -1;		
	
	/**
	 * 预期收益
	 */	
	private	int rate = -1;		
	
	/**
	 * 资金投向
	 */	
	private	int direction = -1;	
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(int minAmount) {
		this.minAmount = minAmount;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getDirection() {
		return direction;
	}

	public void setDirection(int direction) {
		this.direction = direction;
	}
	


}
