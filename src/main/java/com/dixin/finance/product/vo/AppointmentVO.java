package com.dixin.finance.product.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

//import com.dixin.finance.product.constant.AppointmentConstant;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;

public class AppointmentVO extends BaseVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	private int userId;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date reserve_date; //预计打款时间
	
	private double amount; //预约金额
	
	
	private ProductVO product; 
	
	private String msg; //联系人
	
	private String tel;  //电话
	
	private String createUser; // 创建人',
	private String updateUser; // 更新人',
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createTime; // 创建时间',
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date updateTime; // 更新时间',
	private UserVO user;//用户
	private PurchaseVO purchase;//购买
	private Integer constant;//预约状态
	private ContactRecordVO contact;//第一条联系记录
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the user
	 */
	public UserVO getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(UserVO user) {
		this.user = user;
	}
	/**
	 * @return the purchase
	 */
	public PurchaseVO getPurchase() {
		return purchase;
	}
	/**
	 * @param purchase the purchase to set
	 */
	public void setPurchase(PurchaseVO purchase) {
		this.purchase = purchase;
	}
	/**
	 * @return the constant
	 */
	public Integer getConstant() {
		return constant;
	}
	/**
	 * @param constant the constant to set
	 */
	public void setConstant(Integer constant) {
		this.constant = constant;
	}
	/**
	 * @return the contact
	 */
	public ContactRecordVO getContact() {
		return contact;
	}
	/**
	 * @param contact the contact to set
	 */
	public void setContact(ContactRecordVO contact) {
		this.contact = contact;
	}
	
	
	
}
