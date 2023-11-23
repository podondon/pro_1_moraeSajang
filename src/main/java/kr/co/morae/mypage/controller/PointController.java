package kr.co.morae.mypage.controller;

import java.text.DecimalFormat;
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

import kr.co.morae.mypage.service.PointService;
import kr.co.morae.user.dto.UserDto;

@Controller
public class PointController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointService service;
	
	@RequestMapping(value = "mypage/point/charge")
	   public String pointCharge(HttpSession session, Model model) {
	      String page = "mypage/pointCharge";
	      if(session.getAttribute("userInfo") == null) {
	         model.addAttribute("msg","비정상적인 접근입니다.");
	         page = "main/main";
	      }
	      return page;
	   }
	
	@RequestMapping(value = "mypage/point/history")
	public String pointHistory() {
		return "mypage/pointHistory";
	}
	
	@RequestMapping(value = "mypage/point/myPoint.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> point(HttpSession session, Model model){
		HashMap<String, Object> result = new HashMap<String, Object>();
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		int point = service.myPoint(userId);
		DecimalFormat df = new DecimalFormat("0");
        df = new DecimalFormat("#,###");
        String myPoint = df.format(point);
		result.put("point", myPoint);
		return result;
	}
	
	@RequestMapping(value = "mypage/point/chargeGo", method = RequestMethod.POST)
		public String chargeGo(@RequestParam String name, @RequestParam String chargePrice, HttpSession session, Model model) {
		logger.info("입금자명 : "+name+" / 충전금액 : "+chargePrice);
		String page = "mypage/pointCharge";
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		logger.info(userId);
		int row = service.chargeGo(userId, name, chargePrice);
		if(row==1) {
			model.addAttribute("msg","충전이 완료되었습니다.");
	         page="mypage/pointHistory";
	      }else {
	         model.addAttribute("msg","입금자명이 일치하지 않습니다.");
	      }
			return page;
		}
	
	@RequestMapping(value = "mypage/point/useListCall.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> useListCall(@RequestParam String page, HttpSession session){
		logger.info("page : "+page);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		return service.useList(page, userId);
	}
	
	@RequestMapping(value = "mypage/point/chargeListCall.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> chargeListCall(@RequestParam String page, HttpSession session){
		logger.info("page : "+page);
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String userId = userInfo.getUserId();
		return service.chargeList(page, userId);
	}
	
}
