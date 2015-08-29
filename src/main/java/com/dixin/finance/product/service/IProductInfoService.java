package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.ProductInfoVO;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;

public interface IProductInfoService {

	public abstract List<ProductInfoVO> queryProductInfoList(int productId,int infoType);
	public abstract void addProductInfo(ProductInfoVO productInfo);
	public abstract void deleteProduct(int Id);
	public abstract void updateProductInfo(ProductInfoVO productInfo);	
	
}
