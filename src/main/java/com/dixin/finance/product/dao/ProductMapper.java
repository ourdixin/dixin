package com.dixin.finance.product.dao;

import java.util.List;

import com.dixin.finance.product.vo.ProductVO;
import com.dixin.framework.annotation.Mapper;

@Mapper
public interface ProductMapper {
	
	/**
	 * 查询产品列表
	 * @return
	 */
	List<ProductVO> queryProductList();
}
