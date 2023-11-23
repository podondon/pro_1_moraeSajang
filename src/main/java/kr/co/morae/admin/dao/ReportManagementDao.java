package kr.co.morae.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.morae.admin.dto.ReportManagementDto;

public interface ReportManagementDao {

	ArrayList<HashMap<String, Object>> list(int pagenum, int pages);

	int num(String pageState);

	ArrayList<ReportManagementDto> listall(int offset);

	int allnum();

	ArrayList<ReportManagementDto> liststate(String pageState, int offset);

	int statenum(String pageState);

	ArrayList<ReportManagementDto> reserchallB(int uniqueNum, int offset);

	ArrayList<ReportManagementDto> reserchallR(int uniqueNum, int offset);

	int renum(int uniqueNum);

	ArrayList<ReportManagementDto> reserchstateB(String uniqueNo, String pageState, int offset);

	ArrayList<ReportManagementDto> reserchstateR(String uniqueNo, String pageState, int offset);


	ReportManagementDto reportDetailB(int idx);

	ReportManagementDto reportDetailR(int idx);

	void hisstatech(String hisstate, String reportNo);

	void inserthistory(String reportNo, String content, String gardid);

	ArrayList<HashMap<String, Object>> hislist(int reportnum);

	int uninum(String uniquenum);

	

	

}
