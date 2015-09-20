package com.dixin.finance.authentication.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.framework.base.vo.BaseVO;
import com.dixin.framework.tools.ApplicationUtil;
import com.fasterxml.jackson.annotation.JsonFormat;

@Component
public class UserVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	@Resource(name="PurchaseServiceImpl")
	private IPurchaseService purchaseServiceImpl = (IPurchaseService) ApplicationUtil.getBean("PurchaseServiceImpl");		
	
	private int id; // 内部唯一ID
	private String userName; // 用户名
	private String secUserName;
	private String password; // 密码
	private int userType; // 是客户还是后台管理用户
	private int enabled; // 是否有效
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate; // 注册日期
	private String name; // 姓名
	private String mobile; // 手机号
	private int areaId;
	private AreaVO area; // 地区ID
	private String address; // 地址
	private String zipCode; // 邮编
	private String qq; // QQ号码
	private String idCard; // 身份证照片
	private String account; // 资金账号
	private int institutionId;

	private Financial_institutionVO financialInstitution; // 证券公司
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date startDate; // 认证开始日期
	private int term; // 期限

	private int authType=-1; // 认证类别
	private int fmId;	//财务经理ID
	private FinancialManagerVO fmanagerVO;//财富经理id;	
	
	private int isRiskTested;
	
	private int createUser; // 创建人
	
	private Double pnl=0d; //计算本人的盈利情况

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date createTime; // 创建时间
	private int updateUser; // 更新人
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date updateTime; // 更新时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSecUserName() {
		if(mobile != null && mobile.length() >=8)
		{
			secUserName = mobile.substring(0, 3);
			secUserName+= "****" + mobile.substring(mobile.length() - 4);
		}
		return secUserName;
	}	
	public void setSecUserName(String secUserName) {
		this.secUserName = secUserName;
	}	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public AreaVO getArea() {
		return area;
	}
	public void setArea(AreaVO area) {
		this.area = area;
	}
	public Financial_institutionVO getFinancialInstitution() {
		return financialInstitution;
	}
	public void setFinancialInstitution(Financial_institutionVO financialInstitution) {
		this.financialInstitution = financialInstitution;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public int getAuthType() {
		return authType;
	}
	public void setAuthType(int authType) {
		this.authType = authType;
	}
	
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
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
	
	public int getFmId()
	{
		if(fmanagerVO != null)
			return fmanagerVO.getId();
		
		return fmId;
	}
	public void setFmId(int fmId) {
		this.fmId = fmId;
	}
	/**
	 * @return the fmanagerVO
	 */
	public FinancialManagerVO getFmanagerVO() {
		return fmanagerVO;
	}
	/**
	 * @param fmanagerVO the fmanagerVO to set
	 */
	public void setFmanagerVO(FinancialManagerVO fmanagerVO) {
		this.fmanagerVO = fmanagerVO;
	}
	
	public int getInstitutionId() {
		return institutionId;
	}
	public void setInstitutionId(int institutionId) {
		this.institutionId = institutionId;
	}
	
	public int getIsRiskTested() {
		return isRiskTested;
	}
	
	public void setIsRiskTested(int isRiskTested) {
		this.isRiskTested = isRiskTested;
	}
	
	public Map<String,Double> getPnl() {
		Map<String,Double> userPnl = new HashMap<String,Double>();
		Double pnl = 0d;
		Double amount = 0d;
		
		List<PurchaseVO> purchaseList = purchaseServiceImpl.queryPurchaseList(id, -1, -1, -1);
		Map<String,List<PurchaseVO>> productMap=new HashMap<String,List<PurchaseVO>>();
		
		for(int i =0; i < purchaseList.size();++i)
		{
			PurchaseVO PurchaseItem = purchaseList.get(i);
			String key = PurchaseItem.getProduct().getId();
			if(!productMap.containsKey(key))
			{
				List<PurchaseVO> PurchaseList= new ArrayList<PurchaseVO>();
				productMap.put(key, PurchaseList);
			}
			
			productMap.get(key).add(PurchaseItem);
		}
		
		for(Map.Entry<String, List<PurchaseVO>> entry:productMap.entrySet()){    
			userPnl = entry.getValue().get(0).getProduct().getUserPnlByPurchaseList(id,entry.getValue());
			pnl += userPnl.get("pnl");
			amount += userPnl.get("amount");
		}   
		
		if(amount < 0 )
			amount = 0d;
		
		userPnl.put("pnl", pnl);
		userPnl.put("amount", amount);
		
		return userPnl;
	}

	public void setPnl(Double pnl) {
		this.pnl = pnl;
	}

}
