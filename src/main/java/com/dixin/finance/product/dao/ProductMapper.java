package com.dixin.finance.product.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.ProductVO;

@MapperScan
public interface ProductMapper {
	
	/**
	 * 查询产品列表
	 * @return
	 */
	List<ProductVO> queryProductList();
}