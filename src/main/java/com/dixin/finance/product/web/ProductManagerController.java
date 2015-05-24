/**
 * 
 */
package com.dixin.finance.product.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dixin.finance.product.service.IReservationProcessService;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserVO;

import com.dixin.finance.product.service.IAppointmentService;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.service.IContactRecordService;
import com.dixin.finance.product.vo.AppointmentVO;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.finance.product.vo.ContactRecordVO;
import com.dixin.finance.product.vo.ReservationProcessVO;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;
import com.dixin.finance.product.constant.appointmentConstant;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.vo.PurchaseStatisticsVO;
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
	
	@Resource
	private IUserService userServiceImpl;
	
	@Resource(name="contactRecordServiceImpl")
	private IContactRecordService contactRecordServiceImpl;
	
	@Resource(name="reservationProcessServiceImpl")
	private IReservationProcessService reservationProcessService;
	
	/*************************后台查询客服预约信息*******************************/
	@RequestMapping(value="/admin/appointment")
	public String showAppointment(Model model,HttpSession session,HttpServletRequest request){
		logger.info("客户产品预约页面被访问！");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "authentication/login";
		}
		
		List<AppointmentVO> list = appointmentService.queryAllAppointmentList();
		//String lastmsg = list.get(2).getContact().getLastContactRecordVO().getRecord();
		/*if(lastmsg!=null){
			logger.info("lastcontact"+lastmsg);
		}*/
		model.addAttribute("list", list);
		return "/admin/appointment";
	}
	
	/***************************查看联系记录********************/
	
	@RequestMapping(value="admin/appointment-add-contact")
	public String showContactRecord(Model model,HttpSession session,HttpServletRequest request,Integer firstContactId){
		logger.info("客户产品预约（添加联系记录）页面被访问");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "authentication/login";
		}
		List<ContactRecordVO> list = contactRecordServiceImpl.query(firstContactId);
		logger.info("length:"+list.size());
		logger.info("firstContactId:"+firstContactId);
		model.addAttribute("list", list);
		return "admin/appointment-add-contact";
	}
	
	@RequestMapping(value="admin/appointment-contact")
	public String showContact(Model model,HttpSession session,HttpServletRequest request,Integer firstContactId){
		logger.info("客户产品预约（添加联系记录）页面被访问");
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO == null)
		{
			return "authentication/login";
		}
		List<ContactRecordVO> list = contactRecordServiceImpl.query(firstContactId);
		logger.info("length:"+list.size());
		logger.info("firstContactId:"+firstContactId);
		model.addAttribute("list", list);
		return "admin/appointment-contact";
	}
	
	
	/***********添加联系记录*************************************************/
	@RequestMapping(value="admin/appointment-add-contact",method=RequestMethod.POST )
	public @ResponseBody BaseWebResult addContactRecord(Model model,HttpSession session,HttpServletRequest request,Integer firstContactId,Integer appointmentId,
			String record,Integer userId){
		logger.info("客户产品预约（添加联系记录）");
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			webResult.setMsg(request.getContextPath()+"/authentication/login.jsp");
			webResult.setSuccess(false);
			return webResult;
		}
		ContactRecordVO contact = new ContactRecordVO();
		Integer id= contactRecordServiceImpl.nextId();
		if(firstContactId==null||firstContactId<0){
			contact.setContactId(-1);
			appointmentService.setFirstContactId(id,appointmentId);
		}else{
			contact.setContactId(firstContactId);
			contactRecordServiceImpl.updateLastContactId(id,firstContactId);
		}
		UserVO user = new UserVO();
		user.setId(userId);
		contact.setUser(user);
		contact.setRecord(record);
		ContactRecordVO lastContact = new ContactRecordVO();
		lastContact.setId(id);
		contact.setLastContactRecordVO(lastContact);
		contactRecordServiceImpl.insert(contact);
		webResult.setMsg(request.getContextPath()+"/admin/appointment");
		webResult.setSuccess(true);
		return webResult;
	
	}
	
	/**************添加预约进程信息***********************************/
	@RequestMapping(value="admin/appointment-deal")
	public @ResponseBody BaseWebResult addReservationProcess(Model model,HttpSession session,HttpServletRequest request,
			Integer reservationId,Integer userId,String productId,Integer option,
			@DateTimeFormat(pattern="yyyy-MM-dd")Date buyDate,Double amount,Integer volume,String info,String reason){
		logger.info("客户产品预约（处理）");
		BaseWebResult webResult = new BaseWebResult();
		UserVO userVO = (UserVO) session.getAttribute(WebConstants.SESSION_KEY_USER);
		if(userVO==null){
			webResult.setMsg(request.getContextPath()+"/admin/login.jsp");
			webResult.setSuccess(false);
			return webResult;
		}
		
		if(option ==null)
		{
			webResult.setSuccess(false);
			webResult.setMsg("未选择！");
			return webResult;						
		}
		
		ReservationProcessVO process = new ReservationProcessVO();
		if(option !=null && option==appointmentConstant.buyed){
			PurchaseVO purchase = new PurchaseVO();
			purchase.setUserId(userId);
			purchase.setBuyDate(buyDate);
			ProductVO product = new ProductVO();
			product.setId(productId);
			purchase.setProduct(product);
			purchase.setVolume(volume);
			purchase.setAmount(amount);
			purchase.setPnl(0.0);
			purchase.setProductId(productId);
			purchaseServiceImpl.addPurchase(purchase);
		}
		appointmentService.setConstant(reservationId,option);
		AppointmentVO appointment = new AppointmentVO();
		appointment.setId(reservationId);
		process.setAppointment(appointment);
		process.setState(option);
		if(option !=null && option==appointmentConstant.buying)
			process.setInfo(info);
		else
			process.setInfo(reason);
		reservationProcessService.insert(process);
		webResult.setMsg(request.getContextPath()+"/admin/appointment");
		webResult.setSuccess(true);
		return webResult;
	}
	

	public IUserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(IUserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}
	

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
	public IContactRecordService getContactRecordServiceImpl() {
		return contactRecordServiceImpl;
	}

	public void setContactRecordServiceImpl(
			IContactRecordService contactRecordServiceImpl) {
		this.contactRecordServiceImpl = contactRecordServiceImpl;
	}

	public IReservationProcessService getReservationProcessService() {
		return reservationProcessService;
	}

	public void setReservationProcessService(
			IReservationProcessService reservationProcessService) {
		this.reservationProcessService = reservationProcessService;
	}

	@RequestMapping(value="/admin/addsalesdata")
	public @ResponseBody BaseWebResult addSalesData(PurchaseVO purchaseVo,Integer userId,String backurl,HttpSession session,Model model,HttpServletRequest request){
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
		
		UserVO customer = userServiceImpl.findUserById(userId);
		if(customer == null || userId == null)
		{
			webResult.setSuccess(false);
			webResult.setMsg("添加失败！");
			return webResult;
		}			
		
		purchaseVo.setUserId(userId);
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

	@RequestMapping(value="/admin/getpurchasestatistics")
	public @ResponseBody BaseWebResult getPurchaseStatistics(String backurl,Integer pageNum,Integer pageSize,HttpSession session,Model model,HttpServletRequest request){
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
		
		if(pageNum == null)
			pageNum = 0;
		if(pageSize == null)
			pageSize =	10;	
		
		PageHelper.startPage(pageNum, pageSize);
		List<PurchaseStatisticsVO> PurchaseStatisticsList = purchaseServiceImpl.queryPurchaseStatistics();
		PageInfo<PurchaseStatisticsVO> result = new PageInfo(PurchaseStatisticsList);
		webResult.setResult(result);
		webResult.setSuccess(true);
		
		return webResult;
	}
	@RequestMapping(value="/admin/SalesDataDetail")
	public @ResponseBody BaseWebResult getSalesDataDetail(Integer id,String backurl,Integer pageNum,Integer pageSize,HttpSession session,Model model,HttpServletRequest request){
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
		
		if(pageNum == null)
			pageNum = 0;
		if(pageSize == null)
			pageSize =	10;	
		
		PageHelper.startPage(pageNum, pageSize);
		List<PurchaseVO> PurchaseList = purchaseServiceImpl.queryPurchaseDetails(id);
		PageInfo<PurchaseVO> result = new PageInfo(PurchaseList);
		webResult.setResult(result);
		webResult.setSuccess(true);
		
		return webResult;
	}
	
	/***********************************产品转让管理**********************************************/
	@RequestMapping(value="/admin/product/assignment")
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
