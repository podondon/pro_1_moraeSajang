package kr.co.morae.groupbuy.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.morae.groupbuy.dto.CommentDto;
import kr.co.morae.groupbuy.dto.GbStateCheckDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.groupbuy.dto.ReportDto;
import kr.co.morae.groupbuy.dto.SearchOptionDto;

public interface GroupBuyDao {
	
	int gbRegister(GroupBuyDto dto);
	//지역 저장 dao
	int gbRegionRegister(GroupBuyDto dto);
	
	//file 저장 dao
	int gbSavePhoto(String gnNo, String photoName);
	
	GroupBuyDto getGbDetail(String gbNo, String userId);
	
	ArrayList<String> getPhotoNames(int gbNo);
	
	//공구 참여 인원 확인
	HashMap<String, String> isgbJoining(String gbNo, String userId);
	
	//공구 참여
	int gbJoin(String gbNo, String userId);
	
	
	int report(ReportDto dto);
	
	int insertPoint(int gbNo, String userId, int gbPrice, String string);
	
	void modifyGbState(int gbNo, String string, String blockState);
	
	List<GroupBuyDto> getGbList(SearchOptionDto dto);
	
	int getTotalgbCnt(SearchOptionDto dto);
	
	ArrayList<GbStateCheckDto> checkGbState();
	
	ArrayList<String> getJoinUser(int gbNo);
	
	int insertGbStateHistory(int gbNo, String reason);
	

}
