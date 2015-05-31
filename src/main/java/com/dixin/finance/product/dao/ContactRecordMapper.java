package com.dixin.finance.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.ContactRecordVO;

@MapperScan
public interface ContactRecordMapper {
		/**
		 * 插入联系记录
		 * @param contact
		 */
		public void insert(ContactRecordVO contact);
		/**
		 * 查询一组留言
		 */
		public List<ContactRecordVO> query(Integer firstContactId);
		/**
		 * 更新最有一条留言id
		 */
		public void updateLastContactId(Map<String,Integer> map);
		

}
