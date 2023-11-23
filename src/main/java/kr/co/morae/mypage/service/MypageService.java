package kr.co.morae.mypage.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.mypage.dao.MypageDao;
import kr.co.morae.mypage.dto.MypageDto;

@Service
public class MypageService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MypageDao dao;
	
	public HashMap<String, Object> myInfo(String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> review = new HashMap<String, Object>();
		ArrayList<MypageDto> myInfo = dao.myInfo(userId);
		review = dao.review(userId);
		int totalPoint = dao.totalPoint(userId);
		DecimalFormat df = new DecimalFormat("0");
		df = new DecimalFormat("#,###");
		String point = df.format(totalPoint);
		map.put("review", review);
		map.put("myInfo", myInfo);
		map.put("point", point);
		return map;
	}



	public int alarmToggle(String userId) {
		return dao.alarmToggle(userId);
	}
	
	public int overnickname(String userId) {	
		return dao.overnickname(userId);
		
	}

	public int update(HashMap<String, String> parmas) {
		int row = 0;
			row = dao.updateData(parmas);
			row = dao.updateAddr(parmas);
			logger.info("row"+row);
			return row;
		}



	public int alarmOff(String userId) {
		return dao.alarmOff(userId);
	}



	public int alarmOn(String userId) {
		return dao.alarmOn(userId);
	}
		
	
	
	
}
