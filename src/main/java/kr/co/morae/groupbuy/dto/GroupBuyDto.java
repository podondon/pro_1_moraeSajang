package kr.co.morae.groupbuy.dto;

import java.sql.Date;
import java.util.Optional;

public class GroupBuyDto {
	private int gbNo;
	private String nickname;
	private int joinPeople;
	private int tradeAgainNum;
	private int justOkayNum;
	private int notInterestedNum;
	private String recruitLocation;
	private String categoryType;
	private String userId;
	private int categoryNo;
	private String gbContent;
	private String title;
	private int recruitPeople;
	private Date finishDate;
	private Date startDate;
	private int joinPrice;
	private String gbState;
	private String blockState;
	private String parcelAddress;
	private String gbDetailAddress;
	private String place;
	private boolean isGbWriter;
	private int isJoining;
	private int currPage;
	private String firstFileName;
	private String completeNum;
	private String joinState;
	private int isReview;

	
	public String getJoinState() {
		return joinState;
	}
	public void setJoinState(String joinState) {
		this.joinState = joinState;
	}
	public int getIsReview() {
		return isReview;
	}
	public void setIsReview(int isReview) {
		this.isReview = isReview;
	}
	public String getCompleteNum() {
		return completeNum;
	}
	public void setCompleteNum(String completeNum) {
		this.completeNum = completeNum;
	}
	public String getFirstFileName() {
		return firstFileName;
	}
	public void setFirstFileName(String firstFileName) {
		this.firstFileName = firstFileName;
	}
	public int getIsJoining() {
		return isJoining;
	}
	public void setIsJoining(int isJoining) {
		this.isJoining = isJoining;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getTradeAgainNum() {
		return tradeAgainNum;
	}
	public int getJoinPeople() {
		return joinPeople;
	}
	public void setJoinPeople(int joinPeople) {
		this.joinPeople = joinPeople;
	}
	public void setTradeAgainNum(int tradeAgainNum) {
		this.tradeAgainNum = tradeAgainNum;
	}
	public int getJustOkayNum() {
		return justOkayNum;
	}
	public void setJustOkayNum(int justOkayNum) {
		this.justOkayNum = justOkayNum;
	}
	public int getNotInterestedNum() {
		return notInterestedNum;
	}
	public void setNotInterestedNum(int notInterestedNum) {
		this.notInterestedNum = notInterestedNum;
	}
	
	public boolean getIsGbWriter() {
		return isGbWriter;
	}
	public void setGbWriter(boolean isGbWriter) {
		this.isGbWriter = isGbWriter;
	}
	public String getRecruitLocation() {
		return recruitLocation;
	}
	public void setRecruitLocation(String recruitLocation) {
		this.recruitLocation = recruitLocation;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public int getGbNo() {
		return gbNo;
	}
	public void setGbNo(int gbNo) {
		this.gbNo = gbNo;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getGbContent() {
		return gbContent;
	}
	public void setGbContent(String gbContent) {
		this.gbContent = gbContent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRecruitPeople() {
		return recruitPeople;
	}
	public void setRecruitPeople(int recruitPeople) {
		this.recruitPeople = recruitPeople;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public int getJoinPrice() {
		return joinPrice;
	}
	public void setJoinPrice(int joinPrice) {
		this.joinPrice = joinPrice;
	}
	public String getGbState() {
		return gbState;
	}
	public void setGbState(String gbState) {
		this.gbState = gbState;
	}
	public String getBlockState() {
		return blockState;
	}
	public void setBlockState(String blockState) {
		this.blockState = blockState;
	}
	
	public String getParcelAddress() {
		return parcelAddress;
	}
	public void setParcelAddress(String parcelAddress) {
		this.parcelAddress = parcelAddress;
	}
	public String getGbDetailAddress() {
		return gbDetailAddress;
	}
	public void setGbDetailAddress(String gbDetailAddress) {
		this.gbDetailAddress = gbDetailAddress;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		String s = ", userId : " +userId+", nickname : "+nickname+ "isJoining:"+isJoining+"gbDetailAddress="+gbDetailAddress+", parcelAddress="+parcelAddress;
	           s += ", joinPrice="+joinPrice+", finishDate="+finishDate+", place="+place+", categoryType="+categoryType;
	           s += ", title="+title+", recruitPeople="+recruitPeople+", startDate="+startDate;
	           s +=  ", gbNo : " +gbNo+"recruitLocation="+recruitLocation;
		return s;
	}

}
