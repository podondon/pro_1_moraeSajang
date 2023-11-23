package kr.co.morae.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.morae.message.dao.MessageDao;
import kr.co.morae.message.dto.MessageDto;

@Service
public class MessageService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MessageDao dao;

	public int nameCheck(String nickName, String userId) {
		int check = 0;
		String identification = dao.nameCheck(nickName);
		if(userId.equals(identification)) {
			check = 1;
		}else if(identification == null) {
			check = 2;
		}else{
			check = 3;
		}
		return check;
	}

	public int msgSend(String content, String userId, String nickName) {
		int row = 0;
		String rcvId = dao.nickNameId(nickName);
		// logger.info("받는 아이디 : "+rcvId+" / 보내는 아이디 : "+userId);
		if(!rcvId.equals(userId)) {
			row = dao.msgSend(content, userId, rcvId);
		}
		return row;
	}

	public HashMap<String, Object> rcvList(String userId, String page) {
		logger.info("접속회원 아이디 : "+userId);
		int p = Integer.parseInt(page);
		int offset = (p*5)-5;
		ArrayList<MessageDto> list = dao.rcvList(userId, offset);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pages = dao.rcvPages(userId);
		
		// logger.info("받은 쪽지함 만들 수 있는 총 페이지 수 : "+pages);
		map.put("pages", pages);
		map.put("rcvList", list);
		return map;
	}

	public HashMap<String, Object> sendList(String userId, String page) {
		logger.info("접속회원 아이디 : "+userId);
		int p = Integer.parseInt(page);
		int offset = (p*5)-5;
		ArrayList<MessageDto> list = dao.sendList(userId, offset);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int pages = dao.sendPages(userId);
		
		// logger.info("보낸 쪽지함 만들 수 있는 총 페이지 수 : "+pages);
		map.put("pages", pages);
		map.put("sendList", list);
		return map;
	}

	public MessageDto msgDetail(String messagesNo) {
		return dao.msgDetail(messagesNo);
	}

	public void msgRead(String messagesNo) {
		dao.msgRead(messagesNo);
	}

	public void msgDel(String messagesNo) {
		dao.msgDel(messagesNo);
	}

	public HashMap<String, Object> msgAlram(String userId) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		int cnt = dao.msgAlram(userId);
		// logger.info("N의 갯수 : "+cnt);
		result.put("cnt", cnt);
		return result;
	}

	public void msgRcvAllDel(String userId) {
		dao.msgRcvAllDel(userId);
	}

	public void msgSendAllDel(String userId) {
		dao.msgSendAllDel(userId);
	}
}
