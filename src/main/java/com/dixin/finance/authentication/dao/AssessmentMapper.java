package com.dixin.finance.authentication.dao;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.dixin.finance.authentication.vo.AssessmentVO;
@MapperScan
public interface AssessmentMapper {
	/**
	 * 插入评估结果
	 */
	void insert(AssessmentVO assessmentVO);
}
