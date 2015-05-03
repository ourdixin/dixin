/**
 * 
 */
package com.dixin.finance.product.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.constant.ProductTypeConstant;
import com.dixin.finance.product.constant.ProfitTypeConstant;
import com.dixin.finance.product.service.IAppointmentService;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.vo.AppointmentVO;
import com.dixin.finance.product.vo.AssignmentVO;
import com.dixin.finance.product.vo.PageDataItem;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.base.web.CheckToken;
import com.dixin.framework.base.web.FileUpoadController;
import com.dixin.framework.constant.WebConstants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.dixin.finance.product.vo.MessageVO;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.constant.CustomerConstant;
/**
 * @author Administrator
 * 
 */
@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name="productServiceImpl")
	private IProductService productService;
	
	@Resource(name="assignmentServiceImpl")
	private IAssignmentService assignmentService;
	
	@Resource(name="appointmentServiceImpl")
	private IAppointmentService appointmentService;
	
	@Resource(name="messageServiceImpl")
	private IMessageService messageServiceImpl;

	@Resource(name="PurchaseServiceImpl")
	private IPurchaseService purchaseServiceImpl;	
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public @ResponseBody BaseWebResult queryProductList(ProductQueryParameter parameter, HttpSession session){

		int productType = parameter.getProductType();
		if(productType != ProductTypeConstant.ALL)
		{
			productType += ProductTypeConstant.ALL;
			if(productType < ProductTypeConstant.ALL || productType > ProductTypeConstant.ASSET_MANAGEMENT)
				productType = ProductTypeConstant.ALL; 
		}
		
		List<PageDataItem> result = new ArrayList<PageDataItem>();
		if(productType == ProductTypeConstant.ALL){
			for(Integer i = ProductTypeConstant.ALL+1; i <= ProductTypeConstant.ASSET_MANAGEMENT ; ++i )
			{
				PageDataItem item = new PageDataItem();
				item.setId(i - ProductTypeConstant.ALL);
				parameter.setProductType(i);
				item.setProducts(GetProducts(parameter));
			    result.add(item);
			}
		}
		else
		{
			PageDataItem item = new PageDataItem();
			item.setId(productType - ProductTypeConstant.ALL);
			parameter.setProductType(productType);
			item.setProducts(GetProducts(parameter));
		    result.add(item);
		}
		
		logger.info("queryProductList 查询产品列表完成");
		
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		webResult.setResult(result);
		return webResult;
	}
	
	@RequestMapping(value="/products/advance", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult queryProductAdance(ProductQueryParameter parameter, HttpSession session){

		int productType = parameter.getProductType();
		if(productType != ProductTypeConstant.ALL)
		{
			productType += ProductTypeConstant.ALL;
			if(productType < ProductTypeConstant.ALL || productType > ProductTypeConstant.ASSET_MANAGEMENT)
				productType = ProductTypeConstant.ALL; 
		}
		
		List<PageDataItem> result = new ArrayList<PageDataItem>();
		
		PageDataItem item = new PageDataItem();
		item.setId(productType - ProductTypeConstant.ALL);
		parameter.setProductType(productType);
		item.setProducts(GetProducts(parameter));
	    result.add(item);
		
		
		logger.info("queryProductList 查询产品列表完成");
		
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		webResult.setResult(result);
		return webResult;
	}
	
	
	public PageInfo<ProductVO> GetProducts(ProductQueryParameter parameter){
	    PageHelper.startPage(parameter.getPageNum(), parameter.getPageSize());
	    List<ProductVO> products = productService.queryProductList(parameter);
	    return new PageInfo(products);
	}
	
	
	   @RequestMapping("/product/uploadadfile")  
	public @ResponseBody BaseWebResult uploadAdFile(HttpServletRequest request,@RequestParam("uploadadfile") MultipartFile adfile) {  
	   BaseWebResult webResult = new BaseWebResult();
	   String filename = "";
	    
	   if(adfile!=null && !adfile.isEmpty())
	   {
	        filename = FileUpoadController.saveFile(request,adfile); 
	   }   
	   
	    webResult.setSuccess(true);
	    webResult.setResult(filename);
	    return webResult;  
	}	
	
	   @RequestMapping("/product/uploadguidefile")  
	public @ResponseBody BaseWebResult uploadGuideFile(HttpServletRequest request,@RequestParam("uploadguidefile") MultipartFile guidefile) {  
	   BaseWebResult webResult = new BaseWebResult();
	   String filename = "";
	    
	   if(guidefile != null && !guidefile.isEmpty())
	   {
	        filename = FileUpoadController.saveFile(request,guidefile); 
	   }	   
	   
	    webResult.setSuccess(true);
	    webResult.setResult(filename);
	    return webResult;  
	}		   
	   
	@RequestMapping(value="/product/add")
	public @ResponseBody BaseWebResult addProduct(ProductVO product,String editorValue,HttpSession session,Model model,HttpServletRequest request){
	
		BaseWebResult webResult = new BaseWebResult();

		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			//webResult.setSuccess(false);
			//return webResult;
		}
		double amount = product.getAmount() * 100000000;
		double minAmount = product.getMinAmount() * 10000;
		double appendAmount = product.getAppendAmount() * 10000;
		product.setAmount(amount);
		product.setMinAmount(minAmount);
		product.setAppendAmount(appendAmount);
		product.setInfo(editorValue);
		productService.addProduct(product);
		
		webResult.setSuccess(true);
		return webResult;		
	}	
	
	@RequestMapping(value="/product/addProductList")
	public @ResponseBody BaseWebResult addProductList(HttpServletRequest request,HttpSession session,@RequestParam("productfile") MultipartFile productfile){
	
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(false);
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			//webResult.setSuccess(false);
			//return webResult;
		}

		String filename = "";
	    
	   if(productfile != null && !productfile.isEmpty())
	   {
	       filename = FileUpoadController.saveFile(request,productfile); 
	 	   if(!filename.isEmpty())
		   {
	 		   String LocalFileName = FileUpoadController.GetRootPath(request) + filename;
	 		   
	 		   List<ProductVO> products = productService.readProductListFromExcel(LocalFileName);
	 		   if(products.size() > 0 )
	 		   {
	 			   productService.addProductList(products);
	 			   webResult.setSuccess(true);
	 		   }
	 		   else
	 		   {
	 			  webResult.setMsg("文件格式或者文件内容有误，请更正后再添加!");
	 		   }
		   }
	 	   else
	 	   {
	 		  webResult.setMsg("文件上传失败!");
	 	   }
	   }
	   else
	   {
		   webResult.setMsg("文件上传失败!");
	   }
	
		return webResult;		
	}		
	
	@RequestMapping(value="/product/view", method=RequestMethod.GET)
	public String productView(int productId,HttpSession session,Model model,HttpServletRequest request){
	
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			String url = request.getRequestURI();
			 if(request.getQueryString()!=null)   
				   url+="?"+request.getQueryString(); 
			model.addAttribute("backurl", url);
			return "authentication/login";
		}
		
		productService.updateViewNum(productId);
		ProductVO product = productService.queryProduct(productId);
		model.addAttribute("product", product);
		model.addAttribute("user", userVO);
		
		return "product/view";
	}
	
	/***********************************产品转让**********************************************/
	@RequestMapping(value="/product/assignment",method=RequestMethod.POST)
	public @ResponseBody BaseWebResult assignment(AssignmentVO assignment,int productId,String backurl, HttpSession session,HttpServletRequest request){
		
		ProductVO product = new ProductVO();
		product.setId(String.valueOf(productId));
		assignment.setProduct(product);
		assignmentService.insertAssignment(assignment);
		String url = request.getRequestURI();
		 if(request.getQueryString()!=null)   
			   url+="?"+request.getQueryString(); 
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		webResult.setResult(assignment);
		webResult.setMsg(url);
		return webResult;
	}
	
	@RequestMapping(value="/product/queryAssignment")
	public String queryAssignmentList(Integer pageNum, Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		PageHelper.startPage(pageNum, pageSize);
		List<AssignmentVO> assignments = assignmentService.queryAssignmentList();
		PageInfo<AssignmentVO> pageinfoList = new PageInfo(assignments);
		model.addAttribute("assignmentList", pageinfoList);
		return "/product/assignmentShow";
	}
	
	/***********************************产品预约**********************************************/
	@RequestMapping(value="/product/appointment",method=RequestMethod.POST)
	public @ResponseBody BaseWebResult appointment(AppointmentVO appointment,int productId,String backurl, HttpSession session,HttpServletRequest request){
		ProductVO product = new ProductVO();
		product.setId(String.valueOf(productId));
		appointment.setProduct(product);
		appointmentService.insertAppointment(appointment);
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		webResult.setMsg(request.getContextPath()+"/product/queryAppointment");
		return webResult;
	}
	
	@RequestMapping(value="/product/queryAppointment")
	public String queryAppointmentList(Integer pageNum, Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		PageHelper.startPage(pageNum, pageSize);
		List<AppointmentVO> appointments = appointmentService.queryAppointmentList();
		PageInfo<AssignmentVO> pageinfoList = new PageInfo(appointments);
		model.addAttribute("appointmentList", pageinfoList);
		return "/product/appointmentShow";
	}
	/***************************************在线客服
	 * @throws IOException ***************************************************/
	
	@RequestMapping(value="/product/customer" ,method=RequestMethod.POST )
	public @ResponseBody BaseWebResult productCustomer(Model model,String select2,String questions,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		BaseWebResult webResult = new BaseWebResult();
		logger.info("在线客服页面被访问！");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			webResult.setMsg("请重新登录！");
			webResult.setSuccess(false);
			return webResult;
		}
		MessageVO message = new MessageVO();
		Integer msgId = messageServiceImpl.selectNextId();
		Integer userId= userVO.getId();
		message.setMsgId(msgId);//mysql自增从1开始
		message.setUserId(userId);
		Integer catogryId = message.switchToCatogryID(select2);
		message.setCatogryId(catogryId);
		message.setMsg(questions);
		message.setCreateUser(userId);
		message.setUpdateUser(userId);
		messageServiceImpl.insertMessage(message);
		webResult.setMsg("提交成功！");
		webResult.setSuccess(true);
		return webResult;
		
	}
	
	@RequestMapping(value="/product/queryPurchase")
	public @ResponseBody BaseWebResult queryPurchaseList(Integer pageNum, Integer pageSize,Integer profitType,Model model,HttpSession session,HttpServletRequest request){
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		BaseWebResult webResult = new BaseWebResult();
		
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			webResult.setMsg("请重新登录！");
			webResult.setSuccess(false);
			return webResult;
		}	
		int userId = userVO.getId();
		List<PageDataItem> result = new ArrayList<PageDataItem>();
		if(profitType != ProfitTypeConstant.FixProduct || profitType != ProfitTypeConstant.FloatProduct)
		{
			PageDataItem item = new PageDataItem();
			item.setId(ProfitTypeConstant.FixProduct);
			item.setPurchaseList(GetPurchaseList(userId,pageNum,pageSize,ProfitTypeConstant.FixProduct));
		    result.add(item);
		    
			item = new PageDataItem();
			item.setId(ProfitTypeConstant.FloatProduct);
			item.setPurchaseList(GetPurchaseList(userId,pageNum,pageSize,ProfitTypeConstant.FloatProduct));
		    result.add(item);
		}
		else 
		{
			PageDataItem item = new PageDataItem();
			item.setId(ProfitTypeConstant.FixProduct);
			item.setPurchaseList(GetPurchaseList(userId,pageNum,pageSize,profitType));
		    result.add(item);			
		}
		
		logger.info("queryProductList 查询产品列表完成");
		
		webResult.setSuccess(true);
		webResult.setResult(result);
		return webResult;		
	}	
	
	public PageInfo<PurchaseVO> GetPurchaseList(Integer userId, Integer pageNum, Integer pageSize,Integer profitType){
	    PageHelper.startPage(pageNum, pageSize);
	    List<PurchaseVO> purchaseList = purchaseServiceImpl.queryPurchaseList(userId,profitType);
	    return new PageInfo(purchaseList);
	}	
	
}
