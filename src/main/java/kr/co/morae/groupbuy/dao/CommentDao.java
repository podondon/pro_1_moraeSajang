package kr.co.morae.groupbuy.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.morae.groupbuy.dto.CommentDto;

public interface CommentDao {
	ArrayList<CommentDto> getComment(int gbNo, int offset);

	int getTotalComment(int gbNo);

	int modifyComment(HashMap<String, String> params);
	
	int writeComment(HashMap<String, String> params);
	
	int deleteComment(HashMap<String, String> params);

}
