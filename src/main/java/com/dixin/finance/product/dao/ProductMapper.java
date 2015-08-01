package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.ProductVO;

@MapperScan
public interface ProductMapper {
	
	/**
	 * 查询产品列表
	 * @return
	 */
	List<ProductVO> queryProductList(Map<String, Object> map);
	
	/**
	 * 查询单个产品
	 * @return
	 */	
	ProductVO queryProduct(int productId);
	
	
    /**
     * 根据条件查询产品信息
     * @param product
     * @return
     */
	List<ProductVO> findProductList(ProductVO product);
	
	/**
	 * 添加查看次数
	 * @return
	 */		
	void updateViewNum(int productId);
	
	
	/**
	 * 添加产品
	 * @return
	 */		
	void addProduct(ProductVO product);	
	
	/**
	 * 批量添加产品
	 * @return
	 */			
	void addProductList(List<ProductVO> productList);
	
	
	/**
	 * 删除产品
	 * @return
	 */		
	void deleteProduct(int productId);
	
	/**
	 * 修改产品
	 * @return
	 */	
	void updateProduct(ProductVO product);		
}

