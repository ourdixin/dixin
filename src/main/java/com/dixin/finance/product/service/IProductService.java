package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.ProductVO;

public interface IProductService {

	public abstract List<ProductVO> queryProductList();

}