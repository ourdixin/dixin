package com.dixin.finance.product.constant;


public interface PayTypeConstant {
	
	final String[] PayTypeString = new String[]{"自然季度付息","自然半年度付息","自然年度付息","季度付息","半年度付息","年度付息","到期还本付息","其他付息方式"};
	/**
	 * 债券
	 */
	final int CALENDAR_QUARTER = 66;
	final int CALENDAR_HALFYEAR = 67;
	final int CALENDAR_YEAR = 68;
	final int QUARTER = 69;
	final int HALFYEAR = 70;
	final int YEAR = 71;
	final int DEBT_MATURITY = 72;
	final int OTHER = 73;
}
