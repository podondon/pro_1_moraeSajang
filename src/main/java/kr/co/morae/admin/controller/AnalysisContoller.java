package kr.co.morae.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.morae.admin.service.AnalysisService;

@Controller
public class AnalysisContoller {
	@Autowired AnalysisService service;
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/admin/analysis")
	public String adminMain() {
		return"admin/adminMain";
	}
	
	// 도넛 차트 	
	@RequestMapping(value="/admin/analysis/Adress.ajax")
	@ResponseBody
	public Map<String, Object>adminanalysisAdress(@RequestParam String dfirstSearchDate,@RequestParam String dlastSearchDate){
		return service.adminanalysisAdress(dfirstSearchDate,dlastSearchDate);
	}
	
	// 카테고리 목록 그리기
	/*
	@RequestMapping(value="/admin/analysis/drawcategory.ajax")
	@ResponseBody
	public Map<String, Object>drawcategory(){
		return service.drawcategory();
	}
	*/
	
	// 카테고리 그래프
	@RequestMapping(value="/admin/analysis/drawChartCategory.ajax")
	@ResponseBody
	public Map<String, Object>adminanalysisCategory(
			@RequestParam String cfirstSearchDate,@RequestParam String clastSearchDate){
		return service.adminanalysisCategory(cfirstSearchDate,clastSearchDate);
	}
	
	// 최다 모집자 순위표
	@RequestMapping(value="/admin/analysis/drawTopUser.ajax")
	@ResponseBody
	public Map<String, Object>adminanalysisTopUser(@RequestParam String ufirstSearchDate,@RequestParam String ulastSearchDate){
		return service.adminanalysisTopUser(ufirstSearchDate,ulastSearchDate);
	}
	
	// 충전 포인트 순위표
	@RequestMapping(value="/admin/analysis/drawTopPoint.ajax")
	@ResponseBody
	public Map<String, Object>adminanalysisTopPoint(@RequestParam String pfirstSearchDate,@RequestParam String plastSearchDate){
		return service.adminanalysisTopPoint(pfirstSearchDate,plastSearchDate);
	}
	
	// 공동구매 합계 순위표
	@RequestMapping(value="/admin/analysis/drawgbState.ajax")
	@ResponseBody
	public Map<String, Object>adminanalysisgbState(
			@RequestParam HashMap<String, Object> gbParams){
		return service.adminanalysisgbState(gbParams);
	}
}
