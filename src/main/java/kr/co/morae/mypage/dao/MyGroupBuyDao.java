package kr.co.morae.mypage.dao;

import java.util.List;

import kr.co.morae.groupbuy.dto.GbStateCheckDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface MyGroupBuyDao {
	
	GbStateCheckDto checkComplete(int gbNo);
	
	int setComplete(int gbNo, String userId);

	int ratin(String gbNo, String reviewerId, String ratings);
	
	int getRecruitMyGbListCnt(String userId);
	
	int getJoinMyGbListCnt(String userId);
	List<GroupBuyDto> getJoinMyGbList(String userId, int offset);
	List<GroupBuyDto> getRecuritMyGbList(String userId, int offset);
	
}
