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

import com.dixin.finance.authentication.service.IUserService;
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
import com.dixin.finance.product.vo.ContactRecordVO;
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
	@Resource
	private IUserService userServiceImpl;
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
	public @ResponseBody BaseWebResult addProduct(ProductVO product,String editorValue,String backurl,HttpSession session,Model model,HttpServletRequest request){
	
		BaseWebResult webResult = new BaseWebResult();

		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/admin/login.jsp";
			webResult.setUrl(backurl);
			webResult.setMsg("添加失败，请先登陆!");
			return webResult;
		}
		double amount = product.getAmount() * 100000000;
		double minAmount = product.getMinAmount() * 10000;
		double appendAmount = product.getAppendAmount() * 10000;
		product.setAmount(amount);
		product.setMinAmount(minAmount);
		product.setAppendAmount(appendAmount);
		product.setInfo(editorValue);
		product.setPartA(product.getPartA() * 10000);
		product.setPartB(product.getPartB() * 10000);
		product.setPartC(product.getPartC() * 10000);
		product.setPartD(product.getPartD() * 10000);
		productService.addProduct(product);
		
		webResult.setSuccess(true);
		return webResult;		
	}	
	@RequestMapping(value="/product/update")
	public @ResponseBody BaseWebResult update(ProductVO product,String editorValue,String backurl,HttpSession session,Model model,HttpServletRequest request){
	
		BaseWebResult webResult = new BaseWebResult();

		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/admin/login.jsp";
			webResult.setUrl(backurl);
			webResult.setMsg("添加失败，请先登陆!");
			return webResult;
		}
		double amount = product.getAmount() * 100000000;
		double minAmount = product.getMinAmount() * 10000;
		double appendAmount = product.getAppendAmount() * 10000;
		product.setAmount(amount);
		product.setMinAmount(minAmount);
		product.setAppendAmount(appendAmount);
		product.setInfo(editorValue);
		
		product.setPartA(product.getPartA() * 10000);
		product.setPartB(product.getPartB() * 10000);
		product.setPartC(product.getPartC() * 10000);
		product.setPartD(product.getPartD() * 10000);
		
		productService.updateProduct(product);
		
		webResult.setSuccess(true);
		return webResult;		
	}		
	@RequestMapping(value="/product/addProductList")
	public @ResponseBody BaseWebResult addProductList(String backurl,HttpServletRequest request,HttpSession session,@RequestParam("productfile") MultipartFile productfile){
	
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(false);
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			if(backurl == null || backurl=="")
				backurl=request.getContextPath()+"/admin/login.jsp";
			webResult.setUrl(backurl);
			webResult.setMsg("添加失败，请先登陆!");
			return webResult;
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
	
	@RequestMapping(value="/admin/productview", method=RequestMethod.GET)
	public String adminProductView(int productId,HttpSession session,Model model,HttpServletRequest request){
	
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
		
		return "admin/productview";
	}	
	
	@RequestMapping(value="/admin/changeproduct")
	public String adminChangeProduct(int productId,HttpSession session,Model model,HttpServletRequest request){
	
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			String url = request.getRequestURI();
			 if(request.getQueryString()!=null)   
				   url+="?"+request.getQueryString(); 
			model.addAttribute("backurl", url);
			return "authentication/login";
		}
		

		ProductVO product = productService.queryProduct(productId);
		model.addAttribute("product", product);
		model.addAttribute("user", userVO);
		if(product.getProfitId() == ProfitTypeConstant.FixProduct)
			return "admin/changeFixproduct";
		
		return "admin/changeFloatproduct";
	}	
	
	@RequestMapping(value="/admin/delproduct",method=RequestMethod.POST)
	public @ResponseBody BaseWebResult adminDeleteProduct(int productId,HttpSession session,Model model,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
			return webResult;
		}
		
		productService.deleteProduct(productId);
		
		webResult.setSuccess(true);
		webResult.setMsg(request.getContextPath()+"/admin/manage.jsp");
		return webResult;
	}	
	
	/***********************************产品转让**********************************************/
	@RequestMapping(value="/product/assignment",method=RequestMethod.POST)
	public @ResponseBody BaseWebResult assignment(AssignmentVO assignment,int productId,String backurl, HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
			return webResult;
		}		
		
		ProductVO product = new ProductVO();
		product.setId(String.valueOf(productId));
		assignment.setProduct(product);
		assignment.setUser(userVO);
		assignmentService.insertAssignment(assignment);
		
		webResult.setSuccess(true);
		webResult.setResult(assignment);
		webResult.setMsg(request.getContextPath()+"/product/queryAssignment");
		return webResult;
	}
	
	@RequestMapping(value="/product/queryAssignment")
	public String queryAssignmentList(Integer pageNum, Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "/authentication/login";
		}
		
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		PageHelper.startPage(pageNum, pageSize);
		List<AssignmentVO> assignments = assignmentService.queryUserAssignmentList(userVO.getId());
		PageInfo<AssignmentVO> pageinfoList = new PageInfo(assignments);
		model.addAttribute("assignmentList", pageinfoList);
		return "/product/assignmentShow";
	}
	
	//首页显示转让产品
	@RequestMapping(value="/authentication/transfer")
	public @ResponseBody BaseWebResult assignmentManager(Integer pageNum, Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		PageHelper.startPage(pageNum, pageSize);
		List<AssignmentVO> assignments = assignmentService.queryAssignmentList();
		PageInfo<AssignmentVO> pageinfoList = new PageInfo(assignments);
		webResult.setSuccess(true);
		webResult.setResult(pageinfoList);
		return webResult;
	}
	
	/***********************************产品预约**********************************************/
	@RequestMapping(value="/product/appointment",method=RequestMethod.POST)
	public @ResponseBody BaseWebResult appointment(AppointmentVO appointment,int productId,String backurl, HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
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
		webResult.setMsg(request.getContextPath()+"/product/appointmentShow.jsp");
		return webResult;
	}
	
	@RequestMapping(value="/product/queryAppointment")
	public @ResponseBody BaseWebResult queryAppointmentList(Integer pageNum, Integer pageSize,Model model,HttpSession session,HttpServletRequest request){
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
			return webResult;
		}
		
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		PageHelper.startPage(pageNum, pageSize);
		List<AppointmentVO> appointments = appointmentService.queryUserAppointmentList(userVO.getId());
		PageInfo<AssignmentVO> pageinfoList = new PageInfo(appointments);
		webResult.setSuccess(true);
		webResult.setResult(pageinfoList);
		return webResult;
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
		Integer userId= userVO.getId();
		logger.info("userId"+userId);
		logger.info("userName"+userVO.getUserName());
		message.setMsgId(CustomerConstant.initalMsg);//用户所有留言的初始留言，第一条
		message.setUserId(userId);
		Integer catogryId = message.switchToCatogryID(select2);
		message.setCatogryId(catogryId);
		message.setMsg(questions);
		message.setLastMsgId(-1);
		message.setCreateUser(userId);
		message.setUpdateUser(userId);
		messageServiceImpl.insertMessage(message);
		webResult.setMsg("提交成功！");
		webResult.setSuccess(true);
		return webResult;
	}
	
	//**************查看客户留言*********************************//
	@RequestMapping(value="/admin/message")
	public String showMessage(Model model,HttpSession session,HttpServletRequest request){
		logger.info("在线留言页面被访问！");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "authentication/login";
		}
		List<MessageVO> list = messageServiceImpl.selectFirstMessage();
		//String msg = list.get(0).getLastMessage().getMsg();
		//logger.info(msg);
		//Integer userType = list.get(0).getLastMessage().getUserVO().getUserType();
		//logger.info("userType"+userType);
		/*MessageVO message = list.get(1).getLastMessage();
		if(message==null){
			logger.info("message为空");
		}*/
		/*Integer i= list.size();
		logger.info(i.toString());
		*/
		model.addAttribute("list", list);
		return "/admin/message";
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
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
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
	    List<PurchaseVO> purchaseList = purchaseServiceImpl.queryPurchaseList(userId,profitType,-1);
	    return new PageInfo(purchaseList);
	}	
	/***********************************根据初始留言ID显示相关所有留言****************************************/
	
	
	@RequestMapping(value="/admin/MessageReply")
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
		return "/admin/MessageReply";
			
	}
	
	/*******************************后台用户回复普通用户留言并更新初始留言last_msg_id属性**************************/
	@RequestMapping(value="/admin/MessageReply" ,method=RequestMethod.POST )
	public @ResponseBody BaseWebResult replyMessageBySupporter(Model model,Integer id,String msg,Integer catogryId,HttpSession session,HttpServletRequest request){
		logger.info("后台留言回复页面被访问+1!");
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
		Integer lastMsgId = message.getId();
		messageServiceImpl.updateLastMsgId(id,lastMsgId);
		webResult.setMsg("提交成功！");
		webResult.setSuccess(true);
		return webResult;	
	}
	

	
}
