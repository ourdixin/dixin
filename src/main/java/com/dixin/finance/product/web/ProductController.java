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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.framework.base.web.BaseWebResult;

/**
 * @author Administrator
 * 
 */
@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name="productServiceImpl")
	private IProductService productService;

	@RequestMapping("/index.jsp")
	public List<ProductVO> list(Model model, HttpServletRequest request) {
		List<ProductVO> products = productService.queryProductList();
		logger.info("index.jsp 查询产品列表完成");
		return products;
	}	
	
	@RequestMapping(value="/product/search", method=RequestMethod.POST)
	public @ResponseBody BaseWebResult queryProductList(UserVO userVO, HttpSession session){
		
		List<ProductVO> products = productService.queryProductList();
		logger.info("queryProductList 查询产品列表完成");
		BaseWebResult webResult = new BaseWebResult();
		webResult.setSucess(true);
		webResult.setResult(products);
		return webResult;
	}
}
