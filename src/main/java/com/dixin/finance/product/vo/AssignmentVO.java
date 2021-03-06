package com.dixin.finance.product.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;

public class AssignmentVO extends BaseVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date assign_date; //转让日期
	
	private double amount; //转让金额
	
	private ProductVO product; 
	
	//private int pay_type; //支付方式
	
	private String assign_type; //转让条件
	
	private String contactor; //联系人
	
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
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public UserVO getUser() {
		return user;
	}
	public void setUser(UserVO user) {
		this.user = user;
	}
	public Date getAssign_date() {
		return assign_date;
	}
	public void setAssign_date(Date assign_date) {
		this.assign_date = assign_date;
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
	
	public String getAssign_type() {
		return assign_type;
	}
	public void setAssign_type(String assign_type) {
		this.assign_type = assign_type;
	}
	public String getContactor() {
		return contactor;
	}
	public void setContactor(String contactor) {
		this.contactor = contactor;
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

}
