package kr.co.morae.mypage.dto;

import java.sql.Date;

public class PointDto {
	private int pointNo;
	private int gbNo;
	private String userId;
	private String pointReason;
	private int pointMonney;
	private Date pointDate;
	// 공구글 권한
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
}
