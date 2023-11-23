package kr.co.morae.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.ReportManagementDao;
import kr.co.morae.admin.dto.ReportManagementDto;




@Service
public class ReportManagementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportManagementDao dao;
	
	
	public ArrayList<ReportManagementDto> listall(String page) {
		int offset = (Integer.parseInt(page)-1)*10;
		logger.info("offset : "+offset);
		return dao.listall(offset);
	}


	public int allnum() {
		return dao.allnum();
	}



	public ArrayList<ReportManagementDto> liststate(String pageState, String page) {
		int p = Integer.parseInt(page);	
		int offset = (p-1)*10;		
		return dao.liststate(pageState,offset);
	}


	public int statenum(String pageState) {
		return dao.statenum(pageState);
	}


	public ArrayList<ReportManagementDto> reserchallB(int uniqueNum, String page) {
		int p = Integer.parseInt(page);	
		int offset = (p-1)*10;		
		return dao.reserchallB(uniqueNum,offset);
	}


	public ArrayList<ReportManagementDto> reserchallR(int uniqueNum, String page) {
		int p = Integer.parseInt(page);	
		int offset = (p-1)*10;		
		
		return dao.reserchallR(uniqueNum,offset);
	}


	public int renum(int uniqueNum) {
		return dao.renum(uniqueNum);
	}


	public ArrayList<ReportManagementDto> reserchstateB(String uniqueNo, String pageState, String page) {
		int p = Integer.parseInt(page);	
		int offset = (p-1)*10;		
		return dao.reserchstateB(uniqueNo,pageState,offset);
	}


	public ArrayList<ReportManagementDto> reserchstateR(String uniqueNo, String pageState, String page) {
		int p = Integer.parseInt(page);	
		int offset = (p-1)*10;
		return dao.reserchstateR(uniqueNo,pageState,offset);
	}


	public ReportManagementDto reportDetailB(int idx) {		
		return dao.reportDetailB(idx);
	}


	public ReportManagementDto reportDetailR(int idx) {
		return dao.reportDetailR(idx);
	}


	public void hisstatech(String hisstate, String reportNo) {
		dao.hisstatech(hisstate,reportNo);
	}


	public void inserthistory(String reportNo, String content, String gardid) {
		dao.inserthistory(reportNo,content,gardid);		
	}


	public ArrayList<HashMap<String, Object>> hislist(String reportNo) {
		int reportnum = Integer.parseInt(reportNo);
		return dao.hislist(reportnum);
	}


	public int uninum(String uniquenum) {		
		return dao.uninum(uniquenum);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
