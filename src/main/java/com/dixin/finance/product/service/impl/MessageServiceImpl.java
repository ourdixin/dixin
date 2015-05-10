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
	@Override
	/**
	 * 通过初始留言的id来查找相关的所有留言
	 */
	public List<MessageVO> selectMsgsByInitialId(Integer id) {
		List<MessageVO> list = customerMapper.selectMsgsByInitialId(id);
		return list;
	}
	@Override
	/**
	 * 查找下一条自增id
	 */
	public Integer selectNextId() {
		Integer nextId = customerMapper.selectNextId();
		return nextId;
	}
	@Override
	/**
	 * 当后台用户回复普通用户留言时，将首条留言的last_msg_id更改为当前即将插入的message id
	 */
	public void updateLastMsgId(Integer id, Integer lastMsgId) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("id",id);
		map.put("lastMsgId",lastMsgId);
		customerMapper.updateLastMsgId(map);
	}
}

