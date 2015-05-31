package com.dixin.finance.product.service.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.vo.ContactRecordVO;
import com.dixin.finance.product.service.IContactRecordService;
import com.dixin.finance.product.dao.ContactRecordMapper;


@Service
public class ContactRecordServiceImpl implements IContactRecordService{
	@Resource
	private ContactRecordMapper contactMapper;
	
	
	@Override
	public void insert(ContactRecordVO contact) {
		contactMapper.insert(contact);
	}

	@Override
	public List<ContactRecordVO> query(Integer firstContactId) {
		return contactMapper.query(firstContactId);
	}

	@Override
	public void updateLastContactId(Integer lastContactId,
			Integer firstContactId) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("lastContactId", lastContactId);
		map.put("firstContactId", firstContactId);
		
		contactMapper.updateLastContactId(map);
	}

}
