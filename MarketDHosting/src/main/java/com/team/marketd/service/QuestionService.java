package com.team.marketd.service;

import java.util.ArrayList;

import com.team.marketd.domain.QuestionVo;

public interface QuestionService {

	public void insertQuestion(int midx,int caidx,String qsubject,String qcontent);
	public ArrayList<QuestionVo> selectQuestion(int page);
	public int selectQuestionTotal();
	public QuestionVo selectQuestionOne(int qidx);
	public void updateQuestion(int qidx);
	public void QuestionReply(int qidx,String qresubject,String qrecontent);
	public String updateQuestionReply();
	
}
