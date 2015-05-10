package com.dixin.finance.authentication.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
public class AreaVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;//内部唯一ID
	private String name;//机构名称
	private Integer pid;//父id
	

	

	private Integer create_user;//创建人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date create_time;//创建时间
	
	private Integer update_user;//更新人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date update_time;//更新时间
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCreate_user() {
		return create_user;
	}

	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Integer getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(Integer update_user) {
		this.update_user = update_user;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
}
