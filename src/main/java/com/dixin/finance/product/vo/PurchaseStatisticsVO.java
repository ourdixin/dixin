/**
 * 
 */
package com.dixin.finance.product.vo;


import com.dixin.framework.base.vo.BaseVO;


/**
 * @author john
 *
 */
public class PurchaseStatisticsVO extends BaseVO {
	private static final long serialVersionUID = 1L;
		
	private Integer userNum;	//购买用户数量
	private Integer volume;		//购买总份额
	private Double amount; 		//购买总金额

	private ProductVO product; 	//购买的产品
	private Integer productId;	

	public Integer getVolume() {
		return volume;
	}

	public void setVolume(Integer volume) {
		this.volume = volume;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public ProductVO getProduct() {
		return product;
	}

	public void setProduct(ProductVO product) {
		this.product = product;
	}
	
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getUserNum() {
		return userNum;
	}

	public void setUserNum(Integer userNum) {
		this.userNum = userNum;
	}
		
}
