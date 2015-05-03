/**
 * 
 */
package com.dixin.finance.product.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author john
 *
 */
public class PurchaseVO extends BaseVO {
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private Integer userId;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date buyDate; //购买日期
	
	private Integer volume;	//购买份额
	private Double amount; //预约金额

	private ProductVO product; 	//购买的产品
	
	private Integer institutionId; //营销机构
	
	private Double pnl;	//浮动盈亏
	
	private String createUser=""; // 创建人',

	@DateTimeFormat(pattern="yyyy-MM-dd")//存日期时使用 
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")//取日期时使用 
	private Date createTime = new Date(); // 创建时间',
	
	private String updateUser=""; // 更新人',

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date updateTime= new Date(); // 更新时间',
		

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

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

	public Integer getInstitutionId() {
		return institutionId;
	}

	public void setInstitutionId(Integer institutionId) {
		this.institutionId = institutionId;
	}

	public Double getPnl() {
		return pnl;
	}

	public void setPnl(Double pnl) {
		this.pnl = pnl;
	}
	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	
}
