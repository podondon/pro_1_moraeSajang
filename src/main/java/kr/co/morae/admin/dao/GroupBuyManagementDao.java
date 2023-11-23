package kr.co.morae.admin.dao;

import java.util.ArrayList;

import kr.co.morae.groupbuy.dto.GroupBuyDto;

public interface GroupBuyManagementDao {

	ArrayList<GroupBuyDto> adminGroupBuyList(int i, int offset);

	int adminGroupBuyListtotalPage(int i);

	ArrayList<GroupBuyDto> adminGroupBuycheckList(String searchblock, int i, int offset);

	int adminGroupBucheckListtotalPage(int i, String searchblock);

	ArrayList<GroupBuyDto> adminGroupBuySerUserList(String seruser, int offset, int i);

	int adminGroupBuyListSerUsertotalPage(int i, String seruser);

	ArrayList<GroupBuyDto> adminGroupBuySerUserCheckList(String searchblock, String seruser, int i, int offset);

	int adminGroupBuySerUserCheckListtotalPage(int i, String searchblock, String seruser);

	ArrayList<GroupBuyDto> adminGroupBuyIntList(String firstSearchDateValue, String lastSearchDateValue, int i,
			int offset);

	int adminGroupBuyListInttotalPage(int i, String firstSearchDateValue, String lastSearchDateValue);

	ArrayList<GroupBuyDto> adminGroupBuycheckIntList(String searchblock, String firstSearchDateValue,
			String lastSearchDateValue, int i, int offset);

	int adminGroupBucheckIntListtotalPage(int i, String searchblock, String firstSearchDateValue,
			String lastSearchDateValue);

	ArrayList<GroupBuyDto> adminGroupBuySerUserIntList(String seruser, String firstSearchDateValue,
			String lastSearchDateValue, int i, int offset);

	int adminGroupBuyIntListSerUsertotalPage(int i, String seruser, String firstSearchDateValue,
			String lastSearchDateValue);

	ArrayList<GroupBuyDto> adminGroupBuySerUserCheckIntList(String searchblock, String seruser,
			String firstSearchDateValue, String lastSearchDateValue, int i, int offset);

	int adminGroupBuySerUserCheckIntListtotalPage(int i, String searchblock, String seruser,
			String firstSearchDateValue, String lastSearchDateValue);

	GroupBuyDto admingbdetail(int i);

	int adminBlockState(String blockState, String gbNo);

	int admingbState(String gbNo);

	int admingbHis(String gbNo, String formattedDate);

	int admincount(String gbNo);



}
