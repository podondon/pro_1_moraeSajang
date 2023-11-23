package kr.co.morae.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.mypage.service.MypageService;
import kr.co.morae.user.dto.UserDto;
@Controller
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MypageService service;
	
	@RequestMapping(value="/mypage")
	public String mypage() {
		logger.info("마이 페이지 이동 요청");
		return "mypage/myPage";
	}

	@RequestMapping(value="/mypage/myInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> myInfo(Model model, HttpSession session){
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		HashMap<String, Object> map = service.myInfo(userId);
		return map;
	}
	
	@RequestMapping(value="/mypage/alarmSet.ajax")
	@ResponseBody
	public int alarmSet(Model model, HttpSession session, @RequestParam int alarmSetNo) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int row = 0;
		if(alarmSetNo == 0) {
			row = service.alarmOff(userId);
		}else {
			row = service.alarmOn(userId);	
		}
		
		return row;
	}
	
	@RequestMapping(value="/mypage/alarmToggle.ajax")
	@ResponseBody
	public int alarmToggle(Model model, HttpSession session) {
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int row = service.alarmToggle(userId);
		return row;
	}
	
	
	
	
	
	@RequestMapping(value="/mypage/overnickname")
	@ResponseBody 	
	public int overnickname(@RequestParam String nickname) {
		int use4 = service.overnickname(nickname);
		logger.info("사용 가능 여부 : "+use4);			
		return use4;
	}

	
	@RequestMapping(value="/mypage/profilRetouch")
	public String profilRetouch(Model model,HttpSession session) {		
		return "mypage/profilRetouch";
	}
	
	
	@RequestMapping(value="/mypage/update", method = RequestMethod.POST) //수정 글쓰기 페이지
	@ResponseBody
	public HashMap<String, Object> update( @RequestParam HashMap<String, String> parmas,
			HttpSession session){
		logger.info("params : "+parmas);
		HashMap<String, Object> res = new HashMap<String, Object>();	
		int row = service.update(parmas);		
		res.put("success", row);		
		return res;
	}
	
	
	
	
}	
