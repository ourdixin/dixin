package com.dixin.finance.product.vo;

import java.util.Date;

public class PnlItemVo {
	
	private Date payDate;
	private Double pnl = 0d;
	private Double pnlSum = 0d;
	private Double amount = 0d;

	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Double getPnl() {
		return pnl;
	}
	public void setPnl(Double pnl) {
		this.pnl = pnl;
	}
	public Double getPnlSum() {
		return pnlSum;
	}
	public void setPnlSum(Double pnlSum) {
		this.pnlSum = pnlSum;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	

}
