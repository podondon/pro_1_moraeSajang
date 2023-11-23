package kr.co.morae.admin.dto;

public class RecruitmentAnalysisDto {
	private String userId;
	private int al;
	private int su;
	private double sucrate;
	public double getSucrate() {
		return sucrate;
	}
	public void setSucrate(double sucrate) {
		this.sucrate = sucrate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAl() {
		return al;
	}
	public void setAl(int al) {
		this.al = al;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}

	
}
