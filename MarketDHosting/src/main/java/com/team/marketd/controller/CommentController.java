package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.marketd.domain.PageMaker;
import com.team.marketd.domain.SearchCriteria;
import com.team.marketd.domain.CommentVo;
import com.team.marketd.service.CommentService;

@RestController
public class CommentController {

	@Autowired
	CommentService cs;

	String reuslt = null;

	@GetMapping(value = "/product/{pidx}/{page}/commentlist.dobby"// ��湲� 由ъ�ㅽ�� �대��(Ajax)
			, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ArrayList<CommentVo> commentList(Model model, @PathVariable("pidx") int pidx,
											@PathVariable("page") int page) {

		System.out.println("page" + page);

		ArrayList<CommentVo> commentlist = cs.selectCommentList(pidx, page);

		return commentlist;// 리스트
	}

	@PostMapping(value = "/Needlogin/product/commentWriteAction.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE }) // 저장
	public int commentWriteAction(@RequestBody CommentVo cv) throws Exception {

		String cip = null;
		try {
			cip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		cv.setCip(cip);
		int rs = cs.insertComment(cv);

		return rs;
	}

	@DeleteMapping(value = "/Comment/{cidx}/deleteComment.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public void deleteCommentAction(@PathVariable("cidx") int cidx) throws Exception {

		String cdelip = null;
		try {
			cdelip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		CommentVo cv = new CommentVo();

		cv.setCdelip(cdelip);
		cv.setCidx(cidx);
		cs.deleteCommentAction(cv);
	}

	@PostMapping(value = "/comment/commentReplyWrite.dobby"// ��湲��� �듦� �ш린(��湲� ��蹂� ����)
			, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public int commentReplyWrite(@RequestBody CommentVo cv) {

		String cip = null;
		try {
			cip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		cs.replycomment(cv.getCorigincidx(), cv.getCupdown());

		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("pidx", cv.getPidx());
		hm.put("midx", cv.getMidx());
		hm.put("cwriter", cv.getCwriter());
		hm.put("ccontent", cv.getCcontent());
		hm.put("corigincidx", cv.getCorigincidx());
		hm.put("cleftright", cv.getCleftright());
		hm.put("cupdown", cv.getCupdown());
		hm.put("cip", cip);

		/*
		 * int corigincidx=(int)hm.get("corigincidx"); int
		 * cupdown=(int)hm.get("cupdown"); cs.replycomment(corigincidx,cupdown);
		 */
		int resultreply = cs.insertCommentReply(hm);
		/*
		 * model.addAttribute("cv", resultreply); return "redirect:
		 */
		return resultreply;
	}

	@GetMapping(value = "comment/{cidx}/commentOne.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public CommentVo commentOne(@PathVariable("cidx") int cidx) {// ������ ��湲��� ��蹂대�� 異��� �⑸��

		CommentVo cv = cs.selectCommentOne(cidx);

		return cv;
	}
}
