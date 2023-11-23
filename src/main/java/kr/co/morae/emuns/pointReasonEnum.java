package kr.co.morae.emuns;

public enum pointReasonEnum {

	USE("사용"),
	CALCULATE("정산"),
	CANCEL("취소");

    private final String state;
    pointReasonEnum(String state) {
        this.state = state;
    }
    
    public String getState() {
    	return state;
    }

}
