package com.team.marketd.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.marketd.domain.NoticeVo;
import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.SearchCriteria;
import com.team.marketd.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService ns;
	
	@GetMapping("/Notice/NoticeList.dobby")
	public String noticeList(Model model, SearchCriteria scri,PageMaker pm,
							@RequestParam(value="page",defaultValue="1")int page ) { // 공지사항 리스트 이동
		
		scri.setPage(page);
		
		ArrayList<NoticeVo> resultnv = ns.selectNoticeList(page);
		int tcount = ns.selectNoticeTotal();
				
		pm.setScri(scri);
		pm.setTotalCount(tcount);
				
		model.addAttribute("nv",resultnv);
		model.addAttribute("pm",pm);
		
		log.info("공지사항으로 이동합니다");
		return "notice/noticeList";
	}
	
	@GetMapping("/Notice/NoticeWrite.dobby")
	public String noticeWrite() { // 공지사항 작성 페이지 이동
		log.info("공지사항 작성 페이지로 이동합니다");
		return "notice/noticeWrite";
	}
	
	@GetMapping("/Notice/NoticeContent.dobby")
	public String noticeContent(Model model,@RequestParam("nidx")int nidx) { // 공지사항 콘텐츠
		NoticeVo result = ns.selectNoticeOne(nidx);
		model.addAttribute("nv",result);
		log.info("공지사항 보기");
		return "notice/noticeContent";
	}
	
	@PostMapping("/Notice/NoticeWriteAction.dobby")
	public String noticeWriteAction(HttpSession session
									,@RequestParam("nsubject")String nsubject 
									,@RequestParam("ncontent")String ncontent) { // 공지사항 저장
		
		int midx = (int) session.getAttribute("midx");
		ns.insertNotice(midx, nsubject, ncontent);
		
		log.info("공지사항 작성");
		return "redirect:/Notice/NoticeList.dobby";
	}
	@GetMapping("/Notice/NoticeDeleteAction.dobby")
	public String noticeDeleteAction(HttpSession session,@RequestParam("nidx")int nidx) { // 공지사항 삭제
		
		ns.deleteNotice(nidx);
		
		log.info("삭제 되었습니다");
		return "redirect:/Notice/NoticeList.dobby";
	}
	
	
}
