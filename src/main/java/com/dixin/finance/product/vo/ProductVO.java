package com.dixin.finance.product.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.format.annotation.DateTimeFormat;

import com.dixin.finance.product.constant.PayTypeConstant;
import com.dixin.finance.product.constant.ProductDirectionConstant;
import com.dixin.finance.product.constant.ProductSellStateConstant;
import com.dixin.finance.product.constant.ProductStatusConstant;
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
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone="GMT+8")
	private Date releaseDate=getDefalutInvalidDate();
	
	/**
	 * 发行结束时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone="GMT+8")
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
	
	
	private Integer star=ProductSellStateConstant.UNDERTERMINED;
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
			return ProductDirectionConstant.DirectionTypeString[direction - ProductDirectionConstant.FinacalMarket].Name;
		
		if(direction >= ProductDirectionConstant.Currency &&  direction <= ProductDirectionConstant.FOFund)
			return ProductDirectionConstant.DirectionTypeString[10 + direction - ProductDirectionConstant.Currency].Name;
		
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
	
	/**
	 * 产品认购费
	 */	
	private String buyFee ;
	
	/**
	 * 封闭期限
	 */	
	private Integer closeTerm = 0;	
	
	/**
	 * 封闭期限单位，年月日
	 */	
	private Integer closeTermUnit = 64;	
	
	/**
	 * 基金经理姓名
	 */	
	private String fundManager ;		
	
	/**
	 * 基金经理介绍的网页链接
	 */	
	private String fundManagerUrl;		
	
	/**
	 * 基金经理姓名HTML
	 */	
	private String fundManagerHtml ;	

	/**
	 * 管理费
	 */	
	private Float manageFee = 0F;		
	
	/**
	 * 开放日
	 */	
	private String openDay;		
	
	/**
	 * 业绩提成
	 */	
	private String bonus;		
	
	/**
	 * 退出费用
	 */	
	private String sellFee;		
	
	/**
	 * 产品期限状态
	 */	
	private Integer status = ProductStatusConstant.Status_Duration;	
	
	/**
	 * 是否推荐产品到首页，1为推荐到首页显示，0为默认不推荐
	 */	
	private Integer recommend = 0;

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
		TimeZone zone = TimeZone.getTimeZone("GMT+8");
		cal.setTimeZone(zone);
