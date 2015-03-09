/**
 * 
 */
package com.dixin.finance.product.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dixin.finance.product.service.IProductService;

/**
 * @author Administrator
 * 
 */
@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name="productServiceImpl")
	private IProductService productService;

	@RequestMapping("/index")
	public String queryProductList(){
		
		productService.queryProductList();
		logger.info("查询产品列表完成");
		return "index";
	}
}
