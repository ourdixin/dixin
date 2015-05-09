package com.dixin.finance.product.vo;


import java.util.Date;

import com.dixin.finance.authentication.vo.UserVO;
import org.springframework.format.annotation.DateTimeFormat;
import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.dixin.finance.product.constant.CustomerConstant;

public class MessageVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;//内部唯一ID
	private Integer msgId;//维护留言id
	private Integer userId;//用户id
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date msgTime;//留言时间
	
	private Integer catogryId;//留言问题分类
	private String msg;//留言内容
	private Integer lastMsgId;//最后一条留言Id;
	private Object lastMessage;//最后一条留言
	private int createUser;//创建人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date createTime;//创建时间
	private int updateUser;//更新人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date updateTime;//更新时间
	private UserVO userVO;// 用户
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
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

	/**
	 * @return the catogryId
	 */
	public Integer getCatogryId() {
		return catogryId;
	}

	/**
	 * @param catogryId the catogryId to set
	 */
	public void setCatogryId(Integer catogryId) {
		this.catogryId = catogryId;
	}
	
	/**
	 * 根据问题的分类返回对应的CATOGRY id
	 */
	public Integer switchToCatogryID(String selectOptions){
		Integer catogryId=0;
		for(int i=0;i<CustomerConstant.CustomerType.length;i++){
			if(selectOptions.equals(CustomerConstant.CustomerType[i])){
				catogryId = 74 + i;
			}
		}
		return catogryId;
		
	}

	/**
	 * @return the userVO
	 */
	public UserVO getUserVO() {
		return userVO;
	}

	/**
	 * @param userVO the userVO to set
	 */
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	/**
	 * @return the lastMsgId
	 */
	public Integer getLastMsgId() {
		return lastMsgId;
	}

	/**
	 * @param lastMsgId the lastMsgId to set
	 */
	public void setLastMsgId(Integer lastMsgId) {
		this.lastMsgId = lastMsgId;
	}

	/**
	 * @return the lastMessage
	 */
	public MessageVO getLastMessage() {
		return  (MessageVO)lastMessage;
	}

	/**
	 * @param lastMessage the lastMessage to set
	 */
	public void setLastMessage(MessageVO lastMessage) {
		this.lastMessage = lastMessage;
	}

	

	
	

}
