package kr.co.morae.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.alarm.service.AlarmService;
import kr.co.morae.user.dto.UserDto;
import kr.co.morae.alarm.dto.AlarmDto;

@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmService service;
	
	@RequestMapping(value="/alarm") // 테스트용 임시
	public String alarm() {
		return "common/alarm";
	}
	
	@RequestMapping(value="/alarm/call.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmCall(Model model, HttpSession session, @RequestParam int no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int authNo = no;
		String alarmState = "";
		if(authNo == 0) {
			ArrayList<AlarmDto> alarmList = service.alarm(userId);
			map.put("alarmList",alarmList);
			alarmState = "activate";
			map.put("alarmState", alarmState);
		}else {
			alarmState = "Disabled";
			map.put("alarmState", alarmState);
		}
		return map;
	}
	
	@RequestMapping(value="/alarm/remove.ajax")
	@ResponseBody
	public int alarmRemove(Model model, HttpSession session) {
		int row = 0;
		row = service.alarmRemove();
		logger.info("제거된 히스토리: "+row);
		return row;
	};
	
	@RequestMapping(value="/alarm/update.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmUpdate(Model model, HttpSession session) {
		int row = 0;
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		row = service.alarmUpdate(userId);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("row", row);
		logger.info("업데이트된 히스토리: "+row);
		return map;
	};
	
	@RequestMapping(value="/alarm/read.ajax")
	@ResponseBody
	public int alarmRead(Model model, HttpSession session, @RequestParam int alarmChk) {
		logger.info("읽음 처리할 글 번호: "+alarmChk);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int row = service.alarmRead(userId,alarmChk);
		return row;
	}
	
	@RequestMapping(value="/alarm/readAll.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmChkAll(Model model, HttpSession session) {
		logger.info("전체 읽음 처리 요청");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = 0;
		row = service.alarmReadAll(userId);
		map.put("row", row);
		return map;
	}
	
	
	
}
