package com.dixin.finance.product.service;

import java.util.List;

import com.dixin.finance.product.vo.ContactRecordVO;
public interface IContactRecordService {
	public void insert(ContactRecordVO contact);
	public List<ContactRecordVO> query(Integer firstContactId);
	public  void updateLastContactId(Integer lastContactId ,Integer firstContactId);

}
