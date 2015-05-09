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
	/**
	 * 查询所有留言的初始留言并显示
	 */
	public List<MessageVO> selectFirstMessage() {
		List<MessageVO> list = customerMapper.selectFirstMsg();
	
		return list;
	}
}
