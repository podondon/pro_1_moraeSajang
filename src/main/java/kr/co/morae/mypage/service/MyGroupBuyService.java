package kr.co.morae.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.common.Paging;
import kr.co.morae.emuns.GbStateEnum;
import kr.co.morae.emuns.pointReasonEnum;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.GbStateCheckDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.mypage.dao.MyGroupBuyDao;

@Service
public class MyGroupBuyService {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());		
	Paging paging = new Paging();

	private MyGroupBuyDao myGbDao;
	private GroupBuyDao gbDao;
	
	public MyGroupBuyService(MyGroupBuyDao myGbDao, GroupBuyDao gbDao) {
		this.myGbDao = myGbDao;
		this.gbDao = gbDao;
	}
	
	public HashMap<String, Object> getMyGbList(String userId, String listType, int page) {
		HashMap<String, Object> result = new HashMap<>();
		int offset = (page-1)*10;
		log.info("offset:"+Integer.toString(offset));
		ArrayList<GroupBuyDto> myGbList;
		int totalCnt;
		
		if(listType.equals("recruit")) {
			myGbList = (ArrayList<GroupBuyDto>) myGbDao.getRecuritMyGbList(userId, offset);
			log.info(Integer.toString(myGbList.size()));
			totalCnt= myGbDao.getRecruitMyGbListCnt(userId);
		}else {
			myGbList = (ArrayList<GroupBuyDto>) myGbDao.getJoinMyGbList(userId, offset);
			log.info(Integer.toString(myGbList.size()));
			totalCnt= myGbDao.getJoinMyGbListCnt(userId);
		}
		log.info("totalCnt: " +Integer.toString(totalCnt));
		int totalPage = paging.getTotalPage(totalCnt, 10);
		log.info(myGbList.toString());
		log.info(Integer.toString(totalPage));
		
		result.put("myGbList", myGbList);
		result.put("listType", listType);
		result.put("totalPage", totalPage);
		result.put("currPage", page);
		
		return result;
		
	}
	
	public boolean gbComplete(String userId, int gbNo) {
		
		int row = myGbDao.setComplete(gbNo, userId);
		log.info("success complete");
		if(row>0) {
			stateCheck(gbNo);
			return true;
		}
		return false;
	}
	
	public void stateCheck(int gbNo) {
		GbStateCheckDto checkDto = myGbDao.checkComplete(gbNo);
		log.info("success stateCheck");
		log.info(checkDto.toString());
		
		if(checkDto.getRecruitPeople() == checkDto.getCompleteCnt()) {
			gbDao.modifyGbState(gbNo, GbStateEnum.COMPLETE.getState(), "N");
			gbDao.insertGbStateHistory(gbNo, GbStateEnum.COMPLETE.getState());
			int totalPrice = checkDto.getCompleteCnt()*checkDto.getJoinPrice();
			log.info("gbNo:"+gbNo+"userId:"+checkDto.getUserId()+", totalPrice");
			int row = gbDao.insertPoint(gbNo, checkDto.getUserId(), totalPrice, pointReasonEnum.CALCULATE.getState());
			
			log.info("row:"+row);
			log.info("success modifyState");
		}
	}

	public int ratin(String gbNo, String reviewerId, String ratings) {	
		return myGbDao.ratin(gbNo,reviewerId,ratings);
	}

	
	


	


	

	


	

	
	

}