//		cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH));
//		cal.set(Calendar.HOUR_OF_DAY, 0);
//		cal.set(Calendar.MINUTE, 0);
//		cal.set(Calendar.SECOND, 0);
//		cal.set(Calendar.MILLISECOND, 0);
		Date curdate = cal.getTime();
		cal.setTime(releaseDate);
		if(releaseDate == null || cal.get(Calendar.YEAR) >= 2100)
			state = ProductSellStateConstant.UNDERTERMINED;
		else if( curdate.before(releaseDate))
			state = ProductSellStateConstant.OnBook;
		else if( curdate.after(endDate))
			state = ProductSellStateConstant.Sold;		
		else
			state = ProductSellStateConstant.OnSell;
		
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
	public String getProductType()
	{
		if(catogryId >=ProductTypeConstant.BOND && catogryId <= ProductTypeConstant.ASSET_MANAGEMENT )
			return ProductTypeConstant.ProductTypeString[catogryId - ProductTypeConstant.BOND];
		
		return ProductTypeConstant.ProductTypeString[2]; 
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
		
		if(rateD != 0 )
			rate = String.format("%.2f",rateA) + "% - " + String.format("%.2f",rateD) + "%";
		else if(rateC != 0 )
			rate = String.format("%.2f",rateA) + "% - " + String.format("%.2f",rateC) + "%";
		else if(rateB != 0 )
			rate = String.format("%.2f",rateA) + "% - " + String.format("%.2f",rateB) + "%";
		else if(rateA != 0 )
			rate = String.format("%.2f",rateA) + "%";
		else
			rate = "浮动";
		return rate;
	}
	public void setRate(String rate) {
		if(rate != null)
			this.rate = rate;
	}
	
	public Date getDefalutInvalidDate() {
		Calendar cal = Calendar.getInstance();
		TimeZone zone = TimeZone.getTimeZone("GMT+8");
		cal.setTimeZone(zone);
		cal.set(2100, 0, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}	
	
	public Date getInvalidDate() {

		return invalidDate;
	}
	public void setInvalidDate(Date invalidDate) {
		if(invalidDate != null)
			this.invalidDate = invalidDate;
	}
	public String getBuyFee() {
		return buyFee;
	}
	public void setBuyFee(String buyFee) {
		this.buyFee = buyFee;
	}
	public Integer getCloseTerm() {
		return closeTerm;
	}
	public void setCloseTerm(Integer closeTerm) {
		this.closeTerm = closeTerm;
	}
	public Integer getCloseTermUnit() {
		return closeTermUnit;
	}
	public void setCloseTermUnit(Integer closeTermUnit) {
		this.closeTermUnit = closeTermUnit;
	}
	public String getFundManager() {
		return fundManager;
	}
	public void setFundManager(String fundManager) {
		this.fundManager = fundManager;
	}
	public String getFundManagerUrl() {
		return fundManagerUrl;
	}
	public void setFundManagerUrl(String fundManagerUrl) {
		this.fundManagerUrl = fundManagerUrl;
	}
	
	public String getFundManagerHtml() {
		String strHtml = "";
		
		if(fundManager != null && fundManagerUrl != null)
		{
			String[]  fundManagerList = fundManager.split(",");
			String[]  urlList = fundManagerUrl.split(",");
			
			for(int i =0; i< fundManagerList.length ; i++)
			{
				if(!strHtml.isEmpty())
					strHtml += ",";
				if(i < urlList.length )
					strHtml += "<a href=\"" + urlList[i] + "\" target=\"_blank\"> " + fundManagerList[i] + "</a>";
				else
					strHtml += fundManagerList[i] ;
			}
		}
		
		if(strHtml.isEmpty())
			strHtml = fundManager;
		
		return strHtml;
	}
	public void setFundManagerHtml(String fundManagerHtml) {
		this.fundManagerHtml = fundManagerHtml;
	}	
	public Float getManageFee() {
		return manageFee;
	}
	public void setManageFee(Float manageFee) {
		this.manageFee = manageFee;
	}
	public String getOpenDay() {
		return openDay;
	}
	public void setOpenDay(String openDay) {
		this.openDay = openDay;
	}
	public String getBonus() {
		return bonus;
	}
	public void setBonus(String bonus) {
		this.bonus = bonus;
	}
	public String getSellFee() {
		return sellFee;
	}
	public void setSellFee(String sellFee) {
		this.sellFee = sellFee;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public Integer getRecommend() {
		return recommend;
	}
	
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	
	public boolean SetValue(String strValue,int nCol,int type){
		boolean bRet = true;
		switch(nCol) 
		{
			case 0:
				setCode(strValue); 
			break; 
			case 1:
				if(!strValue.isEmpty())
					setName(strValue);
				else
					bRet = false;
			break;
			case 2:
				if(!strValue.isEmpty())
					setReleaseDate(StringToDate(strValue));
				else
					setReleaseDate(this.getInvalidDate());
			break;	
			case 3:
				if(!strValue.isEmpty())
					setEndDate(StringToDate(strValue));
				else
					setEndDate(this.getInvalidDate());
			break;				
			
			default: 
				if(type == 42)
					bRet = SetFixValue(strValue,nCol);
				else if(type == 43)
					bRet = SetFloatValue(strValue,nCol);
				else
					bRet = false;
			break; 
		}
		
		return bRet;
	}
	
	private Date StringToDate(String strDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = getInvalidDate();
		if(!strDate.isEmpty()){
			try {
				TimeZone zone = TimeZone.getTimeZone("GMT+8");
				sdf.setTimeZone(zone);
				date = sdf.parse(strDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		return date;
	}

	
	private String getFloatFromString(String strValue){
		String strNumber = "";
		for(int i=0;i<strValue.length();i++){
			if(strValue.charAt(i)>='0' && strValue.charAt(i)<='9' || strValue.charAt(i) == '.'){
				strNumber+=strValue.charAt(i);
			}
			else
				break;
		}
		
		return strNumber;
	}
	
	private String getNumberFromString(String strValue){
		String strNumber = "";
		for(int i=0;i<strValue.length();i++){
			if(strValue.charAt(i)>='0' && strValue.charAt(i)<='9'){
				strNumber+=strValue.charAt(i);
			}
			else
				break;
		}
		
		return strNumber;
	}
	
	public boolean SetFixValue(String strValue,int nCol){
		boolean bRet = true;
		boolean bFind = false;
		switch(nCol) 
		{
			case 4:
				if(!strValue.isEmpty())
				{
					if(strValue.contains("年"))
						this.setTermUnit(63);
					else if(strValue.contains("月"))
						this.setTermUnit(64);
					else 
						this.setTermUnit(65);
					setTerm(Integer.valueOf(getNumberFromString(strValue))); 
				}
				else
					bRet = false;
			break; 
			case 5:
				if(!strValue.isEmpty())
				{
					if(strValue.contains("年"))
						this.setAppendTermUnit(63);
					else if(strValue.contains("月"))
						this.setAppendTermUnit(64);
					else 
						this.setAppendTermUnit(65);
					setAppendTerm(Integer.valueOf(getNumberFromString(strValue))); 
				}
			break;
			case 6:
				if(!strValue.isEmpty())
				{
					float value = Float.valueOf(getFloatFromString(strValue));
					if(value < 1)
						value *= 100;
					setRateA(value);
				}
				else
					bRet = false;
			break;			
			case 7:
				if(!strValue.isEmpty())
				{
					float value = Float.valueOf(getFloatFromString(strValue));
					if(value < 1)
						value *= 100;
					setRateB(value); 
				}
			break;			
			case 8:
				if(!strValue.isEmpty())
				{
					float value = Float.valueOf(getFloatFromString(strValue));
					if(value < 1)
						value *= 100;
					setRateC(Float.valueOf(getFloatFromString(strValue)));
				}
			break;	
			case 9:
				if(!strValue.isEmpty())
				{
					float value = Float.valueOf(getFloatFromString(strValue));
					if(value < 1)
						value *= 100;
					setRateD(Float.valueOf(getFloatFromString(strValue)));
				}
			break;				
			case 10:
				if(!strValue.isEmpty())
				{
					setPartA(Float.valueOf(getFloatFromString(strValue))*10000); 
					setMinAmount(Double.valueOf(getFloatFromString(strValue))*10000);
				}
				else
					bRet = false;
			break;			
			case 11:
				if(!strValue.isEmpty())
					setPartB(Float.valueOf(getFloatFromString(strValue))*10000); 
			break;			
			case 12:
				if(!strValue.isEmpty())
					setPartC(Float.valueOf(getFloatFromString(strValue))*10000);
			break;
			case 13:
				if(!strValue.isEmpty())
					setPartD(Float.valueOf(getFloatFromString(strValue))*10000);
			break;			
			case 14:
				if(!strValue.isEmpty())
					this.setAppendAmount(Double.valueOf(getFloatFromString(strValue))*10000);
			break;			
			case 15:
				if(!strValue.isEmpty())
					this.setAmount(Double.valueOf(getFloatFromString(strValue))*100000000);
				else
					this.setAmount(0d);
			break;			
			case 16:
				bFind = false;
				for(int i =0; i < ProductDirectionConstant.DirectionTypeString.length; ++i)
					if(strValue.contains(ProductDirectionConstant.DirectionTypeString[i].Name)){
						this.setDirection(ProductDirectionConstant.DirectionTypeString[i].Id);
						bFind = true;
						break;
					}
				if(!bFind)
				{
					this.setDirection(ProductDirectionConstant.Others);
					this.setDirectionInfo(strValue);
				}
			break;	
			case 17:
				bFind = false;
				for(int i =0; i < PayTypeConstant.PayTypeString.length; ++i)
					if(strValue.contains(PayTypeConstant.PayTypeString[i])){
						this.setPayType(i + PayTypeConstant.CALENDAR_QUARTER);
						bFind = true;
						break;
					}
				if(!bFind)
				{
					this.setPayType(PayTypeConstant.OTHER);
					this.setPayTypeInfo(strValue);
				}
			break;				
			case 18:
				if(!strValue.isEmpty())
					this.setStar(Integer.valueOf(getNumberFromString(strValue)));
				else
					this.setStar(1);
			break;			
			case 19:
				bFind = false;
				for(int i =0; i < ProductTypeConstant.ProductTypeString.length; ++i)
					if(strValue.contains(ProductTypeConstant.ProductTypeString[i])){
						this.setCatogryId(i + ProductTypeConstant.BOND);
						bFind = true;
						break;
					}
				if(!bFind)
				{
					bRet = false;
				}				
			break;		
			case 20:
				this.setAdFile(strValue);
			break;			
			case 21:
				this.setGuideFile(strValue);
			break;			
			default: 
				bRet = false;
			break; 
		}
		
		return bRet;		
	}
	
	public boolean SetFloatValue(String strValue,int nCol){
		boolean bRet = true;
		boolean bFind = false;
		switch(nCol) 
		{
			case 4:
				if(!strValue.isEmpty())
				{
					if(strValue.contains("年"))
						this.setCloseTermUnit(63);
					else if(strValue.contains("月"))
						this.setCloseTermUnit(64);
					else 
						this.setCloseTermUnit(65);
					setCloseTerm(Integer.valueOf(getNumberFromString(strValue))); 
				}
			break; 
			case 5:
				this.setOpenDay(strValue);
			break;			
			case 6:
				if(!strValue.isEmpty())
					this.setMinAmount(Double.valueOf(getFloatFromString(strValue))*10000);
				else
					bRet = false;
			break;			
			case 7:
				if(!strValue.isEmpty())
					this.setAppendAmount(Double.valueOf(getFloatFromString(strValue))*10000);
			break;			
			case 8:
				this.setBuyFee(strValue);
			break;			
			case 9:
				if(!strValue.isEmpty())
					this.setManageFee(Float.valueOf(getFloatFromString(strValue))*100);
				else
					this.setManageFee(0f);
			break;			
			case 10:
				this.setSellFee(strValue);
			break;			
			case 11:
				this.setBonus(strValue);
			break;
			case 12:
				this.setFundManager(strValue);
			break;			
			case 13:
				if(!strValue.isEmpty())
					this.setAmount(Double.valueOf(getFloatFromString(strValue))*100000000);
				else
					this.setAmount(0d);
			break;			
			case 14:
				bFind = false;
				for(int i =0; i < ProductDirectionConstant.DirectionTypeString.length; ++i)
					if(strValue.contains(ProductDirectionConstant.DirectionTypeString[i].Name)){
						this.setDirection(ProductDirectionConstant.DirectionTypeString[i].Id);
						bFind = true;
						break;
					}
				if(!bFind)
				{
					this.setDirection(ProductDirectionConstant.Others);
					this.setDirectionInfo(strValue);
				}
			break;	
			case 15:
				if(!strValue.isEmpty())
					this.setStar(Integer.valueOf(getNumberFromString(strValue)));
				else
					this.setStar(1);
			break;			
			case 16:
				bFind = false;
				for(int i =0; i < ProductTypeConstant.ProductTypeString.length; ++i)
					if(strValue.contains(ProductTypeConstant.ProductTypeString[i])){
						this.setCatogryId(i + ProductTypeConstant.BOND);
						bFind = true;
						break;
					}
				if(!bFind)
				{
					bRet = false;
				}
			break;		
			case 17:
				this.setAdFile(strValue);
			break;
			case 18:
				this.setGuideFile(strValue);
			break;	
			case 19:
				this.setFundManagerUrl(strValue);
			break;
			default: 
				bRet = false;
			break; 
		}
		
		return bRet;
	}	
	
}
