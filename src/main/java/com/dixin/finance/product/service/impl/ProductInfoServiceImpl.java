/**
 * 
 */
package com.dixin.finance.product.service.impl;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.ProductInfoMapper;
import com.dixin.finance.product.dao.ProductMapper;
import com.dixin.finance.product.service.IProductInfoService;
import com.dixin.finance.product.service.IProductService;
import com.dixin.finance.product.vo.ProductInfoVO;
import com.dixin.finance.product.vo.ProductQueryParameter;
import com.dixin.finance.product.vo.ProductVO;
import com.dixin.finance.product.web.ProductController;

/**
 * @author Administrator
 *
 */
@Service("productInfoServiceImpl")
public class ProductInfoServiceImpl implements IProductInfoService{

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource
	private ProductInfoMapper productInfoMapper;

	@Override
	public List<ProductInfoVO> queryProductInfoList(int productId, int infoType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productID", productId);	
		map.put("infoType", infoType);		
		return productInfoMapper.queryProductInfoList(map);
	}

	@Override
	public void addProductInfo(ProductInfoVO productInfo) {
		productInfoMapper.addProductInfo(productInfo);
	}

	@Override
	public void deleteProductInfo(int Id) {
		productInfoMapper.deleteProductInfo(Id);
	}

	@Override
	public void updateProductInfo(ProductInfoVO productInfo) {
		productInfoMapper.updateProductInfo(productInfo);
	}

	@Override
	public ProductInfoVO queryProductInfoFromDate(int productId, int infoType,String date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productID", productId);	
		map.put("infoType", infoType);	
		map.put("infoDate", date);
		return productInfoMapper.queryProductInfoFromDate(map);
	}

	@Override
	public ProductInfoVO queryLastProductInfo(int productId, int infoType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productID", productId);	
		map.put("infoType", infoType);		
		return productInfoMapper.queryLastProductInfo(map);		
	}

}
