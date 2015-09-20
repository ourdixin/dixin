package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.ProductInfoVO;
import com.dixin.finance.product.vo.ProductVO;

@MapperScan
public interface ProductInfoMapper {
	
	/**
	 * 查询产品列表
	 * @return
	 */
	List<ProductInfoVO> queryProductInfoList(Map<String, Object> map);
	

	/**
	 * 添加产品
	 * @return
	 */		
	void addProductInfo(ProductInfoVO productInfo);	
	
	/**
	 * 删除产品
	 * @return
	 */		
	void deleteProductInfo(int Id);
	
	/**
	 * 修改产品
	 * @return
	 */	
	void updateProductInfo(ProductInfoVO productInfo);

	/**
	 * 查询指定时间的产品信息
	 * @return
	 */	
	ProductInfoVO queryProductInfoFromDate(Map<String, Object> map);

	/**
	 * 查询最新的产品信息
	 * @return
	 */	
	ProductInfoVO queryLastProductInfo(Map<String, Object> map);

	/**
	 * 查询指定日期之后的信息
	 * @return
	 */	
	List<ProductInfoVO> queryProductInfoListAfterDate(Map<String, Object> map);		
}

