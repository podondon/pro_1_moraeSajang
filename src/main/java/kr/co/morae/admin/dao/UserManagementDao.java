package kr.co.morae.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.morae.admin.dto.AuthDto;
import kr.co.morae.user.dto.UserDto;

public interface UserManagementDao {

	ArrayList<UserDto> userlist(int offset);

	String auth();

	int allnum();	

	HashMap<String, Object> userdetail(String userid);

	void authsave(String userId, String auth);

	void gardsave(String userId);

	

	void nomaluser(String userId);

	void statedel(String userId);

	void stateins(String userId);

	void hisasave(String userId, String gardid, String statehis);

	ArrayList<AuthDto> authlist();

	ArrayList<UserDto> reserchuser(String userId);

	ArrayList<AuthDto> reserchauth();

	ArrayList<HashMap<String, Object>> UBhislist(String userId);

	

}
