package kr.co.morae.groupbuy.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;

import java.util.UUID;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.morae.common.FileRoles;
import kr.co.morae.common.Paging;
import kr.co.morae.emuns.GbStateEnum;
import kr.co.morae.emuns.UserReviewEnum;
import kr.co.morae.emuns.pointReasonEnum;
import kr.co.morae.groupbuy.dao.GroupBuyDao;
import kr.co.morae.groupbuy.dto.CommentDto;
import kr.co.morae.groupbuy.dto.GbStateCheckDto;
import kr.co.morae.groupbuy.dto.GroupBuyDto;
import kr.co.morae.groupbuy.dto.ReportDto;
import kr.co.morae.groupbuy.dto.SearchOptionDto;
import kr.co.morae.mypage.dao.PointDao;

@Service
public class GroupBuyService {
	
	
	@Autowired
	private GroupBuyDao gbDao;
	@Autowired
	private PointDao pointDao;
	
	Paging paging = new Paging();
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	

	public int registerGB(MultipartFile[] files, GroupBuyDto dto, String userId){
		int n=0;
		
		dto.setUserId(userId);
		dto.setGbState(GbStateEnum.PROGRESS.getState());
		
		dto = separateLocation(dto);
		n += gbDao.gbRegister(dto);
		gbDao.insertGbStateHistory(dto.getGbNo(), GbStateEnum.PROGRESS.getState());
		int gbNo = dto.getGbNo();
		
		n += gbDao.gbRegionRegister(dto);
		n += saveFile(files, gbNo);
		
		
		if(n<((files.length-1)+2)) {
			return 0;			
		}
		return dto.getGbNo();		
	}
	
	public GroupBuyDto separateLocation(GroupBuyDto dto) {
		
		String[] totalAddrStrings = dto.getRecruitLocation().split("\n");
		dto.setParcelAddress(totalAddrStrings[1]);
		dto.setPlace(totalAddrStrings[0]);
		log.info(dto.getParcelAddress() + "  " + dto.getPlace());
		
		String[] detailAddr = totalAddrStrings[1].split("\\s");
		log.info("length" + detailAddr.length);
		 for(String addr : detailAddr){
             if(addr.endsWith("읍")||addr.endsWith("면")||addr.endsWith("동")){
            	 dto.setGbDetailAddress(addr);
             	break;
             }
         }
		 return dto;
	}
	
	public int saveFile(MultipartFile[] files, int gbNo){
		log.info("gbNo" + gbNo);
		int n = 0;
		if(files!=null || files.length > 0) {
			for(int i=0; i<files.length; i++) {
				String fileName= files[i].getOriginalFilename();
				int extIndex= fileName.lastIndexOf(".");
				String ext = fileName.substring(extIndex);
				int index = Integer.parseInt(fileName.substring(0,1));
				log.info("index : "+ index);
				log.info(fileName);
				String newFileName = UUID.randomUUID().toString() + FileRoles.fileOrder[index-1]+ext;
				byte[] arr;
				try {
					arr = files[i].getBytes();
					Path path = Paths.get(FileRoles.root+"/"+newFileName);
					Files.write(path, arr);
				} catch (IOException e) {
					e.printStackTrace();
				}
				n += gbDao.gbSavePhoto(Integer.toString(gbNo), newFileName);
			}
		}
		return n;
	}


	public HashMap<String, Object> getGbDetail(int gbNo, String userId) {

		GroupBuyDto gbDto =  gbDao.getGbDetail(Integer.toString(gbNo), userId);
		
		if(gbDto.getUserId().equals(userId)) {
			gbDto.setGbWriter(true);
		}else {
			gbDto.setGbWriter(false);
		}
		log.info(gbDto.getFinishDate().toString());
		log.info("isJoining :" +gbDto.getIsJoining());
		
		ArrayList<String> photoNames = gbDao.getPhotoNames(gbNo);
		log.info("photos : "+photoNames.size());
		
		HashMap<String, Object> gbMap = new HashMap<String, Object>();
		gbMap.put("GroupBuyDto", gbDto);
		gbMap.put("PhotoNames", photoNames);
		return gbMap;
		
	}


	public String gbJoin(int gbNo, String userId, int gbPrice) {
		
		HashMap<String, String> gbJoinCheck = gbDao.isgbJoining(Integer.toString(gbNo), userId);
		log.info("gbJoin : " + gbJoinCheck.toString());
		if(!checkGbJoin(gbJoinCheck, userId)) {
			return "false";
		}
		
		Integer balance = pointDao.myPoint(userId);
		log.info(Integer.toString(balance));
		if(balance == null || balance<gbPrice) {
			return "balanceIssue";
		}else {
			int joinSuccess=gbDao.gbJoin(Integer.toString(gbNo), userId);
			
			Integer recruitPeople = Integer.parseInt(String.valueOf(gbJoinCheck.get("recruitPeople")));
			Integer joinPeople= Integer.parseInt(String.valueOf(gbJoinCheck.get("joinPeople")));
			
			gbPrice = gbPrice*-1;
			int row = gbDao.insertPoint(gbNo, userId, gbPrice, pointReasonEnum.USE.getState());
			log.info("insertPoint : "+row);
			
			if(row > 0) {
				return "true";
			}
		}
		return "false";
		
	}
	

	/*
	 * 공구 참여 가능하지 확인하는 함수
	 */
	public boolean checkGbJoin(HashMap<String, String> map, String userId) {
		String joinPeople= String.valueOf(equals(map.get("joinPeople")));
		if(String.valueOf(map.get("isgbJoining")).equals("0")) {
			return true;
		}
		if(String.valueOf(map.get("userId")).equals(userId)) {
			return false;
		}else if(!String.valueOf(map.get("isgbJoining")).equals("0")) {
			return false;
		}else if(String.valueOf(map.get("recruitPeople")).equals(joinPeople)) {
			return false;
		}
		return true;
		
	}
	
	
	/*
	 * 공구 신고
	 */
	public int report(HashMap<String, String> params, String userId) {
		log.info("reportService");
		ReportDto dto = new ReportDto();
		dto.setCommNo(0);
		if(!params.containsKey("commNo")) {
			dto.setGbNo(Integer.parseInt(params.get("gbNo")));
			dto.setCommNo(-1);
			dto.setProcessState("미완료");
			dto.setReportContent(params.get("reportContent"));
			dto.setUserId(userId);
			dto.setReportType("글");
			log.info("글 신고");
		}else {
			dto.setGbNo(Integer.parseInt(params.get("gbNo")));
			dto.setCommNo(Integer.parseInt(params.get("commNo")));
			dto.setProcessState("미완료");
			dto.setReportContent(params.get("reportContent"));
			dto.setUserId(userId);
			dto.setReportType("댓글");	
			log.info("댓글 신고");
		}
		
		int row = gbDao.report(dto);
		return row;
	}

	public HashMap<String, Object> getGbList(SearchOptionDto dto) {
		HashMap<String, Object>map = new HashMap<>();
		int offset = (dto.getPage()-1)*8;
		log.info("categoryNo:"+dto.getCategory());
		log.info("offset:"+offset);
		dto.setOffset(offset);
		
		List<GroupBuyDto> gbList = gbDao.getGbList(dto);
		log.info("list:"+gbList);
		map.put("gbList", gbList);
		
		int totalCommentCnt = gbDao.getTotalgbCnt(dto);
		int totalPage = paging.getTotalPage(totalCommentCnt, 8);
		log.info("totalPage : " + totalPage);
		map.put("totalPage", totalPage);
		map.put("currPage", dto.getPage());
		
		return map;
		
	}
	

}
