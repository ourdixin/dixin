package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;

public interface IProductService {

	public abstract List<ProductVO> queryProductList(ProductQueryParameter parameter);
	public abstract ProductVO queryProduct(int productId);
	public abstract List<ProductVO> findProductList(ProductVO product);
	public abstract void updateViewNum(int productId);
	public abstract void addProduct(ProductVO product);
	public abstract void addProductList(List<ProductVO> productList); 
	public abstract List<ProductVO> readProductListFromExcel(String fileName); 
	public abstract void deleteProduct(int productId);
	public abstract void recommendProduct(int productId,int recommend);
	public abstract void updateProduct(ProductVO product);	
	
}
