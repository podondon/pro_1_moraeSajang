package kr.co.morae.emuns;

public enum UserReviewEnum {
	TRADEAGAIN("또 거래 하고싶어요", 1),
	JUSTOKAY("그냥 그래요", 2),
	NOTINTERESTED("별로에요", 3);

    private final String reviewType;
    private final int reviewNum;
    
    
    UserReviewEnum(String reviewType, int reviewNum) {
    	this.reviewType = reviewType;
    	this.reviewNum = reviewNum;
	}

	public String getReviewType() {
    	return reviewType;
    }
	
	public int getReviewNum() {
		return reviewNum;
	}
}
