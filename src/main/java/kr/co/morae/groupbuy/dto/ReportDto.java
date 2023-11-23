package kr.co.morae.groupbuy.dto;

import java.sql.Date;

public class ReportDto {
	private int reportNo;
	private int gbNo;
	private int commNo;
	private String userId;
	private String reportContent;
	private Date reportRegDate;
	private String reportType;
	private int uniqueNo;
	private String processState;
	public int getReportNo() {
		return reportNo;
	}
	
	
	public int getGbNo() {
		return gbNo;
	}


	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}


	public int getCommNo() {
		return commNo;
	}


	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}


	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getReportRegDate() {
		return reportRegDate;
	}
	public void setReportRegDate(Date reportRegDate) {
		this.reportRegDate = reportRegDate;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public int getUniqueNo() {
		return uniqueNo;
	}
	public void setUniqueNo(int uniqueNo) {
		this.uniqueNo = uniqueNo;
	}
	public String getProcessState() {
		return processState;
	}
	public void setProcessState(String processState) {
		this.processState = processState;
	}
	
	
}
