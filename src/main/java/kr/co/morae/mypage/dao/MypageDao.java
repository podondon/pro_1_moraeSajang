package kr.co.morae.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kr.co.morae.mypage.dto.MypageDto;

public interface MypageDao {

	ArrayList<MypageDto> myInfo(String userId);

	Map<String, Object> review(String userId);

	int totalPoint(String userId);

	int alarmOff(String userId);
	
	int alarmOn(String userId);
	
	int alarmToggle(String userId);
	
	int overnickname(String nickname);
	

	int updateData(HashMap<String, String> parmas);

	int updateAddr(HashMap<String, String> parmas);


}
