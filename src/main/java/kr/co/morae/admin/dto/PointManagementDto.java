package kr.co.morae.admin.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PointManagementDto {

	private int chargeNo;
	private String userId;
	private int chargePrice;
	private Date chargeDate;
	private String depositor;
	private int pointNo;
	private int gbNo;
	private String pointReason;
	private int pointMonney;
	private Date pointDate;
	private String title;
	
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public int getGbNo() {
		return gbNo;
	}
	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}
	public String getPointReason() {
		return pointReason;
	}
	public void setPointReason(String pointReason) {
		this.pointReason = pointReason;
	}
	public int getPointMonney() {
		return pointMonney;
	}
	public void setPointMonney(int pointMonney) {
		this.pointMonney = pointMonney;
	}
	public Date getPointDate() {
		return pointDate;
	}
	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
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
