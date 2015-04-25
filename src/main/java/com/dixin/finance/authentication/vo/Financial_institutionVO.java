package com.dixin.finance.authentication.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
public class Financial_institutionVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private Integer id;//内部唯一ID
	private String name;//机构名称
	private String tel;//联系电话
	private String info;//简介
	private Integer catogry_id;//金融机构类别
	private Integer create_user;//创建人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date create_time;//创建时间
	
	private Integer update_user;//更新人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date update_time;//更新时间

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

	
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the tel
	 */
	public String getTel() {
		return tel;
	}

	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * @return the info
	 */
	public String getInfo() {
		return info;
	}

	/**
	 * @param info the info to set
	 */
	public void setInfo(String info) {
		this.info = info;
	}

	/**
	 * @return the catogry_id
	 */
	public Integer getCatogry_id() {
		return catogry_id;
	}

	/**
	 * @param catogry_id the catogry_id to set
	 */
	public void setCatogry_id(Integer catogry_id) {
		this.catogry_id = catogry_id;
	}

	/**
	 * @return the create_user
	 */
	public Integer getCreate_user() {
		return create_user;
	}

	/**
	 * @param create_user the create_user to set
	 */
	public void setCreate_user(Integer create_user) {
		this.create_user = create_user;
	}
	
	
}
