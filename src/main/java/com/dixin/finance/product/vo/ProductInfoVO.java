package com.dixin.finance.product.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.finance.product.constant.InfoTypeConstant;
import com.dixin.finance.product.constant.PayTypeConstant;
import com.dixin.finance.product.constant.ProductDirectionConstant;
import com.dixin.finance.product.constant.ProductSellStateConstant;
import com.dixin.finance.product.constant.ProductStatusConstant;
import com.dixin.finance.product.constant.ProductTypeConstant;
import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 产品历史信息信息
 * 
 * @author Administrator
 * 
 */
public class ProductInfoVO extends BaseVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private Integer id = -1;

	/**
	 * 产品id
	 */
	private Integer productID = -1;
	
	/**
	 * 发布时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date infoDate;
	
	/**
	 * 信息类型
	 */
	private Integer infoType= -1;
	
	/**
	 * 信息数据
	 */
	private Float value = 0f;	
	
	
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

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Date getInfoDate() {
		return infoDate;
	}

	public void setInfoDate(Date infoDate) {
		this.infoDate = infoDate;
	}

	public Integer getInfoType() {
		return infoType;
	}

	public void setInfoType(Integer infoType) {
		this.infoType = infoType;
	}

	public Float getValue() {
		return value;
	}

	public void setValue(Float value) {
		this.value = value;
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
