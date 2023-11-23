package kr.co.morae.mypage.dao;

import java.util.ArrayList;

import kr.co.morae.mypage.dto.PointChargeDto;
import kr.co.morae.mypage.dto.PointDto;

public interface PointDao {

	int checkUser(String userId, String name);

	int chargeGo(String userId, String name, String chargePrice);

	int myPoint(String userId);

	ArrayList<PointDto> useList(String userId, int offset);

	int usePages(String userId);

	ArrayList<PointChargeDto> chargeList(String userId, int offset);

	int chargePages(String userId);
}
