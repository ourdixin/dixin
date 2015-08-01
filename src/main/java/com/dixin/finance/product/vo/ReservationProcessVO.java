package com.dixin.finance.product.vo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

//import com.dixin.finance.product.constant.AppointmentConstant;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
public class ReservationProcessVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;//内部唯一id
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date date;//进程日期
	
	private AppointmentVO appointment;//预约
	private Integer state;//进程状态
	private String info;//说明
	private Integer createUser;//创建人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createTime;//创建时间
	private Integer updateUser;//更新人
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date updateTime;//更新时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public AppointmentVO getAppointment() {
		return appointment;
	}
	public void setAppointment(AppointmentVO appointment) {
		this.appointment = appointment;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Integer getCreateUser() {
		return createUser;
	}
	public void setCreateUser(Integer createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(Integer updateUser) {
		this.updateUser = updateUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}
