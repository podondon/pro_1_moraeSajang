package kr.co.morae.groupbuy.dto;

import java.sql.Date;

public class GbStateCheckDto {
	private int gbNo;
	private Date finishDate;
	private Date completeDate;
	private int recruitPeople;
	private int completeCnt;
	private int joinNum;
	private int joinPrice;
	private String userId;
	
	
	public int getJoinPrice() {
		return joinPrice;
	}
	public void setJoinPrice(int joinPrice) {
		this.joinPrice = joinPrice;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}
	public int getJoinNum() {
		return joinNum;
	}
	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
	}
	public int getGbNo() {
		return gbNo;
	}
	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public Date getCompleteDate() {
		return completeDate;
	}
	public void setConmpleteDate(Date conmpleteDate) {
		this.completeDate = conmpleteDate;
	}
	public int getRecruitPeople() {
		return recruitPeople;
	}
	public void setRecruitPeople(int recruitPeople) {
		this.recruitPeople = recruitPeople;
	}
	public int getCompleteCnt() {
		return completeCnt;
	}
	public void setCompleteCnt(int completeCnt) {
		this.completeCnt = completeCnt;
	}
	@Override
	public String toString() {
		String s = "gbNo :"+gbNo+", finishDate:"+finishDate+", completeDate:"+completeDate+", recruitPeople:"+recruitPeople+", completeCnt:"+completeCnt+", joinNum:"+joinNum;
		return s ;
	}
	
	
	
}
