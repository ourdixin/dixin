package com.dixin.finance.authentication.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
import com.dixin.finance.authentication.vo.AreaVO;
import com.dixin.finance.authentication.vo.AssessmentVO;
import com.dixin.finance.authentication.vo.FinancialManagerVO;
import com.dixin.finance.authentication.vo.Financial_institutionVO;
import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.vo.MessageVO;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;
import com.dixin.framework.tools.MakePicture;
import com.dixin.framework.tools.RandomValidateCode;
import com.dixin.framework.tools.split;


@Controller
public class AuthenticationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
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
	
	@Resource(name="productServiceImpl")
	private IProductService productService;
	
	@RequestMapping(value="/")
	public String index(ProductVO product,HttpSession session,Model model,HttpServletRequest request){
	
		logger.info("首页被访问!");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO != null)
		{
			model.addAttribute("user", userVO);
		}
		
/*
		//首页推荐产品
		//固定收益
		List<ProductVO> fixedProducts = productService.findProductList(product);
		//浮动收益
		List<ProductVO> floatProducts = productService.findProductList(product);
		model.addAttribute("fixedProducts", fixedProducts);
		model.addAttribute("floatProducts", floatProducts);
*/

		return "main";
	}	
	
	
	@RequestMapping(value="/authentication/user", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult register(UserVO userVO, String rpassword,String verifyCode,String backurl, HttpSession session,HttpServletRequest request){
		
		if(backurl == null || backurl=="")
			backurl=request.getContextPath()+"/";
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
		} else if(!((String)session.getAttribute("pic")).toUpperCase().equals(request.getParameter("randCode").toUpperCase())) {
			webResult.setSuccess(false);
			webResult.setMsg("图形验证码输入有误!");
		}else if("".equals(verifyCode) || !verifyCode.equals(session.getAttribute(userVO.getMobile()))){
			webResult.setSuccess(false);
			webResult.setMsg("手机验证码输入有误!");
		}else {
			userServiceImpl.register(userVO);
			logger.info("用户" + userVO.getUserName() + "注册成功");
			session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
			webResult.setSuccess(true);
			webResult.setResult(userVO);
			webResult.setMsg(backurl);
		}
		
		return webResult;
	}

	
	@RequestMapping(value="/authentication/login", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult login(String username,String password,String backurl, HttpSession session,HttpServletRequest request){
		
		BaseWebResult webResult = new BaseWebResult();
		logger.info("用户" + username + "登陆开始");
		UserVO userVO = userServiceImpl.login(username,password);
		if(userVO != null)
		{
			UserInfo userInfo = new UserInfo(userVO);
			logger.info("用户" + username + "登录成功");
			webResult.setSuccess(true);
			webResult.setResult(userInfo);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/";
			webResult.setMsg(backurl);
			session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
		}
		else
		{
			String msg= "用户" + username + "不存在或密码错误！";
			logger.info(msg);
			webResult.setMsg(msg);
			webResult.setSuccess(false);
		}
		
		webResult.setResult(userVO);	
		
		return webResult;
	}	
	
	@RequestMapping(value="/authentication/logout")
	public String logout(String backurl, HttpSession session,HttpServletRequest request){
		
		BaseWebResult webResult = new BaseWebResult();
		
		
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO != null)
			logger.info("用户" + userVO.getUserName() + "登出");
		session.removeAttribute(WebConstants.SESSION_KEY_USER);
		
		if(backurl == null || backurl=="")
			backurl="/";		
		
		
		return "redirect:"+backurl;
	}
	
	//获取短信验证码
	@RequestMapping(value="/authentication/sendsms")
	public @ResponseBody BaseWebResult sendsms(String mobile, HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		if(!((String)session.getAttribute("pic")).toUpperCase().equals(request.getParameter("randCode").toUpperCase())) {
			webResult.setSuccess(false);
			webResult.setMsg("图形验证码输入有误!");
		}
		else
		{
			webResult.setSuccess(true);
			String smsCode = smsServiceImpl.getSMSCode(mobile);
			session.setAttribute(mobile, smsCode);
		}
		return webResult;
	}
	
	//检查图像验证码
	@RequestMapping(value="/authentication/randcode")
	public @ResponseBody BaseWebResult verifycode(String randcode, HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		if(!((String)session.getAttribute("pic")).toUpperCase().equals(request.getParameter("randCode").toUpperCase())) {
			webResult.setSuccess(false);
			webResult.setMsg("图形验证码输入有误!");
		}
		
		return webResult;
	}		
	
	@RequestMapping(value="/authentication/validatecode", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult register(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		
		BaseWebResult webResult = new BaseWebResult();
		return webResult;
	}
	
	@RequestMapping(value="/authentication/forgetpassword", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult resetPassword(String mobile,String password,String rpassword,HttpSession session, HttpServletRequest request, HttpServletResponse response){
		BaseWebResult webResult = new BaseWebResult();
		int user_id =  userServiceImpl.checkWithTel(mobile);
		if(user_id <0){
			webResult.setMsg("请输入正确账号！");
			webResult.setSuccess(false);
			return webResult;
		}
		userServiceImpl.resetPassword(password,user_id);
		webResult.setMsg("修改成功！");
		webResult.setUrl(request.getContextPath()+"/authentication/login.jsp");
		webResult.setSuccess(true);
		return webResult;
		
	}
	
	@RequestMapping(value="/authentication/myselfwealthers")
	public  String showFinancialManager(Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		logger.info("本页被访问！");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			String url = request.getRequestURI();
			 if(request.getQueryString()!=null)   
				   url+="?"+request.getQueryString(); 
			model.addAttribute("backurl", url);
			return "authentication/login";
		}
		int id = userVO.getId();
		logger.info("ID为："+id+"的用户访问了我的专属财富经理页面！");
		FinancialManagerVO fmanager = fmrServiceImpl.selectFmanager(id);
		/*if(fmanager == null){
			return "/authentication/login";
		}*/
		Financial_institutionVO finVO = fmanager.getFinancialInstitution();
		model.addAttribute("fmanager", fmanager);
		model.addAttribute("user", userVO);
		model.addAttribute("finVO", finVO);
		
		return "/authentication/myselfwealthers";
		
	}
	
	@RequestMapping(value="/authentication/queryRiskAppraisal")
	public  String showRiskAppraisal(Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			return "authentication/login";
		}
		int grade = userVO.getIsRiskTested();
		model.addAttribute("grade", grade);
		if(grade<12){
			model.addAttribute("level", new String("A"));
		}else if(grade>=12&&grade<24){
			model.addAttribute("level", new String("B"));
		}else{
			model.addAttribute("level", new String("C"));
		}		
		
		return "authentication/queryRiskAppraisal";
	}
	
	@RequestMapping(value="/authentication/RiskAppraisal", method=RequestMethod.POST)
	public String Assessment(String w1,String w2,String w3,String[] w4,String w5,String w6,String w7,String w8,String w9, Model model,HttpSession session,HttpServletRequest request){
		logger.info("风险评估页面被访问！");
		//logger.info("w4"+w4[0].toString());
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			return "authentication/login";
		}
		AssessmentVO assessment = new AssessmentVO();
		assessment.setUserId(userVO.getId());
		String delim1 = ",";
		String delim2 = "-";
		if(w1==null||w1==""){
			logger.info("w1:"+w1);
		}
		if(w2==null||w2==""){
			logger.info("w2:"+w2);
		}
		if(w3==null||w3==""){
			logger.info("w1:"+w1);
		}
		if(w4==null||w4.length==0){
			logger.info("w1:"+w1);
		}
		if(w5==null||w5==""){
			logger.info("w1:"+w1);
		}
		if(w6==null||w6==""){
			logger.info("w1:"+w1);
		}
		if(w7==null||w7==""){
			logger.info("w1:"+w1);
		}
		if(w8==null||w8==""){
			logger.info("w1:"+w1);
		}
		if(w9==null||w9==""){
			logger.info("w9:"+w9);
		}
		int option1 = split.pickUpString(w1,delim1).get(0);
		int grade1 = split.pickUpString(w1,delim1).get(1);
		int option2 = split.pickUpString(w2,delim1).get(0);
		int grade2= split.pickUpString(w2,delim1).get(1);
		int option3 = split.pickUpString(w3,delim1).get(0);
		int grade3 = split.pickUpString(w3,delim1).get(1);
		int option4 = split.pickUpArray(w4,delim2).get(0);
		int grade4 = split.pickUpArray(w4,delim2).get(1);
		int option5 = split.pickUpString(w5,delim1).get(0);
		int grade5= split.pickUpString(w5,delim1).get(1);
		int option6 = split.pickUpString(w6,delim1).get(0);
		int grade6 = split.pickUpString(w6,delim1).get(1);
		int option7 = split.pickUpString(w7,delim1).get(0);
		int grade7 = split.pickUpString(w7,delim1).get(1);
		int option8 = split.pickUpString(w8,delim1).get(0);
		int grade8 = split.pickUpString(w8,delim1).get(1);
		int option9 = split.pickUpString(w9,delim1).get(0);
		int grade9 = split.pickUpString(w9,delim1).get(1);
		assessment.setOption1(option1);
		assessment.setOption2(option2);
		assessment.setOption3(option3);
		assessment.setOption4(option4);
		assessment.setOption5(option5);
		assessment.setOption6(option6);
		assessment.setOption7(option7);
		assessment.setOption8(option8);
		assessment.setOption9(option9);
		Integer grade = grade1+grade2+grade3+grade4+grade5+grade6+grade7+grade8+grade9;
		assessment.setGrade(grade);
		asmServiceImpl.insert(assessment);
		userServiceImpl.setRiskTested(userVO.getId(),grade);
		userVO.setIsRiskTested(grade);
		session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);
		//根据分数计算等级，并返回结果页面
		model.addAttribute("user", userVO);
		model.addAttribute("grade", grade);
		if(grade<12){
			model.addAttribute("level", new String("A"));
		}else if(grade>=12&&grade<24){
			model.addAttribute("level", new String("B"));
		}else{
			model.addAttribute("level", new String("C"));
		}
		return "/authentication/queryRiskAppraisal-result";
	}
	
	

	/***********************************账户设计**********************************************/
	@RequestMapping(value="/authentication/accountSetting",method=RequestMethod.GET)
	public String accountSetting(Model model,HttpSession session,HttpServletRequest request){
		UserVO user = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(user==null){
			return "authentication/login";
		}
		UserVO userVO = userServiceImpl.findUserById(user.getId());//通过id重新加载用户信息
		model.addAttribute("user", userVO);
		return "/authentication/accountSetting";
	}
	

	@RequestMapping(value="/authentication/uppersonaldata", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult updateUser(String rpassword, String password,String mobile,UserVO user,Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response){
		BaseWebResult webResult = new BaseWebResult();
		String verifyCode = request.getParameter("verifyCode");
		//修改手机号
		if(StringUtils.isNoneEmpty(mobile)) {
			//修改手机号
			user.setMobile(mobile);
			//同时修改用户名
			user.setUserName(mobile);
			if(rpassword==null || password==null || !rpassword.equals(password)){
				webResult.setSuccess(false);
				webResult.setMsg("两次密码输入不一致!");		
			}
			if("".equals(verifyCode) || !verifyCode.equals(session.getAttribute(mobile))){
				webResult.setSuccess(false);
				webResult.setMsg("手机验证码输入有误!");
			} 
		} 
		userServiceImpl.updateUser(user);
		UserVO userVO = userServiceImpl.findUserById(user.getId());//通过id重新加载用户信息
		session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);//添加到session
		model.addAttribute("user", userVO);
		webResult.setMsg(request.getContextPath()+"/authentication/accountSetting.jsp");
		webResult.setSuccess(true);
		return webResult;
	}
	
	@RequestMapping(value="/authentication/getFinanicalList")
	public String getFinanicalList(Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response){
		List<Financial_institutionVO> financialList = finServiceImpl.selectAll();
		model.addAttribute("financialList", financialList);
		return "/authentication/securityConfirm";
	}
	
	@RequestMapping(value="/authentication/getPic")
	public void getPic(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		MakePicture mp=new MakePicture() ;  
        String str=mp.drawPicture(60, 20,response.getOutputStream()) ;  
        request.getSession().setAttribute("pic", str) ;  
        response.getOutputStream().print(str) ;
	}
	
	/***********************************手机验证**********************************************/
	@RequestMapping(value="/authentication/verificationCode")
	public @ResponseBody BaseWebResult verificationCode(UserVO user,Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response){ 
		RandomValidateCode rc = new RandomValidateCode();
		String strMsg = rc.getRandomSmsString();
		String mobile = ((UserVO)session.getAttribute(WebConstants.SESSION_KEY_USER)).getMobile();
		List<String> phoneList = new ArrayList<String>();
		phoneList.add(mobile);
		smsServiceImpl.sendSms(strMsg, phoneList);
		session.setAttribute("vCode", strMsg);//验证码
		BaseWebResult webResult = new BaseWebResult();
		webResult.setMsg(request.getContextPath()+"/authentication/mobileConfirm.jsp");
		webResult.setSuccess(true);
		return webResult;
	}
	
	/*************************************根据用户id查找所有的初始留言*************************************/
	@RequestMapping(value="/authentication/myReply")
	public String showMessageByUserId(Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response){
		logger.info("前台我的留言页面被访问！");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "authentication/login";
		}
		Integer id = userVO.getId();
		List<MessageVO> list = messageServiceImpl.selectFirstMsgByUserId(id);
		model.addAttribute("list", list);
		return "/authentication/myReply";
		
	}
	
	/************************************根据用户初始留言id查找初始留言相关所有留言*****************/
	@RequestMapping(value="/authentication/myReplybyuser")
	public String showMessageByInitialId(Model model,Integer id,HttpSession session,HttpServletRequest request){
		logger.info("后台留言回复页面被访问!");
		logger.info("id="+id);
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "authentication/login";
		}
		List<MessageVO> list = messageServiceImpl.selectMsgsByInitialId(id);
		model.addAttribute("list", list);
		return "/authentication/myReplybyuser";
	}
	
	/***************************前台用户回复普通用户留言并更新初始留言last_msg_id属性************************/
	@RequestMapping(value="/authentication/myReplybyuser" ,method=RequestMethod.POST )
	public @ResponseBody BaseWebResult replyMessageByUser(Model model,Integer id,String msg,Integer catogryId,HttpSession session,HttpServletRequest request){
		logger.info("前台留言回复页面被访问+1!");
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
			webResult.setSuccess(false);
			return webResult;
		}
		MessageVO message = new MessageVO();
		logger.info("id"+id);
		logger.info("catogryId"+catogryId);
		message.setMsgId(id);//初次留言的id作为后面同组留言的msg_id
		Integer userId = userVO.getId();
		message.setUserId(userId);
		message.setCatogryId(catogryId);
		message.setMsg(msg);
		message.setLastMsgId(-1);
		message.setCreateUser(userId);
		message.setUpdateUser(userId);
		messageServiceImpl.insertMessage(message);
		//final Integer lastMsgId = -1;//用户回复后设置lastMsg为-1
		Integer thisLastMsgId = message.getId();
		messageServiceImpl.updateLastMsgId(id,thisLastMsgId);//设置初始留言
		webResult.setMsg("提交成功！");
		webResult.setUrl(request.getContextPath()+"/authentication/myReplybyuser?id="+id+"&catogryId="+catogryId);
		webResult.setSuccess(true);
		return webResult;	
	}
	
	
	@RequestMapping(value="/authentication/getcitylist")
	public @ResponseBody BaseWebResult getCityList(Integer pid, HttpServletRequest request, HttpServletResponse response){ 
		List<AreaVO> result = null;
		if(pid == null || pid < 0 )
			result = areaServiceImpl.getProvince();
		else
			result = areaServiceImpl.getCity(pid);
		
		BaseWebResult webResult = new BaseWebResult();
		webResult.setResult(result);
		webResult.setSuccess(true);
		return webResult;
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


	public IAreaService getAreaServiceImpl() {
		return areaServiceImpl;
	}


	public void setAreaServiceImpl(IAreaService areaServiceImpl) {
		this.areaServiceImpl = areaServiceImpl;
	}
}
