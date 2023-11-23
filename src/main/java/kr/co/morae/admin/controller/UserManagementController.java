package kr.co.morae.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.admin.service.UserManagementService;
import kr.co.morae.user.dto.UserDto;

@Controller
public class UserManagementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired UserManagementService service;
	
	
	
	@RequestMapping(value = "/admin/adminUser")
	public String adminUser() {		
		//return "home";
		return "admin/adminUser";
	}
	
	@RequestMapping(value = "/admin/adminUserDetail")
	public String adminUserDetail(@RequestParam String userid,@RequestParam String state,@RequestParam String auth,Model model) {		
		logger.info("회원정보 호출");
		logger.info("파라미터 : "+userid+"/"+state+"/"+auth);
		
		HashMap<String, Object> list = service.userdetail(userid);
		
		
		model.addAttribute("info",list);		
		model.addAttribute("state", state);
		model.addAttribute("auth", auth);
		logger.info("list : "+list);
		logger.info("state : "+state);
		logger.info("auth : "+auth);
		//return "home";
		return "admin/adminUserDetail";
	}
	
	// 회원 상세 보기 -----------------------------------------------------------------------------------------------------------------------------------
	
		@RequestMapping(value = "admin/userDetail.ajax/detail")
		@ResponseBody
		public HashMap<String,Object> userhislist (@RequestParam String userId,Model model,HttpSession session){		
			logger.info("user detail 권한 설정 밑 차단 ");
			
			HashMap<String, Object> result = new HashMap<String, Object>();		
			
			// 로그인 된 아이디
			UserDto dto = (UserDto) session.getAttribute("userInfo");
			String gardid = "";
			logger.info("gardid :"+gardid);
			gardid = dto.getUserId();
			logger.info("gardid :"+gardid);
			if(gardid == "") {
				gardid ="test1";
			} //아이디 미입력 방지 구간 나중에 삭제
			String loginst = dto.getAuthType();// 로그인 아이디 권한
			int logstate = 0;
			logger.info("로그인 권한 : "+loginst);
			if (loginst.equals("최고 관리자")) {
				logstate = 1;
			}			
			
			result.put("gardid", gardid);
			result.put("logstate", logstate);
			
			logger.info("userId : "+userId); //신고 번호
			//ArrayList<HashMap<String, Object>> list = service.hislist(reportNo);
			
			//result.put("list", list);
			//result.put("size", list.size());
			
			logger.info("result :"+result); //신고 번호
			
			return result;
		}
		
		@RequestMapping(value = "admin/userDetail.ajax/UBhis")
		@ResponseBody
		public HashMap<String,Object> UBhis (@RequestParam String userId){		
			logger.info("차단 히스토리 리스트 ");
			logger.info("userId : "+userId); //신고 번호
			
			HashMap<String, Object> result = new HashMap<String, Object>();			
			ArrayList<HashMap<String, Object>> list = service.UBhislist(userId);		
			
			result.put("list", list);
			result.put("size", list.size());			
			logger.info("result :"+result); //신고 번호
			
			return result;
		}
		
		@RequestMapping(value = "admin/userDetail.ajax/authsave")
		@ResponseBody
		public HashMap<String,Object> authsave (@RequestParam String userId,@RequestParam String auth){		
			logger.info("authsave 권한 저장 ");
			
			logger.info("userId : "+userId); //아이디
			logger.info("auth : "+auth); //아이디
			
			if(auth.equals("관리자")) {				
				service.gardsave(userId);
			}else {
				service.nomaluser(userId);	}		
			
			return null;
		}
		
		@RequestMapping(value = "admin/userDetail.ajax/statesave")
		@ResponseBody
		public HashMap<String,Object> statesave (@RequestParam String userId,@RequestParam String state
				,@RequestParam String statehis,HttpSession session){		
			logger.info("authsave 권한 저장 ");
			
			logger.info("userId : "+userId); //아이디
			logger.info("state : "+state); //상태
			logger.info("statehis : "+statehis); //처리 히스토리
			// 처리자 아이디
			UserDto dto = (UserDto) session.getAttribute("userInfo");
			String gardid = "";
			logger.info("gardid :"+gardid);
			gardid = dto.getUserId();
			logger.info("gardid :"+gardid);			
			
			if(state.equals("미차단")) {				
				service.statedel(userId);
				service.hisasave(userId,gardid,statehis);
			}else { // 차단
				service.stateins(userId);
				service.hisasave(userId,gardid,statehis);
			}
			
			return null;
		}
	
	
	//-------------------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "admin/userMgmt.ajax/list")
	@ResponseBody
	public HashMap<String,Object> userlist (@RequestParam String page,Model model){		
		logger.info("회원관리 list");
		
		HashMap<String, Object> result = new HashMap<String, Object>();		
		logger.info("page : "+page); //페이지
		
		ArrayList<UserDto> list = service.userlist(page);				
		result.put("list", list);
		result.put("size", list.size());		
		
		int allnum = service.allnum()+1;
		
		result.put("currpage",page);
		result.put("pages",allnum);
		
		logger.info("result :"+result); //신고 번호
		
		return result;
	}
	
	
	
	@RequestMapping(value = "admin/userMgmt.ajax/reserch")
	@ResponseBody
	public HashMap<String,Object> reserch (@RequestParam String page,@RequestParam String userId,Model model){		
		logger.info("검색 list");
		
		HashMap<String, Object> result = new HashMap<String, Object>();		
		logger.info("page : "+page); //페이지
		
		ArrayList<UserDto> list = service.reserch(userId);
		
		result.put("list", list);
		result.put("size", list.size());
		
		logger.info("result :"+result); //신고 번호
		
		return result;
	}
	
	
	
	
	
	
	
	
	

}
