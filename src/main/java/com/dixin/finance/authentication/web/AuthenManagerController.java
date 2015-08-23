package com.dixin.finance.authentication.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dixin.finance.authentication.constant.UserTypeConstant;
import com.dixin.finance.authentication.service.IAreaService;
import com.dixin.finance.authentication.service.IAsmService;
import com.dixin.finance.authentication.service.IFinService;
import com.dixin.finance.authentication.service.IFmrService;
import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.constant.ProfitTypeConstant;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.vo.AssignmentVO;
import com.dixin.finance.product.vo.MessageVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 后台管理
 * @author chenlly
 *
 */
@Controller
public class AuthenManagerController {
	
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
	
	@Resource
	private IPurchaseService PurchaseServiceImpl;

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
	
	@RequestMapping(value="/admin")
	public String index(HttpSession session,Model model,HttpServletRequest request){
	
		logger.info("后台首页被访问!");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "admin/login";
		}
		
		model.addAttribute("user", userVO);
		
		return "redirect:appointment.jsp";
	}
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult login(String username,String password,String backurl, HttpSession session,HttpServletRequest request){
		
		BaseWebResult webResult = new BaseWebResult();
		logger.info("用户" + username + "登录开始");
		UserVO userVO = userServiceImpl.login(username,password);
		if(userVO != null && (userVO.getUserType() == UserTypeConstant.MANAGER || userVO.getUserType() == UserTypeConstant.ADMINISTRATOR ))
		{
			UserInfo userInfo = new UserInfo(userVO);
			logger.info("用户" + username + "登录成功");
			webResult.setSuccess(true);
			webResult.setResult(userInfo);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/admin";
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
	
	/**
	 * 查询所有用户
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/admin/user")
	public @ResponseBody BaseWebResult findAllUser(Integer pageNum,Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		
		BaseWebResult webResult = new BaseWebResult();
		
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;

		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg(request.getContextPath()+"/admin/login.jsp");
			return webResult;
		}	
		
		PageHelper.startPage(pageNum, pageSize);
		List<UserVO> users = userServiceImpl.findAllUser();
		PageInfo<UserVO> pageinfoList = new PageInfo(users);
		webResult.setSuccess(true);
		webResult.setResult(pageinfoList);
		return webResult;	
	}
	
	/**
	 * 修改用户认证状态
	 * @param authType
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/admin/updateAuthType",method=RequestMethod.GET)
	public String updateAuthType(Integer id,Integer authType,Integer pageNum,Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		UserVO userVO = new UserVO();
		
		userVO.setAuthType(authType);
		userVO.setId(id);
		userServiceImpl.updateUser(userVO);
		return "/admin/user.jsp";
	}
	
	/**
	 * 用户详细信息管理
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/admin/userDetail",method=RequestMethod.GET)
	public String userDetail(Integer id,Model model,HttpSession session,HttpServletRequest request){
		//用户基本信息
		UserVO userVO = userServiceImpl.findUserById(id);
		model.addAttribute("user", userVO);
		//产品购买信息
			//固定
		List<PurchaseVO> fixProductList = PurchaseServiceImpl.queryPurchaseList(id, ProfitTypeConstant.FixProduct, -1);
		model.addAttribute("fixProductList", fixProductList);	
		//浮动
		List<PurchaseVO> proProductList = PurchaseServiceImpl.queryPurchaseList(id, ProfitTypeConstant.FloatProduct, -1);
		model.addAttribute("proProductList", proProductList);
		//在线留言
		List<MessageVO> messageList = messageServiceImpl.selectMsgsByInitialId(id);
		model.addAttribute("messageList", messageList);
		return "/admin/userDetail";
	}
}
