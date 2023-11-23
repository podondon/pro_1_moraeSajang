package kr.co.morae.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.PointManagementDao;
import kr.co.morae.admin.dto.PointManagementDto;

@Service
public class PointManagementService {
Logger logger = LoggerFactory.getLogger(getClass());
@Autowired PointManagementDao dao;


public Map<String, Object> adminPointChargeDesc(String page) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> chargePointList = dao.adminPointChargeDesc(10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	
	int pages = dao.totalPage(10);
	
	map.put("currPage",page);
	map.put("pages", pages);
	map.put("list", chargePointList);
	
	return map;
}

public Map<String, Object> adminPointChargeAsc(String page) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> searchchargePointList = dao.adminPointChargeAsc(10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	int pages = dao.totalPage(10);
	map.put("currPage", page);
	map.put("pages", pages);
	map.put("list", searchchargePointList);
	return map;
}

public Map<String, Object> adminPointChargeSearchDesc(String page, String firstSearchDateValue,
		String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> chargePointList = dao.adminPointChargeSearchDesc(firstSearchDateValue,lastSearchDateValue, 10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	int pages = dao.searchtotalPage(10,firstSearchDateValue,lastSearchDateValue);
	for (PointManagementDto pointHistoryDto : chargePointList) {
		logger.info("결과:"+pointHistoryDto);
	}
	map.put("currPage", page);
	map.put("pages", pages);
	map.put("list", chargePointList);
	return map;
}

public Map<String, Object> adminPointChargeSearchAsc(String page, String firstSearchDateValue,
		String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> chargePointList = dao.adminPointChargeSearchAsc(firstSearchDateValue,lastSearchDateValue, 10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	int pages = dao.searchtotalPage(10,firstSearchDateValue,lastSearchDateValue);
	for (PointManagementDto pointHistoryDto : chargePointList) {
		logger.info("결과:"+pointHistoryDto);
	}
	map.put("currPage", page);
	map.put("pages", pages);
	map.put("list", chargePointList);
	return map;
}

public Map<String, Object> adminPointHistoryDesc(String page) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> HistoryPointList = dao.adminPointHistoryDesc(10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	logger.info(page);
	int pages = dao.totalHistoryPage(10);
	map.put("currPage",page);
	map.put("pages", pages);
	map.put("list", HistoryPointList);
	
	return map;
}

public Map<String, Object> adminPointHistoryAsc(String page) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> HistoryPointList = dao.adminPointHistoryAsc(10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	logger.info(page);
	int pages = dao.totalHistoryPage(10);
	map.put("currPage",page);
	map.put("pages", pages);
	map.put("list", HistoryPointList);
	
	return map;
}

public Map<String, Object> adminPointHistorySearchDesc(String page, String firstSearchDateValue,
		String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> HistoryPointSearchList = dao.adminPointHistorySearchDesc(firstSearchDateValue,lastSearchDateValue, 10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	int pages = dao.searchHistoryPage(10,firstSearchDateValue,lastSearchDateValue);
	map.put("currPage", page);
	map.put("pages", pages);
	map.put("list", HistoryPointSearchList);
	return map;
}

public Map<String, Object> adminPointHistorySearchAsc(String page, String firstSearchDateValue,
		String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*10;
	ArrayList<PointManagementDto> HistoryPointSearchList = dao.adminPointHistorySearchAsc(firstSearchDateValue,lastSearchDateValue, 10,offset);
	Map<String, Object> map = new HashMap<String, Object>();
	int pages = dao.searchHistoryPage(10,firstSearchDateValue,lastSearchDateValue);
	map.put("currPage", page);
	map.put("pages", pages);
	map.put("list", HistoryPointSearchList);
	return map;
}
}
