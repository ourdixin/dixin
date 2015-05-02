package com.dixin.finance.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dixin.finance.product.dao.CustomerMapper;
import com.dixin.finance.product.service.IMessageService;

import com.dixin.finance.product.vo.MessageVO;

@Service
public class MessageServiceImpl implements IMessageService {
	@Resource
	private CustomerMapper customerMapper;
	
	@Override
	public void insertMessage(MessageVO messageVO){
		if(messageVO!=null){
			customerMapper.insert(messageVO);
		}
	}
	@Override
	public Integer selectTotal(){
		Integer messageTotal = customerMapper.selectTotal();
		if(messageTotal==null){
			messageTotal=0;
		}
		return messageTotal;
	}
	@Override
	public Integer selectNextId(){
		Integer nextId = customerMapper.selectNextId();
		if(nextId==null){
			nextId=1;
		}
		return nextId;
	}
}
