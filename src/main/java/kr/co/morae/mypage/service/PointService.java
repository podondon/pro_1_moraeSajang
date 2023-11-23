package kr.co.morae.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.mypage.dao.PointDao;
import kr.co.morae.mypage.dto.PointChargeDto;
import kr.co.morae.mypage.dto.PointDto;

@Service
public class PointService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointDao dao;

	public int chargeGo(String userId, String name, String chargePrice) {
		int row = 0;
		int checkNum = dao.checkUser(userId, name);
		if(checkNum>0) {
			row = dao.chargeGo(userId, name, chargePrice);
		}
		return row;
	}

	public int myPoint(String userId) {
		return dao.myPoint(userId);
	}

	public HashMap<String, Object> useList(String page, String userId) {
		int p = Integer.parseInt(page);
		int offset = (p*10)-10;
		ArrayList<PointDto> list = dao.useList(userId,offset);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pages = dao.usePages(userId);
		map.put("pages", pages);
		map.put("useList", list);
		return map;
	}

	public HashMap<String, Object> chargeList(String page, String userId) {
		int p = Integer.parseInt(page);
		int offset = (p*10)-10;
		ArrayList<PointChargeDto> list = dao.chargeList(userId,offset);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pages = dao.chargePages(userId);
		map.put("pages", pages);
		map.put("chargeList", list);
		return map;
	}


	
}
