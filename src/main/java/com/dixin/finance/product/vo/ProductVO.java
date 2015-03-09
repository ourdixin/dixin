package com.dixin.finance.product.vo;

import java.util.Date;

import com.dixin.framework.base.vo.BaseVO;

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
	private Date releaseDate;
	
	/**
	 * 期限
	 */
	private int term;
	
	/**
	 * A类份额
	 */
	private float percentA;
	
	/**
	 * A类年华收益率
	 */
	private float rateA;
	
	/**
	 * B类份额
	 */
	private float percentB;
	
	/**
	 * B类年化收益率
	 */
	private float rateB;
	
	/**
	 * 产品规模
	 */
	private double amount;
	
	/**
	 * 投资起点
	 */
	private double minaMount;
	
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
	private String info;
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
	public float getPercentA() {
		return percentA;
	}
	public void setPercentA(float percentA) {
		this.percentA = percentA;
	}
	public float getRateA() {
		return rateA;
	}
	public void setRateA(float rateA) {
		this.rateA = rateA;
	}
	public float getPercentB() {
		return percentB;
	}
	public void setPercentB(float percentB) {
		this.percentB = percentB;
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
	public double getMinaMount() {
		return minaMount;
	}
	public void setMinaMount(double minaMount) {
		this.minaMount = minaMount;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
