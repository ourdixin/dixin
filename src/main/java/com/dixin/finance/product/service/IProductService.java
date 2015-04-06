package com.dixin.finance.product.service;

import java.util.List;
import java.util.Map;

import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;

public interface IProductService {

	public abstract List<ProductVO> queryProductList(ProductQueryParameter parameter);
	public abstract ProductVO queryProduct(int productId);
}