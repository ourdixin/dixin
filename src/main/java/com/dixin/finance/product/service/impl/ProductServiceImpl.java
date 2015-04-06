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
import com.dixin.finance.product.vo.ProductQueryParameter;
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
	public List<ProductVO> queryProductList(ProductQueryParameter parameter) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productType", parameter.getProductType());	
		map.put("searchText", parameter.getSearchText());
		map.put("state", parameter.getState());
		map.put("minAmount", parameter.getMinAmount());
		map.put("term", parameter.getTerm());
		map.put("rate", parameter.getRate());
		map.put("direction", parameter.getDirection());
		return productMapper.queryProductList(map);
	}
	
	public ProductVO queryProduct(int productId)
	{
		return productMapper.queryProduct(productId);
	}
}
