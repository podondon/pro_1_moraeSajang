package kr.co.morae.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.mypage.service.MyGroupBuyService;
import kr.co.morae.user.dto.UserDto;

@Controller
@RequestMapping("/mypage/groupBuy")
public class MyGroupBuyController {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MyGroupBuyService myGbService;
	
	@GetMapping("/gbList")
	public String groupBuyForm() {
		return "mypage/groupHistory";
	}
	
	/*
	 * 참여, 모집 한 공구 글 리스트 불러오기
	 */
	@GetMapping("/gbList.ajax")
	@ResponseBody
	public HashMap<String, Object> getMyGbList(HttpSession session, String listType, int page){
		log.info("------------- getMyGbList ---------------");
	
		log.info("session + "+session.getAttribute("userInfo"));
		UserDto info = (UserDto) session.getAttribute("userInfo");
		log.info("params : " + listType + ", " + info.getUserId());
		log.info("params : " + listType + ", " + Integer.toString(page));
		
		HashMap<String, Object> result = myGbService.getMyGbList(info.getUserId(), listType, page);
		
		log.info("------------- end ---------------");
		return result;
	}
	
	/*
	 * 공구 참여 완료
	 */
	@GetMapping("/gbComplete.ajax")
	@ResponseBody
	public HashMap<String, Object> completeGb(HttpSession session, int gbNo){
		log.info("------------- getMyGbList ---------------");
		
		UserDto dto = (UserDto)session.getAttribute("userInfo");
		log.info("params : " + gbNo);
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		boolean success = myGbService.gbComplete(dto.getUserId(), gbNo);
		if(success) {
			result.put("isComplete", "success");
			return result;
		}
		
		result.put("isComplete", "fail");
		log.info("------------- end ---------------");
		return result;
	}
	
	
	
	@RequestMapping(value = "/review")
	public String Ratingpage(HttpSession session, Model model, 
	@RequestParam String gbNo) {
		session.setAttribute("gbNo",gbNo);
		return "mypage/ratingPage";	
	}
	
	
	
	@RequestMapping(value = "/Rating", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> ratin(Model model,@RequestParam String ratings,
			HttpSession session){	
		log.info("------------- ratin-------------");
		String gbNo = (String) session.getAttribute("gbNo");
		UserDto userInfo = (UserDto) session.getAttribute("userInfo");
		String reviewerId = userInfo.getUserId();
		int rat = myGbService.ratin(gbNo,reviewerId,ratings);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rat",rat);
		log.info("gbNo:"+gbNo);
		log.info("retings:"+ratings);
		model.addAttribute("rat",rat);
		session.removeAttribute(gbNo);
		log.info("------------- ratin end -------------");
		return map;		 	
	}
	
	

	

}
