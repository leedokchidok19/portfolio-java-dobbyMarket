package com.team.marketd.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.CommentVo;

public interface CommentService {
	
	public ArrayList<CommentVo> selectCommentList(int pidx,int page);
	
	public int deleteCommentAction(CommentVo cv);
	
	public int insertComment(CommentVo cv);
	
	public void replycomment(int corigincidx,int cupdown);
	
	public int insertCommentReply(HashMap<String, Object> hm);

	public CommentVo selectCommentOne(int cidx);


}
