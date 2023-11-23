package kr.co.morae.groupbuy.dto;

public class SearchOptionDto {
	private int category;
	private String keyWord;
	private String region;
	private int page;
	private int offset;
	
	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}

	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	@Override
	public String toString() {
		String s = "";
		s += "pageNum:"+page+", categoryType:" +category+", keyWord:"+keyWord+", region:"+region;
		return s;
	}
	
	
	
	

}
