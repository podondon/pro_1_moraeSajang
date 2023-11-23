package kr.co.morae.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.admin.dao.UserManagementDao;
import kr.co.morae.admin.dto.AuthDto;
import kr.co.morae.user.dto.UserDto;

@Service
public class UserManagementService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired UserManagementDao dao;
	
	
	public ArrayList<UserDto> userlist(String page) {		
		
		int pages = Integer.parseInt(page);
		int offset = (pages-1)*10;
		if (pages>1) {
			offset=(pages-1)*10-1;
		}
		logger.info("offset : "+offset);		
		
		ArrayList<UserDto> list = dao.userlist(offset);		
		ArrayList<AuthDto> auth = dao.authlist();
		
		for (int i = 0; i < list.size(); i++) {			
			for (int j = 0; j < auth.size(); j++) {
				
				if (list.get(i).getUserId().equals(auth.get(j).getUserId()) ) {
					logger.info("userIdCheck");
					if(auth.get(j).getAuthType()!=null && (auth.get(j).getAuthNo() == 1 || auth.get(j).getAuthNo() == 4)) {
						logger.info("권한 : "+auth.get(j).getAuthType());
						list.get(i).setAuthType(auth.get(j).getAuthType());
					}
					if(auth.get(j).getAuthType()!=null &&(auth.get(j).getAuthNo() == 2)) {
						logger.info("상태 : "+auth.get(j).getAuthType());
						list.get(i).setState(auth.get(j).getAuthType());
					}
				}				
			}

		}		
		logger.info("list : "+list);
		
		
		return list;
	}
	
	public String auth() {
		return dao.auth();
	}


	public int allnum() {
		
		return dao.allnum();
	}


	public ArrayList<UserDto> reserch(String userId) {
		
		ArrayList<UserDto> relist = dao.reserchuser(userId);
		ArrayList<AuthDto> auth = dao.reserchauth();
		
		for (int i = 0; i < relist.size(); i++) {			
			for (int j = 0; j < auth.size(); j++) {
				
				if (relist.get(i).getUserId().equals(auth.get(j).getUserId()) ) {
					logger.info("userIdCheck");
					if(auth.get(j).getAuthType()!=null && (auth.get(j).getAuthNo() == 1 || auth.get(j).getAuthNo() == 4)) {
						logger.info("권한 : "+auth.get(j).getAuthType());
						relist.get(i).setAuthType(auth.get(j).getAuthType());
					}
					if(auth.get(j).getAuthType()!=null &&(auth.get(j).getAuthNo() == 2)) {
						logger.info("상태 : "+auth.get(j).getAuthType());
						relist.get(i).setState(auth.get(j).getAuthType());
					}
				}				
			}

		}		
		
		return relist;
	}


	public HashMap<String, Object> userdetail(String userid) {
		return dao.userdetail(userid);
	}




	public void gardsave(String userId) {
		dao.gardsave(userId);
		
	}


	public void nomaluser(String userId) {
		dao.nomaluser(userId);
		
	}


	public void statedel(String userId) {
		dao.statedel(userId);
		
	}


	public void stateins(String userId) {
		dao.stateins(userId);
		
	}


	public void hisasave(String userId, String gardid, String statehis) {
		dao.hisasave(userId,gardid,statehis);
		
	}

	public ArrayList<HashMap<String, Object>> UBhislist(String userId) {
		return dao.UBhislist(userId);
	}


	
	
	
}
