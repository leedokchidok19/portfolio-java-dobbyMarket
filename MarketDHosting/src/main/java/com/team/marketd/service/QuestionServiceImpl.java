package com.team.marketd.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.marketd.domain.QuestionVo;
import com.team.marketd.persistence.QuestionService_Mapper;

@Service
public class QuestionServiceImpl implements QuestionService {

	QuestionService_Mapper qsm;
	
	@Autowired
	QuestionServiceImpl(SqlSession session) {
		this.qsm = session.getMapper(QuestionService_Mapper.class);
	}
	
	@Override
	public void insertQuestion(int midx,int caidx,String qsubject,String qcontent) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("midx", midx);
		hm.put("caidx", caidx);
		hm.put("qsubject", qsubject);
		hm.put("qcontent", qcontent);
		
		qsm.insertQuestion(hm);
		
	}

	@Override
	public ArrayList<QuestionVo> selectQuestion(int page) {

		page=(page-1)*10;
		ArrayList<QuestionVo> alist = qsm.selectQuestion(page);
		
		return alist;
	}

	@Override
	public int selectQuestionTotal() {
		
		int tcount = qsm.selectQuestionTotal();
		
		return tcount;
	}

	@Override
	public QuestionVo selectQuestionOne(int qidx) {
		
		QuestionVo qv = qsm.selectQuestionOne(qidx);
		
		return qv;
	}

	@Override
	public void updateQuestion(int qidx) {
		
		qsm.updateQuestion(qidx);
		
	}

	@Override
	public void QuestionReply(int qidx,String qresubject,String qrecontent) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		hm.put("qidx", qidx);
		hm.put("qresubject", qresubject);
		hm.put("qrecontent", qrecontent);
		
		qsm.QuestionReply(hm);
		
	}

	@Override
	public String updateQuestionReply() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}

