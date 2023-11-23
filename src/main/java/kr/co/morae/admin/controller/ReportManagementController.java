package kr.co.morae.admin.controller;

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

import kr.co.morae.admin.dto.ReportManagementDto;
import kr.co.morae.admin.service.ReportManagementService;
import kr.co.morae.user.dto.UserDto;





@Controller
public class ReportManagementController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportManagementService service;
	
	
	// 신고관리 인트로
	@RequestMapping(value = "/admin/adminReport")
	public String adminReport() {		
		//return "home";
		return "admin/adminReport";
	}
	
	//신고 상세 jsp
	@RequestMapping(value = "admin/adminReportDetail")
	public String adminReportDetail(@RequestParam int idx, @RequestParam String type, Model model) {		
		//return "home";
		logger.info("신고 디테일 넣기"+idx);
		logger.info("idx : "+idx);
		logger.info("type : "+type);
		ReportManagementDto dto = new ReportManagementDto();
		if(type.equals("글")) {
			dto = service.reportDetailB(idx);				
		}else {
			dto = service.reportDetailR(idx);			
		}
		logger.info("dto : "+dto);
		String useruniqueNo = Integer.toString(dto.getUniqueNo());
		logger.info("useruniqueNo : "+useruniqueNo);
		model.addAttribute("uniqueNo",useruniqueNo);
		
		if(type.equals("글")) {
			useruniqueNo = useruniqueNo+"B";
		}else {
			useruniqueNo = useruniqueNo+"R";
		}
		logger.info("useruniqueNo : "+useruniqueNo);
				
		String userstate = dto.getReportstate(); // 글 상태
		if(userstate.equals("N")) {
			userstate = "진행중";
		}else {
			userstate = "취소";
		}
		logger.info("userstate : "+userstate);		
		logger.info("useruniqueNo : "+useruniqueNo);
		logger.info("type : "+type);		
		
		model.addAttribute("type",type);
		model.addAttribute("report",dto); 
		model.addAttribute("userstate",userstate);
		model.addAttribute("useruniqueNo",useruniqueNo);
		return "admin/adminReportDetail";
	}
	
	
	@RequestMapping(value = "admin/ReportDetail.ajax/uninum")
	@ResponseBody
	public HashMap<String,Object> uninum (@RequestParam String uniquenum,Model model){		
		logger.info("댓글 번호 가져와서 서치");
		
		HashMap<String, Object> result = new HashMap<String, Object>();		
		logger.info("uniquenum : "+uniquenum); //댓글 번호
		int gbNo = service.uninum(uniquenum);
		
		result.put("gbNo", gbNo);
		
		logger.info("result :"+result); //신고 번호
		
		return result;
	}
	
	
	
	// 신고 히스토리 리스트
	@RequestMapping(value = "admin/ReportDetail.ajax/hislist")
	@ResponseBody
	public HashMap<String,Object> hislist (@RequestParam String reportNo,Model model){		
		logger.info("히스토리 list");
		
		HashMap<String, Object> result = new HashMap<String, Object>();		
		logger.info("reportNo : "+reportNo); //신고 번호
		ArrayList<HashMap<String, Object>> list = service.hislist(reportNo);
		
		result.put("list", list);
		result.put("size", list.size());
		
		logger.info("result :"+result); //신고 번호
		
		return result;
	}
	
	//신고 히스토리 인서트
	@RequestMapping(value = "admin/ReportDetail.ajax/historyput")
	@ResponseBody
	public HashMap<String,Object> historyput (@RequestParam String hisstate,@RequestParam String content,
			@RequestParam String reportNo,Model model,HttpSession session){		
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("히스토리 insert");
		logger.info("hisstate :"+hisstate); // 신고 처리 상태
		logger.info("content :"+content); //신고 사유
		logger.info("reportNo :"+reportNo); //신고 번호
		UserDto dto = (UserDto) session.getAttribute("userInfo");
		String gardid = "";
		gardid = dto.getUserId();
		logger.info("gardid :"+gardid);
		if(gardid == "") {
			gardid ="test1";
		} //아이디 미입력 방지 구간 나중에 삭제
		
		service.hisstatech(hisstate,reportNo);
		service.inserthistory(reportNo,content,gardid);				
		logger.info("신고 히스토리 입력 완료"); //신고 번호
		
		//result.put("hisstate", gardid);
		// result.put("hisnum", gardid);
		
		return result;
	}
	
	 // 신고 리스트
	@RequestMapping(value = "admin/reportMgmt.ajax/list")
	@ResponseBody
	public HashMap<String,Object> reportMgmtlist (Model model,@RequestParam String pageState,@RequestParam String page) {
		logger.info("회원 리스트 호출");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("page상태 : "+pageState);
		logger.info("page넘버 : "+page);
		// logger.info("page넘버 : "+pages);
		
		if (pageState.equals("전체")) {
			logger.info("회원 리스트 호출/all");
			ArrayList<ReportManagementDto> list = service.listall(page);
			logger.info("num"+list.toString());
			int allnum = service.allnum()+1;
			result.put("currpage",page);
			result.put("pages",allnum);
			result.put("list", list);
			result.put("size", list.size());
			logger.info("result : " +result);			
			
		}else {
			logger.info("회원 리스트 호출liststate");
			
			ArrayList<ReportManagementDto> list = service.liststate(pageState,page);
			int statenum = service.statenum(pageState)+1;
			logger.info("statenum : "+statenum);
			result.put("currpage",page);
			result.put("pages",statenum);
			result.put("list", list);
			result.put("size", list.size());
			logger.info("result : " +result);
		}
		
		
		
		
		return result;
	}
	
	
	//신고 리스트 검색
	@RequestMapping(value = "admin/reportMgmt.ajax/reserch")
	@ResponseBody
	public HashMap<String,Object> reportMgmtreserch(Model model,@RequestParam String pageState
			,@RequestParam String page ,@RequestParam String uniqueNo) {
		logger.info("글/댓글 번호 검색");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			
		int uniqueNum = Integer.parseInt(uniqueNo.replaceAll("[^0-9]", ""));		
		String uniqueState = uniqueNo.replaceAll("[^A-Z]", "");
		logger.info("uniqueNum : "+uniqueNum);
		logger.info("uniqueState : "+uniqueState);		
		logger.info("page상태 : "+pageState);
		logger.info("page넘버 : "+page);
		logger.info("uniqueNo : "+uniqueNo);
		
		//1. 필터 기능을 위하여 전체와 상태로 나눈다 
		//2. 글과 댓글의 상태로 나눠서 확인 하고 뿌려준다  
		ArrayList<ReportManagementDto> list ;
		int num;
		if (pageState.equals("전체")) {// 필터 구분
			num= service.renum(uniqueNum)+1;
			if(uniqueState.equals("B")) {// 구분자 구분 (글)
				 list = service.reserchallB(uniqueNum,page);
			}else {
				 list = service.reserchallR(uniqueNum,page);
			}
			result.put("currpage",page);
			result.put("pages",num);
			result.put("list", list);
			result.put("size", list.size());
		}else {// 필터 >> 처리 / 미처리
			//num=service.
			if(uniqueState.equals("B")) {// 구분자 구분 (글)
				list= service.reserchstateB(uniqueNo,pageState,page);
			}else {
				 list = service.reserchstateR(uniqueNo,pageState,page);
			}
			result.put("currpage",page);
			//result.put("pages",num);
			result.put("list", list);
			result.put("size", list.size());
		}
		
		} catch (NumberFormatException e) {
			String msg = "글/댓글 번호를 다시 확인 해주세요.";
			model.addAttribute("msg",msg);
			
		}
		
		
		logger.info("result : " +result);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
