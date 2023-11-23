package kr.co.morae.alarm.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.alarm.dao.AlarmDao;
import kr.co.morae.alarm.dto.AlarmDto;

@Service
public class AlarmService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmDao dao;
	
	public ArrayList<AlarmDto> alarm(String userId) {
		return dao.alarm(userId);
	}
	
	public int alarmRemove() {
		return dao.alarmRemove();
	}
	
	public int alarmUpdate(String userId) {
		ArrayList<AlarmDto> updateGbNo = dao.alarmUpdate(userId);
		int row = 0;
		if(updateGbNo.size()>0) {
			for (AlarmDto newNo : updateGbNo) {
				logger.info("newNo: "+newNo.getGbNo());
				String newgbNo = ""+newNo.getGbNo();
				dao.alarmHistoryup(userId, newgbNo);
				row++;
			}
		}
		return row;
	}
	
	public int alarmRead(String userId, int alarmChk) {
		return dao.alarmRead(userId,alarmChk);
	}


	public int alarmReadAll(String userId) {
		return dao.alarmReadAll(userId);
	}
}
