package com.dixin.finance.product.vo;

import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.finance.product.constant.PayTypeConstant;
import com.dixin.finance.product.constant.ProductDirectionConstant;
import com.dixin.finance.product.constant.ProductStateConstant;
import com.dixin.finance.product.constant.ProductTypeConstant;
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
	private String code="";
	
	/**
	 * 产品名称
	 */
	private String name="";
	
	/**
	 * 发行时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm")
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone="GMT+8")
	private Date releaseDate=getDefalutInvalidDate();
	
	/**
	 * 发行结束时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date endDate = getDefalutInvalidDate();	
	
	/**
	 * 产品是否可以延期
	 */
	private Boolean bDelay = false;
	
	/**
	 * 延期条件
	 */
	private String delayCondition;	
	
	/**
	 * 延期期限
	 */
	private Integer delayTerm=0;	
	
	/**
	 * 延期期限单位
	 */
	private Integer delayTermUnit=64;	
	

	/**
	 * 无效时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date invalidDate = getDefalutInvalidDate();
	
	/*
	 * 续存期限
	 */
	private Integer appendTerm = 0;
	

	/**
	 * 续存期限单位  年/月/日
	 */
	private Integer appendTermUnit = 64; //月	
	

	/*
	 * 期限
	 */
	private Integer term = 0;
	

	/**
	 * 期限单位 年/月/日
	 */
	private Integer termUnit = 64; //月		
	
	
	private String rate= "";
	
	/**
	 * A类份额
	 */
	private Float partA = 0f;
	
	/**
	 * A类年华收益率
	 */
	private Float rateA = 0f;
	
	/**
	 * B类份额
	 */
	private Float partB = 0f;
	
	/**
	 * B类年化收益率
	 */
	private Float rateB = 0f;
	
	/**
	 * C类份额
	 */
	private Float partC = 0f;
	

	/**
	 * C类年化收益率
	 */
	private Float rateC = 0f;
	
	/**
	 * D类份额
	 */
	private Float partD = 0f;
	

	/**
	 * D类年化收益率
	 */
	private Float rateD = 0f;	
	
	
	/**
	 * 产品规模
	 */
	private Double amount = 0d;
	
	/**
	 * 投资起点
	 */
	private Double minAmount = 0d;
	
	/**
	 * 投资追加金额
	 */
	private Double appendAmount = 0d;	
	
	/**
	 * 利益分配方式
	 */
	private Integer payType = 0;
	
	/**
	 * 其它利益分配方式，文字保存
	 */
	private String payTypeInfo="";
		
	/**
	 * 文件
	 */
	private String adFile="";
	private String guideFile="";

	private Integer state=0;
	
	
	private Integer star=ProductStateConstant.UNDERTERMINED;
	private Integer catogryId=ProductTypeConstant.BOND;
	private Integer profitId=0;
	private Integer bonusType=0;
	
	/**
	 * 投资方向
	 */	
	private Integer direction = ProductDirectionConstant.FinacalMarket;
	private String directionInfo = "";
	public String getDirectionInfo() {
		if(direction >= ProductDirectionConstant.FinacalMarket &&  direction < ProductDirectionConstant.Others)
			return ProductDirectionConstant.DirectionTypeString[direction - ProductDirectionConstant.FinacalMarket];
		
		return directionInfo;
	}
	public void setDirectionInfo(String directionInfo) {
		this.directionInfo = directionInfo;
	}
	/**
	 * 产品说明的html文档
	 */		
	private String info="";
	
	/**
	 * 查看次数
	 */
	private Integer viewNum = 0;
	
	private String createUser=""; // 创建人',

	@DateTimeFormat(pattern="yyyy-MM-dd")//存日期时使用 
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")//取日期时使用 
	private Date createTime = new Date(); // 创建时间',
	private String updateUser=""; // 更新人',

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date updateTime= new Date(); // 更新时间',
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		if(id !=null)
			this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		if(code !=null)
			this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(name !=null)
			this.name = name;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		if(releaseDate !=null)
			this.releaseDate = releaseDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		if(endDate !=null)
			this.endDate = endDate;
	}
	
	public Boolean getbDelay() {
		return bDelay;
	}
	
	public void setbDelay(Boolean bDelay) {
		this.bDelay = bDelay;
	}
	
	public String getDelayCondition() {
		return delayCondition;
	}
	
	public void setDelayCondition(String delayCondition) {
		this.delayCondition = delayCondition;
	}
	
	public Integer getDelayTerm() {
		return delayTerm;
	}
	
	public void setDelayTerm(Integer delayTerm) {
		this.delayTerm = delayTerm;
	}
	
	public Integer getDelayTermUnit() {
		return delayTermUnit;
	}
	
	public void setDelayTermUnit(Integer delayTermUnit) {
		this.delayTermUnit = delayTermUnit;
	}	
	
	public int getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		if(term !=null)
			this.term = term;
	}
	public int getTermUnit() {
		return termUnit;
	}
	public void setTermUnit(Integer termUnit) {
		if(termUnit !=null)
			this.termUnit = termUnit;
	}
	
	public Integer getAppendTerm() {
		return appendTerm;
	}
	
	public void setAppendTerm(Integer appendTerm) {
		this.appendTerm = appendTerm;
	}
	
	public Integer getAppendTermUnit() {
		return appendTermUnit;
	}
	
	public void setAppendTermUnit(Integer appendTermUnit) {
		this.appendTermUnit = appendTermUnit;
	}
	
	public float getPartA() {
		return partA;
	}
	public void setPartA(Float partA) {
		if(partA !=null)
			this.partA = partA;
	}
	public float getRateA() {
		return rateA;
	}
	public void setRateA(Float rateA) {
		if(rateA != null)
			this.rateA = rateA;
	}
	public float getPartB() {
		return partB;
	}
	public void setPartB(Float partB) {
		if(partB != null)
			this.partB = partB;
	}
	public float getRateB() {
		return rateB;
	}
	public void setRateB(Float rateB) {
		if(rateB != null)
			this.rateB = rateB;
	}

	public double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		if(amount != null)
			this.amount = amount;
	}
	public double getMinAmount() {
		return minAmount;
	}
	public void setMinAmount(Double minAmount) {
		if(minAmount != null)
			this.minAmount = minAmount;
	}
	public Double getAppendAmount() {
		return appendAmount;
	}
	public void setAppendAmount(Double appendAmount) {
		this.appendAmount = appendAmount;
	}
	
	public int getPayType() {
		return payType;
	}
	public void setPayType(Integer payType) {
		if(payType != null)
			this.payType = payType;
	}
	public String getPayTypeInfo() {
		if(payType >= PayTypeConstant.CALENDAR_QUARTER &&  payType < PayTypeConstant.OTHER)
			return PayTypeConstant.PayTypeString[payType - PayTypeConstant.CALENDAR_QUARTER];
		
		return payTypeInfo;
	}
	public void setPayTypeInfo(String payTypeInfo) {
		if(payTypeInfo != null)
			this.payTypeInfo = payTypeInfo;
	}
	public String getAdFile() {
		return adFile;
	}
	public void setAdFile(String adFile) {
		if(adFile != null)
			this.adFile = adFile;
	}
	public String getGuideFile() {
		return guideFile;
	}
	public void setGuideFile(String guideFile) {
		if(guideFile != null)
			this.guideFile = guideFile;
	}
	public int getState() {
	
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date curdate = cal.getTime();
		cal.setTime(releaseDate);
		if(releaseDate == null || cal.get(Calendar.YEAR) >= 2100)
			state = ProductStateConstant.UNDERTERMINED;
		else if( curdate.before(releaseDate))
			state = ProductStateConstant.OnBook;
		else if( curdate.after(endDate))
			state = ProductStateConstant.Sold;		
		else
			state = ProductStateConstant.OnSell;
		
		return state;
	}
	public void setState(Integer state) {
		if(state != null)
			this.state = state;
	}
	public int getStar() {
		return star;
	}
	public void setStar(Integer star) {
		if(star != null)
			this.star = star;
	}
	public int getCatogryId() {
		return catogryId;
	}
	public void setCatogryId(Integer catogryId) {
		if(catogryId != null)
			this.catogryId = catogryId;
	}
	public int getProfitId() {
		return profitId;
	}
	public void setProfitId(Integer profitId) {
		if(profitId != null)
			this.profitId = profitId;
	}
	public int getBonusType() {
		return bonusType;
	}
	public void setBonusType(Integer bonusType) {
		if(bonusType != null)
			this.bonusType = bonusType;
	}
	public int getDirection() {
		return direction;
	}
	public void setDirection(Integer direction) {
		if(direction != null)
			this.direction = direction;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		if(info != null)
			this.info = info;
	}
	public float getPartC() {
		return partC;
	}
	public void setPartC(Float partC) {
		if(partC != null)
			this.partC = partC;
	}
	public float getRateC() {
		return rateC;
	}
	public void setRateC(Float rateC) {
		if(rateC != null)
			this.rateC = rateC;
	}
	public float getPartD() {
		return partD;
	}
	public void setPartD(Float partD) {
		if(partD != null)
			this.partD = partD;
	}
	public float getRateD() {
		return rateD;
	}
	public void setRateD(Float rateD) {
		if(rateD != null)
			this.rateD = rateD;
	}
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(Integer viewNum) {
		if(viewNum != null)
			this.viewNum = viewNum;
	}	
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		if(createUser != null)
			this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		if(createTime != null)
			this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		if(updateUser != null)
			this.updateUser = updateUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		if(updateTime != null)
			this.updateTime = updateTime;
	}
	public String getRate() {
		
		if(partD != 0 )
			rate = String.format("%.2f",rateA*100) + "% - " + String.format("%.2f",rateD*100) + "%";
		else if(partC != 0 )
			rate = String.format("%.2f",rateA*100) + "% - " + String.format("%.2f",rateC*100) + "%";
		else if(partB != 0 )
			rate = String.format("%.2f",rateA*100) + "% - " + String.format("%.2f",rateB*100) + "%";
		else
			rate = String.format("%.2f",rateA*100) + "%";
		
		return rate;
	}
	public void setRate(String rate) {
		if(rate != null)
			this.rate = rate;
	}
	
	public Date getDefalutInvalidDate() {
		Calendar cal = Calendar.getInstance();
		cal.set(2100, 0, 1);
		return cal.getTime();
	}	
	
	public Date getInvalidDate() {

		return invalidDate;
	}
	public void setInvalidDate(Date invalidDate) {
		if(invalidDate != null)
			this.invalidDate = invalidDate;
	}

}
