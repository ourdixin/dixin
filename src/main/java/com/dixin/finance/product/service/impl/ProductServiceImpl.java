/**
 * 
 */
package com.dixin.finance.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.ProductMapper;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.vo.ProductVO;

/**
 * @author Administrator
 *
 */
@Service("productServiceImpl")
public class ProductServiceImpl implements IProductService{

	@Resource
	private ProductMapper productMapper;
	
	/* (non-Javadoc)
	 * @see com.dixin.finance.product.service.impl.IProductService#queryProductList()
	 */
	@Override
	public List<ProductVO> queryProductList(int productType,String searchText) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productType", productType);	
		map.put("searchText", searchText);
		return productMapper.queryProductList(map);
	}
	
}
