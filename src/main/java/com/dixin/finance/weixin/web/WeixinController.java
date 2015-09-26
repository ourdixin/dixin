package com.dixin.finance.weixin.web;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dixin.finance.authentication.service.IAreaService;
import com.dixin.finance.authentication.service.IAsmService;
import com.dixin.finance.authentication.service.IFinService;
import com.dixin.finance.authentication.service.IFmrService;
import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.service.IAppointmentService;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.vo.AppointmentVO;
import com.dixin.finance.product.vo.ContactRecordVO;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.finance.weixin.constant.WeixinConstant;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;

/**
 * 微信后台
 *
 */
@Controller
public class WeixinController {

	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);

	@Resource
	private IUserService userServiceImpl;

	@Resource
	private ISmsService smsServiceImpl;

	@Resource
	private IFmrService fmrServiceImpl;

	@Resource
	private IAsmService asmServiceImpl;

	@Resource
	private IFinService finServiceImpl;

	@Resource
	private IMessageService messageServiceImpl;

	@Resource
	private IAreaService areaServiceImpl;

	@Resource
	private IPurchaseService PurchaseServiceImpl;
	
	@Resource(name="appointmentServiceImpl")
	private IAppointmentService appointmentService;
	
	@Resource(name="productServiceImpl")
	private IProductService productService;

	public IProductService getProductService() {
		return productService;
	}

	public void setProductService(IProductService productService) {
		this.productService = productService;
	}

	public IAppointmentService getAppointmentService() {
		return appointmentService;
	}

	public void setAppointmentService(IAppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}

	public IPurchaseService getPurchaseServiceImpl() {
		return PurchaseServiceImpl;
	}

	public void setPurchaseServiceImpl(IPurchaseService purchaseServiceImpl) {
		PurchaseServiceImpl = purchaseServiceImpl;
	}

	public IUserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(IUserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	public ISmsService getSmsServiceImpl() {
		return smsServiceImpl;
	}

	public void setSmsServiceImpl(ISmsService smsServiceImpl) {
		this.smsServiceImpl = smsServiceImpl;
	}

	public IFmrService getFmrServiceImpl() {
		return fmrServiceImpl;
	}

	public void setFmrServiceImpl(IFmrService fmrServiceImpl) {
		this.fmrServiceImpl = fmrServiceImpl;
	}

	public IAsmService getAsmServiceImpl() {
		return asmServiceImpl;
	}

	public void setAsmServiceImpl(IAsmService asmServiceImpl) {
		this.asmServiceImpl = asmServiceImpl;
	}

	public IFinService getFinServiceImpl() {
		return finServiceImpl;
	}

	public void setFinServiceImpl(IFinService finServiceImpl) {
		this.finServiceImpl = finServiceImpl;
	}

	public IMessageService getMessageServiceImpl() {
		return messageServiceImpl;
	}

	public void setMessageServiceImpl(IMessageService messageServiceImpl) {
		this.messageServiceImpl = messageServiceImpl;
	}

	public IAreaService getAreaServiceImpl() {
		return areaServiceImpl;
	}

	public void setAreaServiceImpl(IAreaService areaServiceImpl) {
		this.areaServiceImpl = areaServiceImpl;
	}

	void ShowParameter(HttpServletRequest request)
	{
		String qs = request.getQueryString();
		logger.info("QueryString=" + qs);
		Map map = request.getParameterMap();
		Set keSet = map.entrySet();
		for (Iterator itr = keSet.iterator(); itr.hasNext();) {
			Map.Entry me = (Map.Entry) itr.next();
			Object ok = me.getKey(); // 获取参数名
			Object ov = me.getValue(); // 获取参数值
			String[] value = new String[1];
			if (ov instanceof String[]) {
				value = (String[]) ov;
			} else {
				value[0] = ov.toString();
			}
			for (int k = 0; k < value.length; k++) {
				logger.info(ok + "=" + value[k]);
			}
		}
	}
	
	@RequestMapping(value = "/weixin")
	public @ResponseBody String weixin(String signature,String echostr,String timestamp,String nonce,HttpSession session, Model model,HttpServletRequest request,HttpServletResponse response) {

		logger.info("微信后台被访问!");
		ShowParameter(request);
		boolean isGet = request.getMethod().toLowerCase().equals("get"); 
		if(isGet)
			logger.info("Get");
		else
			logger.info("Post");
		
		try {
			ServletInputStream in = request.getInputStream();
			StringBuilder xmlMsg = new StringBuilder();  
	        byte[] b = new byte[4096];  
	        for (int n; (n = in.read(b)) != -1;) {  
	            xmlMsg.append(new String(b, 0, n, "UTF-8"));  
	        }
	        
	        logger.info(xmlMsg.toString());
	        
		} catch (IOException e) {
			e.printStackTrace();
		}  
		
		if(check_signature(signature,timestamp,nonce))
			return echostr;
		
		return "";
	}

	public String bytesToHexString(byte[] src) {
		StringBuilder stringBuilder = new StringBuilder("");
		if (src == null || src.length <= 0) {
			return null;
		}
		for (int i = 0; i < src.length; i++) {
			int v = src[i] & 0xFF;
			String hv = Integer.toHexString(v);
			if (hv.length() < 2) {
				stringBuilder.append(0);
			}
			stringBuilder.append(hv);
		}
		return stringBuilder.toString();
	}
	
    private byte charToByte(char c) {
        return (byte) "0123456789ABCDEF".indexOf(c);
    }
    
	public byte[] hexStringToBytes(String hexString) {
		if (hexString == null || hexString.equals("")) {
			return null;
		}
		hexString = hexString.toUpperCase();
		int length = hexString.length() / 2;
		char[] hexChars = hexString.toCharArray();
		byte[] d = new byte[length];
		for (int i = 0; i < length; i++) {
			int pos = i * 2;
			d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));

		}
		return d;
	}

	public boolean check_signature(String signature, String timestamp,String nonce) {
		String[] arr = new String[] { timestamp, nonce, WeixinConstant.token };
		Arrays.sort(arr);
		String s = arr[0] + arr[1] + arr[2];
		byte[] digest = null;
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-1");
			digest = md.digest(s.getBytes("utf-8"));
		} catch (Exception e) {
			logger.info("check_signature Exception:" + e.toString());
		}
		String mySign = bytesToHexString(digest);
		return signature.equals(mySign);
	}
	
	
			
	
	/***********************************产品列表**********************************************/
	@RequestMapping(value="weixin/product/productlist")
	public  String queryProductList(Integer type,ProductQueryParameter parameter,Model model, HttpSession session){
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			//webResult.setSuccess(false);
			//webResult.setMsg(request.getContextPath()+"/weixin/login.jsp");
			//return webResult;
		}
		int state = 62 + type;
		parameter.setState(state);
		parameter.setRecommend(1);
		
		List<ProductVO> products = productService.queryProductList(parameter);
		logger.info("queryProductList 查询产品列表完成");
		if(products.size() > 0)
		{
			model.addAttribute("firstProduct", products.get(0));//爆款
			products.remove(0);
		}

		model.addAttribute("products", products);
		model.addAttribute("state", type);
		return "weixin/product/product";
	}
	
	
	
	/***********************************产品详情**********************************************/
	@RequestMapping(value="weixin/product/productdetail")
	public  String productDetail(String productid,Model model, HttpSession session,HttpServletRequest request,HttpServletResponse response){
		/*
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "weixin/login";
		}
		*/
		ProductVO product = productService.queryProduct(Integer.parseInt(productid));
		logger.info("queryProductList 查询产品列表完成");
		model.addAttribute("product", product);
		return "weixin/product/productShow";
	}

	
	
	/***********************************产品预约**********************************************/
	@RequestMapping(value="weixin/product/appointment")
	public @ResponseBody BaseWebResult appointment(AppointmentVO appointment,int productId,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg(request.getContextPath()+"/weixin/login.jsp");
			return webResult;
		}	
		
		ProductVO product = new ProductVO();
		PurchaseVO purchase = new PurchaseVO();
		ContactRecordVO contact = new ContactRecordVO();
		contact.setId(-1);
		purchase.setId(-1);
		product.setId(String.valueOf(productId));
		appointment.setProduct(product);
		appointment.setPurchase(purchase);
		appointment.setContact(contact);
		appointment.setUserId(userVO.getId());
		appointmentService.insertAppointment(appointment);
		webResult.setSuccess(true);
		webResult.setUrl(request.getContextPath()+"/weixin/product/appointmentlist");
		return webResult;
	}
	
	/***********************************查看预约产品列表**********************************************/
	@RequestMapping(value="weixin/product/appointmentlist")
	public String appointmentShow(HttpSession session,Model model,HttpServletRequest request,HttpServletResponse response){
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return request.getContextPath()+"/weixin/login";
		}
		
		Integer userid = userVO.getId();
		List<AppointmentVO> appointments = appointmentService.queryUserAppointmentList(userid);
		model.addAttribute("appointments", appointments);
		return "weixin/product/appointmentShow";
	}

	/***********************************查看购买产品列表**********************************************/
	@RequestMapping(value="weixin/product/boughtlist")
	public String boughtShow(HttpSession session,Model model,HttpServletRequest request,HttpServletResponse response){
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return request.getContextPath()+"/weixin/login";
		}
		
		Integer userid = userVO.getId();
		List<PurchaseVO> purchaseList = PurchaseServiceImpl.queryPurchaseList(userid, -1, -1, -1);
	    for(int i=0; i< purchaseList.size(); ++i)
	    {
	    	PurchaseVO PurchaseItem = purchaseList.get(i);
	    	PurchaseItem.getProduct().getUserPnl(userid);
	    }
		model.addAttribute("purchaseList", purchaseList);
		return "weixin/product/boughtShow";
	}	
	
	/***********************************查看购买产品详细信息**********************************************/
	@RequestMapping(value="weixin/product/boughtdetail")
	public String boughtDetail(int id,HttpSession session,Model model,HttpServletRequest request,HttpServletResponse response){
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return request.getContextPath()+"/weixin/login";
		}		

		PurchaseVO purchase = PurchaseServiceImpl.queryPurchase(id);
		purchase.getProduct().getUserPnl(userVO.getId());
		model.addAttribute("purchase", purchase);
		return "weixin/product/boughtdetail";
	}
	
	/***********************************对账单列表**********************************************/
	@RequestMapping(value="weixin/product/orderlist")
	public String orderlist(HttpSession session,Model model,HttpServletRequest request,HttpServletResponse response){
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "weixin/login";
		}
		
		Integer userid = userVO.getId();
		List<PurchaseVO> purchaseList = PurchaseServiceImpl.queryPurchaseList(userid, -1, -1, -1);
	    for(int i=0; i< purchaseList.size(); ++i)
	    {
	    	PurchaseVO PurchaseItem = purchaseList.get(i);
	    	PurchaseItem.getProduct().getUserPnl(userid);
	    }		
		model.addAttribute("purchaseList", purchaseList);
		return "weixin/product/orderlist";
	}
	
	//获取短信验证码
	@RequestMapping(value="/weixin/sendsms")
	public @ResponseBody BaseWebResult weixinsendsms(String mobile, HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		Calendar cal = Calendar.getInstance();
		TimeZone zone = TimeZone.getTimeZone("GMT+8");
		cal.setTimeZone(zone);
		Date time = cal.getTime();
		if(session.getAttribute("sendsms") == null || time.getTime() - ((Date)session.getAttribute("sendsms")).getTime() > 60*1000 )
		{
			session.setAttribute("sendsms",time);
			webResult.setSuccess(true);
			String smsCode = smsServiceImpl.getSMSCode(mobile);
			session.setAttribute(mobile, smsCode);
		}
		else
		{
			webResult.setSuccess(false);
			webResult.setMsg("请等待60秒后再获取验证码！");
		}
		
		return webResult;
	}		


	@RequestMapping(value="/weixin/register", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult registerFromWeixin(UserVO userVO, String rpassword,String verifyCode,String backurl, HttpSession session,HttpServletRequest request){
		
		if(backurl == null || backurl=="")
			backurl=request.getContextPath()+"/weixin/authentication/user.jsp";
		userVO.setUserName(userVO.getMobile());
		userVO.setName(userVO.getMobile());
		userVO.setEnabled(1);
		logger.info("用户" + userVO.getUserName() + "注册开始");
		BaseWebResult webResult = new BaseWebResult();
		if(!rpassword.equals(userVO.getPassword()))
		{
			webResult.setSuccess(false);
			webResult.setMsg("两次密码输入不一致!");			
		}
		else if(userServiceImpl.checkWithTel(userVO.getMobile()) > 0)
		{
			webResult.setSuccess(false);
			webResult.setMsg("此手机号码已被注册!");
		} else if("".equals(verifyCode) || !verifyCode.equals(session.getAttribute(userVO.getMobile()))){
			webResult.setSuccess(false);
			webResult.setMsg("手机验证码输入有误!");
		}else {
			userServiceImpl.register(userVO);
			logger.info("用户" + userVO.getUserName() + "注册成功");
			session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
			webResult.setSuccess(true);
			webResult.setResult(userVO);
			webResult.setUrl(backurl);
		}
		
		return webResult;
	}	
	
	@RequestMapping(value="/weixin/login", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult login(Integer type,String mobile,String password,String verifyCode,String backurl, HttpSession session,HttpServletRequest request){
		
		BaseWebResult webResult = new BaseWebResult();
		logger.info("用户" + mobile + "登陆开始");
		UserVO userVO = null;
		String msg = "";
		if(type == 0)
		{
			userVO = userServiceImpl.login(mobile,password);
			if(userVO == null)
			{
				msg= "用户" + mobile + "不存在或密码错误！";
			}
		}
		else
		{
			if(verifyCode.equals(session.getAttribute(mobile))){
				userVO = userServiceImpl.findUserByMobile(mobile);
			}

			if(userVO == null)
			{
				msg="用户" + mobile + "不存在或验证码输入有误!";			
			}
		}
		
		if(userVO != null)
		{
			UserInfo userInfo = new UserInfo(userVO);
			logger.info("用户" + mobile + "登录成功");
			webResult.setSuccess(true);
			webResult.setResult(userInfo);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/weixin/authentication/user.jsp";
			webResult.setUrl(backurl);
			session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
		}
		else
		{
			logger.info(msg);
			webResult.setMsg(msg);
			webResult.setSuccess(false);
		}
		
		return webResult;
	}		
}
