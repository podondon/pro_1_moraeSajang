package kr.co.morae.admin.dto;

import java.util.Date;

public class GroupBuyAnalysisDto {
	private Date stateUpDate;
	private int stateall;
	private int stateing;
	private double stateper;
	public double getStateper() {
		return stateper;
	}
	public void setStateper(double stateper) {
		this.stateper = stateper;
	}
	public Date getStateUpDate() {
		return stateUpDate;
	}
	public void setStateUpDate(Date stateUpDate) {
		this.stateUpDate = stateUpDate;
	}
	public int getStateall() {
		return stateall;
	}
	public void setStateall(int stateall) {
		this.stateall = stateall;
	}
	public int getStateing() {
		return stateing;
	}
	public void setStateing(int stateing) {
		this.stateing = stateing;
	}

	
}
