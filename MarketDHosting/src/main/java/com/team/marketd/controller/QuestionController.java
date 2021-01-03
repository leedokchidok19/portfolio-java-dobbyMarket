package com.team.marketd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.QuestionVo;
import com.team.marketd.domain.SearchCriteria;
import com.team.marketd.service.QuestionService;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class QuestionController {
	
	@Autowired
	QuestionService qs;
	
	@GetMapping("/Question/OftenList.dobby")
	public String oftenList(Model model) { // 자주묻는질문 이동
		log.info("자주 묻는 질문으로 이동합니다");
		return "question/oftenList";
	}

	@RequestMapping("/Question/QuestionList.dobby")
	public String questionList(Model model, SearchCriteria scri,PageMaker pm,
			@RequestParam(value="page",defaultValue="1")int page ){ // 리스트
		
		scri.setPage(page);
		
		ArrayList<QuestionVo> alist = qs.selectQuestion(page);
		int tcount = qs.selectQuestionTotal();
				
		pm.setScri(scri);
		pm.setTotalCount(tcount);
				
		model.addAttribute("alist",alist);
		model.addAttribute("pm",pm);
		
		log.info("공지사항으로 이동합니다");
		return "question/questionList";
	}
	
	@RequestMapping("/NeedLogin/Question/QuestionWrite.dobby")
	public String questionWrite() { // 작성
		
		return "question/questionWrite";
	}
	
	@RequestMapping("/Question/QuestionWriteAction.dobby")
	public String questionWriteAction(HttpSession session,@RequestParam("caidx")int caidx
									,@RequestParam("qsubject")String qsubject 
									,@RequestParam("qcontent")String qcontent) { //저장
		
		int midx = (int) session.getAttribute("midx");
		
		qs.insertQuestion(midx,caidx,qsubject,qcontent);
		
		return "redirect:/Question/QuestionList.dobby";
	}
	
	
	@RequestMapping("/Question/QuestionDeleteAction.dobby")
	public String questionModify(@RequestParam("qidx")int qidx) { // 삭제
		
		qs.updateQuestion(qidx);
		
		return "redirect:/Question/QuestionList.dobby";
	}
	
	
	@RequestMapping("/Question/QuestionReply.dobby")
	public String questionReply(@RequestParam("qidx")int qidx,Model model) { // 답변
		
		QuestionVo qv = qs.selectQuestionOne(qidx);
		model.addAttribute("qv", qv);
		
		return "question/questionReply";
	}
	
	@RequestMapping("/Question/QuestionReplyAction.dobby")
	public String questionReplyAction(@RequestParam("qidx")int qidx,
									@RequestParam("qresubject")String qresubject,
									@RequestParam("qrecontent")String qrecontent) { // 답변 저장
		
		
		qs.QuestionReply(qidx,qresubject,qrecontent);
		
		return "redirect:/Question/QuestionList.dobby";
	}
	
	@RequestMapping("/Question/QuestionContent.dobby")
	public String questionReplyContent(@RequestParam("qidx")int qidx,Model model) { // 보기 페이지
		
		QuestionVo qv = qs.selectQuestionOne(qidx);
		
		model.addAttribute("qv", qv);
		
		return "question/questionContent";
	}
	
}
