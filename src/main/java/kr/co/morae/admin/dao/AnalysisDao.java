package kr.co.morae.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.morae.admin.dto.CategoryAnalysisDto;
import kr.co.morae.admin.dto.GroupBuyAnalysisDto;
import kr.co.morae.admin.dto.PointAnalysisDto;
import kr.co.morae.admin.dto.RecruitmentAnalysisDto;
import kr.co.morae.admin.dto.RegionAnalysisDto;

public interface AnalysisDao {

	ArrayList<RegionAnalysisDto> adminanalysisAdress(String dfirstSearchDate, String dlastSearchDate);

	ArrayList<CategoryAnalysisDto> categorydraw();

	ArrayList<CategoryAnalysisDto> adminanalysisCategory(String cfirstSearchDate, String clastSearchDate);

	ArrayList<RecruitmentAnalysisDto> adminanalysisTopUser(String ufirstSearchDate, String ulastSearchDate);

	ArrayList<PointAnalysisDto> adminanalysisTopPoint(String pfirstSearchDate, String plastSearchDate);

	ArrayList<GroupBuyAnalysisDto> adminanalysisgbState(HashMap<String, Object> gbParams);



}
