package com.dixin.finance.product.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.framework.base.vo.BaseVO;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 产品信息
 * 
 * @author Administrator
 * 
 */
public class ProductVO extends BaseVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private String id;
	
	/**
	 * 产品代码
	 */
	private String code;
	
	/**
	 * 产品名称
	 */
	private String name;
	
	/**
	 * 发行时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date releaseDate;
	
	/**
	 * 期限
	 */
	private int term;
	
	/**
	 * A类份额
	 */
	private float partA;
	
	/**
	 * A类年华收益率
	 */
	private float rateA;
	
	/**
	 * B类份额
	 */
	private float partB;
	
	/**
	 * B类年化收益率
	 */
	private float rateB;
	
	/**
	 * B类份额
	 */
	private float partC;
	

	/**
	 * B类年化收益率
	 */
	private float rateC;
	
	/**
	 * 产品规模
	 */
	private double amount;
	
	/**
	 * 投资起点
	 */
	private double minAmount;
	
	/**
	 * 利益分配方式
	 */
	private int payType;
	
	/**
	 * 
	 */
	private String adFile;
	private String guideFile;

	private int state;
	private int star;
	private int catogryId;
	private int profitId;
	private int bonusType;
	private int direction;
	private String info;
	
	private String createUser; // 创建人',

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createTime; // 创建时间',
	private String updateUser; // 更新人',

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date updateTime; // 更新时间',
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public float getPartA() {
		return partA;
	}
	public void setPartA(float partA) {
		this.partA = partA;
	}
	public float getRateA() {
		return rateA;
	}
	public void setRateA(float rateA) {
		this.rateA = rateA;
	}
	public float getPartB() {
		return partB;
	}
	public void setPartB(float partB) {
		this.partB = partB;
	}
	public float getRateB() {
		return rateB;
	}
	public void setRateB(float rateB) {
		this.rateB = rateB;
	}

	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getMinAmount() {
		return minAmount;
	}
	public void setMinAmount(double minAmount) {
		this.minAmount = minAmount;
	}
	public int getPayType() {
		return payType;
	}
	public void setPayType(int payType) {
		this.payType = payType;
	}
	public String getAdFile() {
		return adFile;
	}
	public void setAdFile(String adFile) {
		this.adFile = adFile;
	}
	public String getGuideFile() {
		return guideFile;
	}
	public void setGuideFile(String guideFile) {
		this.guideFile = guideFile;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getCatogryId() {
		return catogryId;
	}
	public void setCatogryId(int catogryId) {
		this.catogryId = catogryId;
	}
	public int getProfitId() {
		return profitId;
	}
	public void setProfitId(int profitId) {
		this.profitId = profitId;
	}
	public int getBonusType() {
		return bonusType;
	}
	public void setBonusType(int bonusType) {
		this.bonusType = bonusType;
	}
	public int getDirection() {
		return direction;
	}
	public void setDirection(int direction) {
		this.direction = direction;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public float getPartC() {
		return partC;
	}
	public void setPartC(float partC) {
		this.partC = partC;
	}
	public float getRateC() {
		return rateC;
	}
	public void setRateC(float rateC) {
		this.rateC = rateC;
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
