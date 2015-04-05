/**
 * 
 */
package com.dixin.finance.product.web;

import java.util.ArrayList;
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
	public @ResponseBody BaseWebResult queryProductList(UserVO userVO, Integer pageNum, Integer pageSize, Integer productType,String  searchText, HttpSession session){
		
		if(pageNum == null)
			pageNum = 1;
		if(pageSize == null)
			pageSize = 10;
		
		if(searchText==null)
			searchText = "";
		
		if(productType == null )
			productType = ProductTypeConstant.ALL;
		else
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
				item.setProducts(GetProducts(pageNum,pageSize,i,searchText));
			    result.add(item);
			}
		}
		else
		{
			PageDataItem item = new PageDataItem();
			item.setId(productType - ProductTypeConstant.ALL);
			item.setProducts(GetProducts(pageNum,pageSize,productType,searchText));
		    result.add(item);
		}
		
		logger.info("queryProductList 查询产品列表完成");
		
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		webResult.setResult(result);
		return webResult;
	}
	
	public PageInfo<ProductVO> GetProducts(int pageNum, int pageSize,int productType,String searchText){
	    PageHelper.startPage(pageNum, pageSize);
	    List<ProductVO> products = productService.queryProductList(productType,searchText);
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
		
		return "product/view";
	}
	
	@RequestMapping(value="/product/assignment", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult assignment(AssignmentVO assignment,String backurl, HttpSession session,HttpServletRequest request){
		assignmentService.insertAssignment(assignment);
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSuccess(true);
		webResult.setResult(assignment);
		webResult.setMsg(backurl);
		return webResult;
	}
	
}
