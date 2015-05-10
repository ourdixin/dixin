package com.dixin.finance.product.service;
import java.util.List;
import java.util.Map;
import com.dixin.finance.product.vo.MessageVO;
public interface IMessageService {
	/**
	 * 插入message
	 * @param messageVO
	 */
	public void insertMessage(MessageVO messageVO);
	public List<MessageVO> selectFirstMessage();
	public List<MessageVO> selectMsgsByInitialId(Integer id);
	public Integer selectNextId();
	public void updateLastMsgId(Integer id , Integer lastMsgId);
	public List<MessageVO> selectFirstMsgByUserId(Integer id);
}

