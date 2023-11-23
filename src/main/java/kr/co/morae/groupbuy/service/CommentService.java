package kr.co.morae.groupbuy.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.morae.common.Paging;
import kr.co.morae.groupbuy.dao.CommentDao;
import kr.co.morae.groupbuy.dto.CommentDto;

@Service
public class CommentService {
	Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
	
	
	@Autowired
	CommentDao commDao;
	Paging paging = new Paging();
	

	public HashMap<String, Object> getCommentList(int gbNo, String userId, int pageNum){
		int offset = (pageNum-1)*5;
		ArrayList<CommentDto> commDto = commDao.getComment(gbNo, offset);
		commDto = setCommWriter(commDto, userId);
		
		log.info("commDtolength : "+commDto.size());
		
		int totalCommentCnt = commDao.getTotalComment(gbNo);
		int totalPage = paging.getTotalPage(totalCommentCnt,5);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("totalPage", Integer.toString(totalPage));
		map.put("comments", commDto);
		map.put("currPage", Integer.toString(pageNum));
		map.put("gbNo", Integer.toString(gbNo));
		return map;
	}
	
	
	public ArrayList<CommentDto> setCommWriter(ArrayList<CommentDto> commdto, String userId) {
		for(CommentDto dto : commdto) {
			if(dto.getUserId().equals(userId)) {
				dto.setCommentWriter(true);
			}
		}
		return commdto;
	}

	public String modyfyComment(HashMap<String, String> params) {
		if(commDao.modifyComment(params)>0) {
			return "댓글 수정을 수정하였습니다.";
		}else{
			return "댓글 수정에 실패했습니다.";
		}
	}

	/*
	 * 댓글 작성 함수
	 * 댓글 작성에 성공하면 마지막 페이지 번호를 가져온다
	 */
	public HashMap<String,Object> writeComment(HashMap<String, String> map, String userId) {
		map.put("userId", userId);
		log.info("write comment"+map.toString());
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int row = commDao.writeComment(map);
		
		if(row>0) {
			int gbNo = Integer.parseInt(String.valueOf(map.get("gbNo")));
			int totalCommentCnt = commDao.getTotalComment(gbNo);
			int lastPageNum = paging.getTotalPage(totalCommentCnt,5);
			
			result.put("pageNum", lastPageNum);
			result.put("msg", "success");
			return result;
		}
		result.put("msg", "fail");
		return result;
	}
	
	
	

}
