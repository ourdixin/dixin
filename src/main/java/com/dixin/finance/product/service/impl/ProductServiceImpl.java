/**
 * 
 */
package com.dixin.finance.product.service.impl;

import java.util.List;

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
	public List<ProductVO> queryProductList() {
		return productMapper.queryProductList();
	}
	
}
