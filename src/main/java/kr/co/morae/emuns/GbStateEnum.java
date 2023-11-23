package kr.co.morae.emuns;

public enum GbStateEnum {

	PROGRESS("진행"),
	COMPLETE("완료"),
	CANCEL("취소");

    private final String state;
    GbStateEnum(String state) {
        this.state = state;
    }
    
    public String getState() {
    	return state;
    }

}
