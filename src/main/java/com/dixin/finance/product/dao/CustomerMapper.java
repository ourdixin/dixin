package com.dixin.finance.product.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.product.vo.MessageVO;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.constant.CustomerConstant;

@MapperScan
public interface CustomerMapper {
	
	/**
	 * 插入在线客服message信息
	 */
	void insert(MessageVO messageVO);
	/**
	 * 查询所有留言的初始留言并显示
	 */
	List<MessageVO> selectFirstMsg();
	/**
	 * 根据初次留言id查询同留言MSG_ID的所有留言
	 * 
	 */
	List<MessageVO> selectMsgsByInitialId(Integer id);
	/**
	 * 当后台用户回复普通用户留言时，将首条留言的last_msg_id更改为当前即将插入的message id
	 */
	void updateLastMsgId(Map<String,Integer> map);
	/**
	 * 查找下一条自增id
	 */
	Integer selectNextId();
}

