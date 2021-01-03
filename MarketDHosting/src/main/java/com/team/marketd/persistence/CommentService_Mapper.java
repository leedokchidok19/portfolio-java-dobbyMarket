package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import com.team.marketd.domain.CommentVo;

public interface CommentService_Mapper {
	
	public ArrayList<CommentVo> selectCommentList(HashMap<String, Object> hm); //댓글 리스트
	
	public int deleteCommentAction(CommentVo cv); //삭제
	
	public int insertComment(CommentVo cv); //댓글 입력
	
	public void replycomment(int corigincidx,int cupdown); //답글 준비
	
	public int insertCommentReply(HashMap<String, Object> hm); //답글 입력

	public CommentVo selectCommentOne(int cidx); // cidx에 맞는 하나의 댓글 호출

	public int selectCommentWrite(CommentVo cv); // cidx에 맞는 하나의 댓글 호출
	
	public int updateCommentWrite(int cori); // cidx에 맞는 하나의 댓글 호출
	
	

}
