package kr.co.morae.admin.dto;

import java.sql.Date;

public class ReportManagementDto {

	private int reportNo;
	private String userId;
	private String reportContent;
	private Date reportRegDate;
	private String reportType;
	private int uniqueNo;
	private String processState;
	
	private String reportuser;
	private String reportstate;
	
	
	public int getReportNo() {
		return reportNo;
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
	public String getReportuser() {
		return reportuser;
	}
	public void setReportuser(String reportuser) {
		this.reportuser = reportuser;
	}
	public String getReportstate() {
		return reportstate;
	}
	public void setReportstate(String reportstate) {
		this.reportstate = reportstate;
	}
	
	
	
	
	
	
	
	
	
	
}
