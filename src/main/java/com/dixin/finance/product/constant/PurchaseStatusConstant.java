package com.dixin.finance.product.constant;
/**
 * 
 */
public interface PurchaseStatusConstant {
	final String[] StatusTypeString = new String[]{"持有","转让","已赎回"};
	
	final int Status_Buy = 110;  		//持有
	final int Status_Assignment = 111;  //转让
	final int Status_Sell =112;			//已赎回	
}
