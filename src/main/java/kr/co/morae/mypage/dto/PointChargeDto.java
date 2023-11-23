package kr.co.morae.mypage.dto;

import java.sql.Date;

public class PointChargeDto {
	private int chargeNo;
	private String userId;
	private int chargePrice;
	private Date chargeDate;
	private String depositor;
	
	public int getChargeNo() {
		return chargeNo;
	}
	public void setChargeNo(int chargeNo) {
		this.chargeNo = chargeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getChargePrice() {
		return chargePrice;
	}
	public void setChargePrice(int chargePrice) {
		this.chargePrice = chargePrice;
	}
	public Date getChargeDate() {
		return chargeDate;
	}
	public void setChargeDate(Date chargeDate) {
		this.chargeDate = chargeDate;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
}
