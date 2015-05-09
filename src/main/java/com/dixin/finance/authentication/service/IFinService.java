package com.dixin.finance.authentication.service;
import com.dixin.finance.authentication.vo.Financial_institutionVO;
import java.util.List;
import java.util.ArrayList;
public interface IFinService {
	/**
	 * 插入金融机构
	 */
	public void insert(Financial_institutionVO finVO);
	/**
	 * 查找所有的金融机构
	 */
	public List<Financial_institutionVO> selectAll();
}
