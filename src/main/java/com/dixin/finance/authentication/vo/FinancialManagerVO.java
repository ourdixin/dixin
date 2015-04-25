package com.dixin.finance.authentication.vo;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;
public class FinancialManagerVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;//内部ID
	private String info;//专属财务经理介绍
	private String title;//职务
	private String education;//学历
	private String certificate;//证书编号
	
	private Financial_institutionVO financialInstitution;//所属金融机构
	private String tel;//电话
	private Integer create_user;//创建人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date create_time;//创建时间
	
	private Integer update_user;//更新人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date update_time;//更新时间
	
	
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the update_user
	 */
	public Integer getUpdate_user() {
		return update_user;
	}

	/**
	 * @param update_user the update_user to set
	 */
	public void setUpdate_user(int update_user) {
		this.update_user = update_user;
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
	public void setCreate_user(int create_user) {
		this.create_user = create_user;
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
	 * @return the institution_id
	 */
	

	/**
	 * @return the certificate
	 */
	public String getCertificate() {
		return certificate;
	}

	/**
	 * @param certificate the certificate to set
	 */
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	/**
	 * @return the education
	 */
	public String getEducation() {
		return education;
	}

	/**
	 * @param education the education to set
	 */
	public void setEducation(String education) {
		this.education = education;
	}
	/**
	 * @return the create_time
	 */
	public Date getCreate_time(){
		return create_time;
	}
	/**
	 * @param create_time the create_time to set
	 */
	public void setCreate_time(Date create_time){
		this.create_time = create_time;
	}
	/**
	 * @return the update_time
	 */
	public Date getUpdate_time(){
		return update_time;
	}
	/**
	 * @param update_time the update_time to set
	 */
	public void setUpdate_time(Date update_time){
		this.update_time = update_time;
	}

	/**
	 * @return the financialInstitution
	 */
	public Financial_institutionVO getFinancialInstitution() {
		return financialInstitution;
	}

	/**
	 * @param financialInstitution the financialInstitution to set
	 */
	public void setFinancialInstitution(Financial_institutionVO financialInstitution) {
		this.financialInstitution = financialInstitution;
	}

	
}
