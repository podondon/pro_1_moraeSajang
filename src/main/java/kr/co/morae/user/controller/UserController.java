package kr.co.morae.user.controller;

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

import kr.co.morae.user.dto.UserDto;
import kr.co.morae.user.service.UserService;

@Controller
public class UserController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserService service;
	
	@RequestMapping(value = "/user/loginGo", method = RequestMethod.POST)
		public String login(@RequestParam String id, @RequestParam String pw, HttpSession session, Model model) {
			String page = "main/login";
			logger.info("id : "+id+" / pw : "+pw);
			UserDto dto =  service.login(id,pw);
			if(dto != null) { // 로그인 성공
				session.setAttribute("userInfo", dto);
				page = "redirect:/groupBuy/gbList";
				if(dto.getAuthNo() == null || dto.getAuthNo() == 3) { // 일반 사용자
					logger.info("해당 아이디 권한 : 일반사용자");
				}else if(dto.getAuthNo() == 1 || dto.getAuthNo() == 4) { // 관리자
					page = "redirect:/admin/analysis";
					logger.info("해당 아이디 권한 : "+dto.getAuthType());
				}else if(dto.getAuthNo() == 2){ // 차단된 사용자
					logger.info("해당 아이디 권한 : "+dto.getAuthType());
					session.removeAttribute("userInfo");
					model.addAttribute("msg","차단된 사용자입니다. 고객센터에 문의해주세요.");
					page = "main/login";
				}
			}else { // 로그인 실패
				model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요.");
			}
			return page;
		}
	
	@RequestMapping(value = "/user/logout")
		public String logout(HttpSession session, Model model) {
		session.removeAttribute("userInfo");
		model.addAttribute("msg","로그아웃 되었습니다.");
		return "main/main";
	}
	
	@RequestMapping(value = "/user/findId.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> findId(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		String foundId = service.findId(params);
		logger.info(foundId);
		result.put("foundId", foundId);
		return result;
	}
	
	@RequestMapping(value = "/user/findPw", method = RequestMethod.POST)
	public String findPw(@RequestParam HashMap<String, String> params, HttpSession session, Model model) {
		String page = "main/findPw";
		logger.info("params : "+params);
		String foundId = service.findPw(params);
		logger.info(foundId);
		if(foundId == null) {
			model.addAttribute("msg", "일치하는 회원의 정보가 없습니다.");
		}else {
			session.setAttribute("foundId", foundId);
			page = "redirect:correctPw";
		}
		return page;
	}
	
	@RequestMapping(value = "/user/newPw", method = RequestMethod.POST)
	public String correctPw(@RequestParam String newPw, HttpSession session, Model model) {
		String foundId = (String) session.getAttribute("foundId");
		logger.info("세션에서 가져온 ID : "+foundId);
		logger.info("새로운 비밀번호 : "+newPw);
		String page = "main/main";
		if(session.getAttribute("foundId") != null) {
			service.correctPw(foundId, newPw);
			model.addAttribute("msg","정상적으로 변경되었습니다.");
			page = "main/login";
			session.removeAttribute("foundId");
		}else {
			model.addAttribute("msg","비정상적인 접근입니다.");
		}
		return page;
	}
	

	@RequestMapping(value="/user/register")
	public String mainregister() {
		return "main/register";
	}
	

	
	@RequestMapping(value="/user/overlay")
	@ResponseBody 
	public HashMap<String, Object> overlay(@RequestParam String id) {
		boolean use = service.overlay(id);
		logger.info("사용 가능 여부: "+use);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);	
		logger.info("overlay");
		return map;
	}
	
	

	@RequestMapping(value="/user/overemail")
	@ResponseBody 
	public HashMap<String, Object> overemail(@RequestParam String email) {
		boolean use1 = service.overemail(email);
		logger.info("사용 가능 여부 : "+use1);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use1", use1);		
		return map;
	}
	
	
	
	@RequestMapping(value="/user/overnickname")
	@ResponseBody 
	
	public HashMap<String, Object> overnickname(@RequestParam String nickname) {
		boolean use2 = service.overnickname(nickname);
		logger.info("사용 가능 여부 : "+use2);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use2", use2);		
		return map;
	}
	
	@RequestMapping(value="/user/register", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
		logger.info("params : "+params);
		HashMap<String, Object> result = new HashMap<String, Object>();	
		int row = service.join(params);		
		result.put("success", row);		
		return result;
	}
	
}
