package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.QuestionVo;

public interface QuestionService_Mapper {
	
	public void insertQuestion(HashMap<String,Object> hm);
	public ArrayList<QuestionVo> selectQuestion(int page);
	public int selectQuestionTotal();
	public QuestionVo selectQuestionOne(int qidx);
	public void updateQuestion(int qidx);
	public void QuestionReply(HashMap<String,Object> hm);
	public String updateQuestionReply();
	

}
