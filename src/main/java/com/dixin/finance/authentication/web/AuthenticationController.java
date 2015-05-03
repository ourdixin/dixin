package com.dixin.finance.authentication.web;

import java.util.ArrayList;
import java.util.List;
import com.dixin.framework.tools.split;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dixin.finance.authentication.service.IFmrService;
import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.service.IAsmService ;
import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.authentication.vo.FinancialManagerVO;
import com.dixin.finance.authentication.vo.Financial_institutionVO;
import com.dixin.finance.authentication.vo.AssessmentVO;
import com.dixin.finance.product.vo.AssignmentVO;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;


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
	
	@RequestMapping(value="/")
	public String index(HttpSession session,Model model,HttpServletRequest request){
	
		logger.info("首页被访问!");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO != null)
		{
			model.addAttribute("user", userVO);
		}
		
		return "main";
	}	
	
	
	@RequestMapping(value="/authentication/user", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult register(UserVO userVO, String backurl, HttpSession session,HttpServletRequest request){
		
		if(backurl == null || backurl=="")
			backurl=request.getContextPath()+"/";
		userVO.setUserName(userVO.getMobile());
		userVO.setName(userVO.getMobile());
		userVO.setEnabled(1);
		logger.info("用户" + userVO.getUserName() + "注册开始");
		BaseWebResult webResult = new BaseWebResult();
		if(userServiceImpl.checkWithTel(userVO.getMobile()) > 0)
		{
			webResult.setSuccess(false);
			webResult.setMsg("此手机号码已被注册!");
		}
		else
		{
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
			logger.info("用户" + username + "登陆成功");
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
	
	@RequestMapping(value="/authentication/sendsms")
	public @ResponseBody BaseWebResult register(String phone, HttpSession session,HttpServletRequest request){
		
		List<String>	phoneList = new ArrayList<String>();
		phoneList.add(phone);
		String strMsg = "121金融短信验证码:123456";
		smsServiceImpl.sendSms(strMsg, phoneList);
		
		BaseWebResult webResult = new BaseWebResult();
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
		return "/authentication/RiskAppraisal-result";
	}

	/***********************************账户设计**********************************************/
	@RequestMapping(value="/authentication/accountSetting",method=RequestMethod.GET)
	public String accountSetting(Model model,HttpSession session,HttpServletRequest request){
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		model.addAttribute("user", userVO);
		return "/authentication/personaldata";
	}
	

	@RequestMapping(value="/authentication/uppersonaldata", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult updateUser(UserVO user,Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response){
		userServiceImpl.updateUser(user);//修改
		UserVO userVO = userServiceImpl.findUserById(user.getId());//通过id重新加载用户信息
		session.setAttribute(WebConstants.SESSION_KEY_USER, userVO);//添加到session
		model.addAttribute("user", userVO);
		BaseWebResult webResult = new BaseWebResult();
		webResult.setMsg(request.getContextPath()+"/authentication/personaldata.jsp");
		webResult.setSuccess(true);
		return webResult;
	}
	
	@RequestMapping(value="/authentication/getFinanicalList")
	public String getFinanicalList(Model model,HttpSession session, HttpServletRequest request, HttpServletResponse response){
		//Financial_institutionVO financial = 
		//model.addAttribute("finanical", financial);
		return "/authentication/securityConfirm.jsp";
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
}
