package com.dixin.finance.product.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.finance.product.constant.PayTypeConstant;
import com.dixin.finance.product.constant.ProductStateConstant;
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
	 * 发行结束时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date endDate;	
	
	/**
	 * 期限
	 */
	private int term;
	
	/**
	 * 期限单位 年/月/日
	 */
	private int termUnit;	
	
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
	 * C类份额
	 */
	private float partC;
	

	/**
	 * C类年化收益率
	 */
	private float rateC;
	
	/**
	 * D类份额
	 */
	private float partD;
	

	/**
	 * D类年化收益率
	 */
	private float rateD;	
	
	
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
	 * 其它利益分配方式，文字保存
	 */
	private String payTypeInfo;
		
	/**
	 * 文件
	 */
	private String adFile;
	private String guideFile;

	private int state;
	
	
	private int star;
	private int catogryId;
	private int profitId;
	private int bonusType;
	
	/**
	 * 投资方向
	 */	
	private int direction;
	
	/**
	 * 产品说明的html文档
	 */		
	private String info;
	
	/**
	 * 查看次数
	 */
	private int viewNum;
	
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
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public int getTermUnit() {
		return termUnit;
	}
	public void setTermUnit(int termUnit) {
		this.termUnit = termUnit;
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
	public String getPayTypeInfo() {
		if(payType >= PayTypeConstant.CALENDAR_QUARTER &&  payType < PayTypeConstant.OTHER)
			return PayTypeConstant.PayTypeString[payType - PayTypeConstant.CALENDAR_QUARTER];
		
		return payTypeInfo;
	}
	public void setPayTypeInfo(String payTypeInfo) {
		this.payTypeInfo = payTypeInfo;
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
		
		Date curdate = new Date();
		if( curdate.before(releaseDate))
			state = ProductStateConstant.OnBook;
		else if( curdate.after(endDate))
			state = ProductStateConstant.Sold;		
		else
			state = ProductStateConstant.OnSell;
		
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
	public float getPartD() {
		return partD;
	}
	public void setPartD(float partD) {
		this.partD = partD;
	}
	public float getRateD() {
		return rateD;
	}
	public void setRateD(float rateD) {
		this.rateD = rateD;
	}
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
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
