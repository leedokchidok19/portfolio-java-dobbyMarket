package com.team.marketd.service;


import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.marketd.domain.CommentVo;
import com.team.marketd.persistence.CommentService_Mapper;

@Service
public class CommentServiceImpl implements CommentService {

	CommentService_Mapper csm;
	
	@Autowired
	CommentServiceImpl(SqlSession session){
		this.csm = session.getMapper(CommentService_Mapper.class);
	}
	
			int resultint = 0;
			String resultcv = null;
	
	@Override
	public ArrayList<CommentVo> selectCommentList(int pidx,int page) {
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
								hm.put("pidx", pidx);
								hm.put("page", (page-1)*5);
		ArrayList<CommentVo> cv = csm.selectCommentList(hm);
						return cv;
	}

	@Override
	public int deleteCommentAction(CommentVo cv) {
		
				resultint = csm.deleteCommentAction(cv);
		
						return resultint;
	}

	@Transactional
	@Override
	public int insertComment(CommentVo cv) {
		 	csm.insertComment(cv);
		 	int cori=	csm.selectCommentWrite(cv);
		 	int rs = csm.updateCommentWrite(cori);
		 	
		 	
		 	return rs;			
	}

	@Override
	public void replycomment(int corigincidx,int cupdown) {

		 		csm.replycomment(corigincidx, cupdown);
		
	}
	
	@Override
	public int insertCommentReply(HashMap<String, Object> hm) {
		
				resultint =csm.insertCommentReply(hm);
		
						return resultint;
	}

	@Override
	public CommentVo selectCommentOne(int cidx) {
			
				CommentVo cv = csm.selectCommentOne(cidx);
					
						return cv;
	}



	
	
}

