package kr.co.morae.message.dto;

import java.sql.Date;

public class MessageDto {
	private int messagesNo;
	private String messageContent;
	private Date sentDate;
	private String messageRead;
	private String sener;
	private String reciever;
	private String senerNickName;
	private String recieverNickName;
	
	public int getMessagesNo() {
		return messagesNo;
	}
	public void setMessagesNo(int messagesNo) {
		this.messagesNo = messagesNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}
	public String getMessageRead() {
		return messageRead;
	}
	public void setMessageRead(String messageRead) {
		this.messageRead = messageRead;
	}
	public String getSener() {
		return sener;
	}
	public void setSener(String sener) {
		this.sener = sener;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getSenerNickName() {
		return senerNickName;
	}
	public void setSenerNickName(String senerNickName) {
		this.senerNickName = senerNickName;
	}
	public String getRecieverNickName() {
		return recieverNickName;
	}
	public void setRecieverNickName(String recieverNickName) {
		this.recieverNickName = recieverNickName;
	}
}
