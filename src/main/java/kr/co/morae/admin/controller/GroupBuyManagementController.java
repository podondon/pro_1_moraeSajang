package kr.co.morae.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.admin.service.GroupBuyManagementService;

@Controller
public class GroupBuyManagementController {
@Autowired GroupBuyManagementService service;
Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/admin/groupBuy")
	public String adminBoard() {
		return "admin/adminBoard";
	}

	@RequestMapping(value="/admin/groupBuy/list.ajax")
	@ResponseBody
	public Map<String, Object>adminGroupBuyList(
			@RequestParam String page,@RequestParam String searchblock
			){
		logger.info(page);
		logger.info(searchblock);
		return service.adminGroupBuyList(page,searchblock);
	}
	@RequestMapping(value="/admin/groupBuy/ser/user/list.ajax")
	@ResponseBody
	public Map<String, Object>adminGroupBuySerUserList(
			@RequestParam String page, @RequestParam String searchblock, @RequestParam String seruser){
		logger.info("확인:"+service.adminGroupBuySerUserList(page,searchblock,seruser));
		return service.adminGroupBuySerUserList(page,searchblock,seruser);
	}
	
	@RequestMapping(value="/admin/groupBuy/int/list.ajax")
	@ResponseBody
	public Map<String, Object>adminGroupBuyIntList(
			@RequestParam String page, @RequestParam String searchblock,@RequestParam String firstSearchDateValue, @RequestParam String lastSearchDateValue
			){
		return service.adminGroupBuyIntList(page,searchblock,firstSearchDateValue, lastSearchDateValue);
	}
	@RequestMapping(value="/admin/groupBuy/ser/user/int/list.ajax")
	@ResponseBody
	public Map<String, Object>adminGroupBuySerUserIntList(
			@RequestParam String page, @RequestParam String searchblock,@RequestParam String seruser,
			@RequestParam String firstSearchDateValue, @RequestParam String lastSearchDateValue
			){
		return service.adminGroupBuySerUserIntList(page,searchblock,seruser,firstSearchDateValue, lastSearchDateValue);
	}
	
	@RequestMapping(value="/admin/gbdetail")
	public String admingbdetail(@RequestParam int gbNo,Model model) {
		logger.info("글번호확인:"+gbNo);
		model.addAttribute("gbNo",gbNo);
		return "admin/adminBoardDetail";
	}
	
	@RequestMapping(value="/admin/Board/detail.ajax")
	@ResponseBody
	public Map<String, Object> admingbdetail(@RequestParam String gbNo, Model model) {
		logger.info("번호확인"+gbNo);
		model.addAttribute(service.admingbdetail(gbNo));
		return service.admingbdetail(gbNo);
	}

	@RequestMapping(value="/admin/Board/detail/comment.ajax")
	@ResponseBody
	public Map<String, Object>adminCommentListCall(@RequestParam String page,@RequestParam String gbNo){
		return service.adminCommentListCall(page,gbNo);
	}
	
	@RequestMapping(value="/admin/Board/comment/del.ajax")
	@ResponseBody
	public Map<String, Object>adminCommentdel(@RequestParam String commNo,@RequestParam String gbNo){
		logger.info("댓글 삭제 확인용"+commNo+gbNo);
		return service.adminCommentdel(commNo,gbNo);
	}
	
	@RequestMapping(value="/admin/Board/blockState.ajax")
	@ResponseBody
	public Map<String, Object>adminBlockState(@RequestParam String blockState,@RequestParam String gbNo){
		logger.info(blockState);
		logger.info("blockState 글 번호 확인: "+gbNo);
		return service.adminBlockState(blockState,gbNo);
	}
	
	
}
