/**
 * 
 */
package com.dixin.finance.product.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.dixin.finance.product.service.IAppointmentService;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.service.IPurchaseService;
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

	
	
}
