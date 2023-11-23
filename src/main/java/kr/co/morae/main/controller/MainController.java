package kr.co.morae.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = {"/", "/main"})
	public String index(HttpSession session) {
		session.removeAttribute("userInfo");
		return "main/main";
	}
	

	@RequestMapping(value = {"/user/login"})
	public String login() {
		return "main/login";
	}
	

	@RequestMapping(value = {"/user/findId"})
	public String findId() {
		return "main/findId";
	}
	
	@RequestMapping(value = {"/user/findPw"})
	public String findPw() {
		return "main/findPw";
	}
	
	@RequestMapping(value = {"/user/correctPw"})
	public String correctPw(HttpSession session, Model model) {
		String page = "main/correctPw";
		if(session.getAttribute("foundId") == null) {
			model.addAttribute("msg","비정상적인 접근입니다.");
			page = "main/main";
		}
		return page;
	}
}
