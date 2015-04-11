/**
 * 
 */
package com.dixin.finance.product.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.constant.ProductTypeConstant;
import com.dixin.finance.product.service.IAssignmentService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.vo.AssignmentVO;
import com.dixin.finance.product.vo.PageDataItem;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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
}
