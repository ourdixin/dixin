package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.PurchaseVO;

@MapperScan
public interface PurchaseMapper {
	public List<PurchaseVO> queryPurchaseList(Map<String, Object> map);
	public PurchaseVO queryPurchase(int Id);
}
