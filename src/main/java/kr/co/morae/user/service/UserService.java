package kr.co.morae.user.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.user.dao.UserDao;
import kr.co.morae.user.dto.UserDto;

@Service
public class UserService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserDao dao;

	public UserDto login(String id, String pw) {
		return dao.login(id, pw);
	}

	public String findId(HashMap<String, String> params) {
		return dao.findId(params);
	}

	public String findPw(HashMap<String, String> params) {
		return dao.findPw(params);
	}

	public void correctPw(String foundId, String newPw) {
		dao.correctPw(foundId, newPw);
	}

	public boolean overemail(String email) {
		boolean use1 = false;
		int cnt1 = dao.overemail(email);
		if(cnt1 == 0) {
			use1 = true;
		}		
		return use1;		
	}

	public boolean overnickname(String nickname) {
		boolean use2 = false;
		int cnt2 = dao.overnickname(nickname);
		if(cnt2 == 0) {
			use2 = true;
		}		
		return use2;
		
	}
	
	
	public boolean overlay(String id) {
		
		boolean use = false;
		int cnt = dao.overlay(id);
		if(cnt == 0) {
			use = true;
		}		
		return use;
	}
	
	public int join(HashMap<String, String> params) {
		
		int row =0;
		
		
		row = dao.insertJoinData(params);
		
		
		row= dao.insertUserAddr(params);
		
		return row;
	}
	
}
