package kr.co.morae.alarm.dto;

public class AlarmDto {
	
	private String title;
	private int gbNo;
	private String alarmAddr;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getGbNo() {
		return gbNo;
	}
	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}
	public String getAlarmAddr() {
		return alarmAddr;
	}
	public void setAlarmAddr(String alarmAddr) {
		this.alarmAddr = alarmAddr;
	}

}
