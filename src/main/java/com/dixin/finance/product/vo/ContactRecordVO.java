package com.dixin.finance.product.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.finance.product.vo.AppointmentVO;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
public class ContactRecordVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;//内部唯一id
	private int contactId;//维护联系记录id
	private UserVO user;//用户
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date contactTime;//联系时间
	
	private String record;//联系记录
	private Object lastContactRecordVO;//最后一次联系内容
	private int createUser;//创建人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createTime;//创建时间
	private int updateUser;//更新人
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date updateTime;//更新时间


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getContactId() {
		return contactId;
	}


	public void setContactId(int contactId) {
		this.contactId = contactId;
	}


	public UserVO getUser() {
		return user;
	}


	public void setUser(UserVO user) {
		this.user = user;
	}


	public Date getContactTime() {
		return contactTime;
	}


	public void setContactTime(Date contactTime) {
		this.contactTime = contactTime;
	}


	public String getRecord() {
		return record;
	}


	public void setRecord(String record) {
		this.record = record;
	}


	public ContactRecordVO getLastContactRecordVO() {
		return (ContactRecordVO)lastContactRecordVO;
	}


	public void setLastContactRecordVO(ContactRecordVO lastContactRecordVO) {
		this.lastContactRecordVO = lastContactRecordVO;
	}

	public int getCreateUser() {
		return createUser;
	}


	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public int getUpdateUser() {
		return updateUser;
	}


	public void setUpdateUser(int updateUser) {
		this.updateUser = updateUser;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	

}
