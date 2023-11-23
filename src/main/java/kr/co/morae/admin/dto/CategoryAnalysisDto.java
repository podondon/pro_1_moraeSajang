package kr.co.morae.admin.dto;

public class CategoryAnalysisDto {
	private String categoryType;
	private int sucCate;
	private int ingCate;
	private int falCate;
	private int su;

	public int getSucCate() {
		return sucCate;
	}

	public void setSucCate(int sucCate) {
		this.sucCate = sucCate;
	}

	public int getIngCate() {
		return ingCate;
	}

	public void setIngCate(int ingCate) {
		this.ingCate = ingCate;
	}

	public int getFalCate() {
		return falCate;
	}

	public void setFalCate(int falCate) {
		this.falCate = falCate;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
}
