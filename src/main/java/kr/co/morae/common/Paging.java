package kr.co.morae.common;

public class Paging {

	public int getTotalPage(int totalCnt, int showPagingNum) {
		int total = 0;
		if(totalCnt%showPagingNum==0) {
			return total = totalCnt/showPagingNum;
		}else if(totalCnt <= showPagingNum){
			return 1;
		}else {
			return total = (totalCnt/showPagingNum)+1;
		}
	}
}
