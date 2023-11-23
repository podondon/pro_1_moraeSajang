package kr.co.morae.admin.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.GroupBuyManagementDao;
import kr.co.morae.groupbuy.dao.CommentDao;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.CommentDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;


@Service
public class GroupBuyManagementService {
@Autowired GroupBuyManagementDao dao;
@Autowired GroupBuyDao gbdao;
@Autowired CommentDao commDao;
Logger logger = LoggerFactory.getLogger(getClass());

public Map<String, Object> adminGroupBuyList(String page, String searchblock) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuyList = dao.adminGroupBuyList(8,offset);		
		int pages = dao.adminGroupBuyListtotalPage(8);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuyList = dao.adminGroupBuycheckList(searchblock,8,offset);		
		int pages = dao.adminGroupBucheckListtotalPage(8,searchblock);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyList);
	}
	
	
	
	return map;
}

public Map<String, Object> adminGroupBuySerUserList(String page, String searchblock, String seruser) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuySerUserList = dao.adminGroupBuySerUserList(seruser,8,offset);		
		int pages = dao.adminGroupBuyListSerUsertotalPage(8,seruser);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuySerUserCheckList = dao.adminGroupBuySerUserCheckList(searchblock,seruser,8,offset);		
		int pages = dao.adminGroupBuySerUserCheckListtotalPage(8,searchblock,seruser);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserCheckList);
	}
	return map;
}

public Map<String, Object> adminGroupBuyIntList(String page, String searchblock, String firstSearchDateValue,
		String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuyIntList = dao.adminGroupBuyIntList(firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBuyListInttotalPage(8,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyIntList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuyIntList = dao.adminGroupBuycheckIntList(searchblock,firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBucheckIntListtotalPage(8,searchblock,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuyIntList);
	}
	return map;

}

public Map<String, Object> adminGroupBuySerUserIntList(String page, String searchblock, String seruser,
		String firstSearchDateValue, String lastSearchDateValue) {
	int offset = (Integer.parseInt(page)-1)*8;
	Map<String, Object> map = new HashMap<String, Object>();
	if(searchblock.equals("all")) {
		ArrayList<GroupBuyDto> adminGroupBuySerUserIntList = dao.adminGroupBuySerUserIntList(seruser,firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBuyIntListSerUsertotalPage(8,seruser,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserIntList);
	}else {
		ArrayList<GroupBuyDto> adminGroupBuySerUserCheckIntList = dao.adminGroupBuySerUserCheckIntList(searchblock,seruser,firstSearchDateValue,lastSearchDateValue,8,offset);		
		int pages = dao.adminGroupBuySerUserCheckIntListtotalPage(8,searchblock,seruser,firstSearchDateValue,lastSearchDateValue);
		map.put("showPage",page);
		map.put("pages", pages);
		map.put("list", adminGroupBuySerUserCheckIntList);
	}
	return map;
}

public Map<String, Object> admingbdetail(String gbNo) {
	logger.info("관리자 공구글 서비스 시작");
	gbNo = gbNo.replace("\"", "");
	HashMap<String, Object> map = new HashMap<String, Object>();
	GroupBuyDto gbDto = dao.admingbdetail(Integer.parseInt(gbNo));
	ArrayList<String> PhotoNames = gbdao.getPhotoNames(Integer.parseInt(gbNo));
	map.put("GroupBuyDto", gbDto);
	map.put("PhotoNames", PhotoNames);
	return map;
}

public Map<String, Object> adminCommentListCall(String page, String gbNo) {
	logger.info("관리자 댓글 서비스 시작");
	gbNo = gbNo.replace("\"", "");
	HashMap<String, Object> map = new HashMap<String, Object>();
	int offset = (Integer.parseInt(page)-1)*5;
	ArrayList<CommentDto> commDto = commDao.getComment(Integer.parseInt(gbNo), offset);
	int totalPage = getTotalPage(Integer.parseInt(gbNo));
	
	map.put("totalPage", Integer.toString(totalPage));
	map.put("comments", commDto);
	map.put("currPage", page);
	map.put("gbNo", gbNo);
	return map;
}
public int getTotalPage(int gbNo) {
	int totalCommentCnt = commDao.getTotalComment(gbNo);
	logger.info("totalCommentCnt : "+totalCommentCnt);
	int total = 0;
	if(totalCommentCnt%5==0) {
		return total = totalCommentCnt/5;
	}else {
		return total = (totalCommentCnt/5)+1;
	}
	 
}

public Map<String, Object> adminCommentdel(String commNo, String gbNo) {
	HashMap<String, String>params = new HashMap<String, String>();
	params.put("commNo", commNo);
	params.put("gbNo", gbNo);
	int row = commDao.deleteComment(params);
	HashMap<String, Object> result = new HashMap<String, Object>();
	
	if(row>0) {
		result.put("msg", "success");
		return result;
	}
	
	result.put("msg", "fail");
	
	return result;
}

public Map<String, Object> adminBlockState(String blockState, String gbNo) {
	HashMap<String, Object> result = new HashMap<String, Object>();
	// 글 블라인드 상태 변경
	int row = dao.adminBlockState(blockState,gbNo);
	if(blockState.equals("Y")) {		
		LocalDate nowdate = LocalDate.now();
		DateTimeFormatter fromatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = nowdate.format(fromatter);
		// 글 진행상태
		int rw = dao.admingbState(gbNo);
		
		// 글 히스트로 중복 확인
		int count = dao.admincount(gbNo);
		logger.info("count확인 : "+count);
		
		if(count==0) {		
			// 글 히스토리 작성
			int rr = dao.admingbHis(gbNo,formattedDate);
		}
		
		if(row>0) {
			result.put("msg", "success");
			return result;
		}else {
			result.put("msg", "fail");
			
			return result;			
		}
	}else {
		if(row>0) {
			result.put("msg", "success");
			return result;
		}else {
			result.put("msg", "fail");
			
			return result;
		}
	}
	
}
}
