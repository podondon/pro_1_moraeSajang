package kr.co.morae.alarm.dao;

import java.util.ArrayList;

import kr.co.morae.alarm.dto.AlarmDto;


public interface AlarmDao {
	
	ArrayList<AlarmDto> alarm(String userId);

	int alarmRemove();

	ArrayList<AlarmDto> alarmUpdate(String userId);

	int alarmHistoryup(String userId, String gbNo);

	int alarmRead(String userId, int alarmChk);

	int alarmReadAll(String userId);

}
