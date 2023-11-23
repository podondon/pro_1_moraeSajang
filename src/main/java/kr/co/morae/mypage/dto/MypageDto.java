package kr.co.morae.mypage.dto;

import java.sql.Date;

public class MypageDto {
	
	private String userId;
	private String nickname;
	private String name;
	private String email;
	private Date reg_date;
	private String addr;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReg_date() {
		return reg_date.toString();
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	


}
