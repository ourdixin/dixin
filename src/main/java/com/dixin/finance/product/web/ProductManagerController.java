/**
 * 
 */
package com.dixin.finance.product.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestMethod;


import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.service.IAppointmentService;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.service.IPurchaseService;

import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;
import com.github.pagehelper.PageHelper;

import com.dixin.finance.product.vo.AssignmentVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author Administrator
 * 
 */
@Controller
public class ProductManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductManagerController.class);
	
	@Resource(name="assignmentServiceImpl")
	private IAssignmentService assignmentService;
	
	@Resource(name="appointmentServiceImpl")
	private IAppointmentService appointmentService;
	
	@Resource(name="messageServiceImpl")
	private IMessageService messageServiceImpl;

	@Resource(name="PurchaseServiceImpl")
	private IPurchaseService purchaseServiceImpl;	
	
	@Resource(name="productServiceImpl")
	private IProductService productService;
	
	
	public IProductService getProductService() {
		return productService;
	}

	public void setProductService(IProductService productService) {
		this.productService = productService;
	}

	public IAssignmentService getAssignmentService() {
		return assignmentService;
	}

	public void setAssignmentService(IAssignmentService assignmentService) {
		this.assignmentService = assignmentService;
	}

	public IAppointmentService getAppointmentService() {
		return appointmentService;
	}

	public void setAppointmentService(IAppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}

	public IMessageService getMessageServiceImpl() {
		return messageServiceImpl;
	}

	public void setMessageServiceImpl(IMessageService messageServiceImpl) {
		this.messageServiceImpl = messageServiceImpl;
	}

	public IPurchaseService getPurchaseServiceImpl() {
		return purchaseServiceImpl;
	}

	public void setPurchaseServiceImpl(IPurchaseService purchaseServiceImpl) {
		this.purchaseServiceImpl = purchaseServiceImpl;
	}

	@RequestMapping(value="/admin/addsalesdata")
	public @ResponseBody BaseWebResult addSalesData(PurchaseVO purchaseVo,String backurl,HttpSession session,Model model,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/admin/login.jsp";
			webResult.setUrl(backurl);
			webResult.setMsg("请先登录！");
			return webResult;
		}
		
		purchaseVo.setUserId(userVO.getId());
		purchaseVo.setAmount(purchaseVo.getAmount() * 10000);
		purchaseVo.setPnl(0d);
		purchaseServiceImpl.addPurchase(purchaseVo);
		
		webResult.setSuccess(true);
		
		return webResult;
	}
	
	@RequestMapping(value="/admin/getautoproduct")
	public @ResponseBody List<ProductVO> getAutoCompleteProducts(String name,String backurl,HttpSession session,Model model,HttpServletRequest request){
		
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return null;
		}
		
		ProductQueryParameter parameter = new ProductQueryParameter();
		parameter.setPageSize(30);
		parameter.setSearchText(name);
		PageHelper.startPage(parameter.getPageNum(), parameter.getPageSize());
		List<ProductVO> products = productService.queryProductList(parameter );
		
		
		return products;
	}		

	/***********************************产品转让管理**********************************************/
	@RequestMapping(value="/product/manager/assignment")
	public String  assignmentManager(Integer pageNum, Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		PageHelper.startPage(pageNum, pageSize);
		List<AssignmentVO> assignments = assignmentService.queryAssignmentList();
		PageInfo<AssignmentVO> pageinfoList = new PageInfo(assignments);
		model.addAttribute("assignmentList", pageinfoList);
		return "/admin/assignmentManager";
	}
	
}
