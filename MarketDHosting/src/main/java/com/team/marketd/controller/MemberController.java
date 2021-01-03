package com.team.marketd.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.team.marketd.domain.MemberVo;
import com.team.marketd.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;

	@RequestMapping(value = "MemberJoin.dobby", method = RequestMethod.GET)
	public String memberJoin() { // 회원가입 페이지 이동 해결
		return "member/memberJoin";
	}

	@RequestMapping(value = "MemberJoinAction.dobby", method = RequestMethod.POST) // 회원가입 기능 해결
	public String memberJoinAction(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
			@RequestParam("name") String name, @RequestParam("birth") int birth, @RequestParam("sex") String sex,
			@RequestParam("mmail1") String mmail1, @RequestParam("mmail2") String mmail2,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3, @RequestParam("caidx") int caidx,
			@RequestParam("maccount") long maccount, @RequestParam("mkakao") String kakao,
			@RequestParam("question") String question, @RequestParam("mquestion") String mquestion) { // 회원정보 저장
		String mail = mmail1 + "@" + mmail2; // 이메일 합친거
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		System.out.println("아이디:" + id);
		System.out.println("비밀번호:" + pwd);
		System.out.println("이름:" + name);
		System.out.println("생년월일:" + birth);

		System.out.println("성별:" + sex);
		System.out.println("이메일:" + mail);
		System.out.println("휴대폰:" + phone);
		System.out.println("거래계좌명:" + caidx);
		System.out.println("계좌번호:" + maccount);
		System.out.println("카카오톡:" + kakao);
		System.out.println("인증 질문답:" + mquestion);

		String ip = null; // ip 담을 변수 생성
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		/*
		 * System.out.println(ip); //아이피 찍어보기
		 */
		if (ms.selectDoubleIdCheck(id) == 1) {
			System.out.println("회원가입 실패");
			return "redirect:/MemberJoin.dobby";
		} else {
			System.out.println("회원가입 성공");
			ms.insertProfile(id, pwd, name, birth, sex, mail, phone, caidx, maccount, kakao, mquestion, ip);
			return "login/login";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/Member/{id}/idCheck.dobby", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public HashMap<String, Object> idCheck(@PathVariable("id") String id) {
		System.out.println("id:" + id); // 아이디값 찍어보기
		int cnt = ms.selectDoubleIdCheck(id); // 아이디가 존재하면 cnt 1 존재하지않다면 0을 리턴해주는 메소드
		System.out.println("1이면 아이디존재 0이면 존재하지않음:" + cnt);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("cnt", cnt);

		return hm;
	}

	@RequestMapping(value = "login.dobby")
	public String memberLogin(HttpSession session, HttpServletRequest request) { 
		if (session.getAttribute("midx") != null) {
			return "index2";
		}

		return "login/login";
	}

	@RequestMapping(value = "login2.dobby")
	public String memberLogin2(HttpSession session) {
		return "login/login";
	}

	@RequestMapping(value = "index.dobby")
	public String index() {
		return "index2";
	}

	@RequestMapping(value = "loginAction.dobby")
	public String memberLoginAction(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
			@RequestParam(value = "useCookie", required = false) String useCookie, Model model, HttpSession session) { // 로그인
																														// 작동
																														// 해결
		// 로그인
		MemberVo mv = ms.login(id, pwd);
		System.out.println("mv의값은?:" + mv);
		if (mv == null)
			return "login/login";

		session.setAttribute("midx", mv.getMidx()); // session 만들기

		model.addAttribute("midx", mv.getMidx());
		model.addAttribute("useCookie", useCookie);
		return "redirect:index2.jsp";
	}

	
	@RequestMapping(value = "logoutAction.dobby")
	public String memberLogoutAction(HttpSession session, HttpServletResponse response, HttpServletRequest request) { // 로그아웃 작동 해결
		int midx = (int) session.getAttribute("midx");
		ms.dropCookie(midx);
		//세션삭제
		session.removeAttribute("midx");
		session.invalidate();
		
/*			Cookie cookie = new Cookie("useCookie", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);*/
		//쿠키 삭제		
		Cookie useCookie = WebUtils.getCookie(request, "useCookie"); 
		if (useCookie != null) {
			 useCookie.setPath("/");	//쿠키 사용범위 지정
			 useCookie.setMaxAge(0);	 //쿠키 사용기간 지정		 
			 response.addCookie(useCookie);
		}
		
		/*
		 * Cookie[] cookies = request.getCookies(); if(cookies != null){ for(int i=0; i
		 * < cookies.length; i++){
		 * 
		 * // 쿠키의 유효시간을 0으로 설정하여 만료시킨다 cookies[i].setMaxAge(0) ;
		 * 
		 * // 응답 헤더에 추가한다 response.addCookie(cookies[i]) ; } }
		 */
		return "redirect:index2.jsp";
	}

	/*
	 * @RequestMapping("IdFind.dobby") public String memberIdFind() { // 아이디 찾기 페이지
	 * 이동
	 * 
	 * return "member/memberIdFind"; }
	 * 
	 * @RequestMapping("PwdFind.dobby") public String memberPwdFind() { // 비밀번호 찾기
	 * 페이지 이동
	 * 
	 * return "member/memberPwdFind"; }
	 */

	@RequestMapping("IdFindAction.dobby") // 아이디찾기 해결
	public String memberNewIdFindAction(@RequestParam("name") String name, @RequestParam("birth") int birth,
			@RequestParam("question") String question, Model model) {
		/*
		 * System.out.println("이름" + name); System.out.println("생년월일" + birth);
		 * System.out.println("질문" + question);
		 */
		MemberVo mv = ms.selectIdFind(name, birth, question); // 메소드 반환값을 mv에 담음
		System.out.println(mv.getMid());
		model.addAttribute("mv", mv); // model.addAttribute 로 view단으로 보내줌
		return "member/memberIdFind";
	}

	@RequestMapping("PwdFindAction.dobby") // 비밀번호 찾기 해결
	public String memberNewPwdFindAction(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("mquestion") String mquestion, Model model) { // 비밀번호 찾기 작동
		System.out.println("아이디:" + id);
		System.out.println("이름:" + name);
		System.out.println("question:" + mquestion);
		MemberVo mv = ms.selectPwdFind(id, name, mquestion); // 메소드 결과값 mv에 저장 view단에 전달하고 확인하기 위해서

		model.addAttribute("mv", mv); // view 단에 보내주기
		System.out.println(mv.getMpwd());
		return "member/memberPwdFind";
	}

	/*
	 * @RequestMapping("PwdUpdate.dobby") public String memberNewPwdSave(HttpSession
	 * session,Model model) { // 새 비밀번호 입력창이동 int midx
	 * =(int)session.getAttribute("midx"); return "login/memberPwdFindComplete"; }
	 */

	@RequestMapping("PwdUpdateAction.dobby")
	public String memberNewPwdSaveAction(@RequestParam("newpwd") String newpwd, @RequestParam("newpwd2") String newpwd2,
			@RequestParam("midx") int midx) { // 비밀번호 바꾸기
		System.out.println(newpwd);
		System.out.println(newpwd2);
		System.out.println("midx의 값은:" + midx);
		ms.updatePwd(newpwd, midx);
		return "login/login";
	}

	@RequestMapping("/Needlogin/memberProfile.dobby")
	public String memberProfile(HttpSession session, Model model) { // 회원정보 보기 페이지 이동
		int midx = (int) session.getAttribute("midx");
		MemberVo mv = ms.selectProfile(midx);
		model.addAttribute("mv", mv); // 객체를 model.addAttribute에 담아서 view단으로 보내준다
		return "member/memberContent";
	}

	@RequestMapping("memberCheck.dobby")
	public String memberModifyProfile(@RequestParam("pwd") String pwd, Model model, HttpSession session) { // 회원정보 수정페이지
																											// 이동
		int midx = (int) session.getAttribute("midx"); // 세션 형변환
		MemberVo mv = ms.selectProfile(midx); // 회원정보 출력
		MemberVo mv2 = ms.checkPwd(midx, pwd); // 회원정보 수정페이지로 이동전 비밀번호 체크
		model.addAttribute("mv", mv);
		model.addAttribute("mv2", mv2);
		if (mv.getMpwd().equals(mv2.getMpwd())) { // DB안에 저장되있는 비밀번호와 입력한 비밀번호가 같은지 체크
			System.out.println("if 실행?");
			return "member/memberUpdate"; // 같다면 회원정보 수정페이지로
		} else { // 비밀번호가 맞지않을시 인덱스로 페이지로 이동해야되지만 에러페이지로 이동
			System.out.println("else 실행?");
			return "redirect:index2.jsp";
		}
	}

	@RequestMapping("memberUpdate.dobby") // 회원정보 수정하기
	public String memberModifyProfileAction(@RequestParam("midx") int midx, @RequestParam("pwd") String pwd,
			@RequestParam("mmail1") String mmail1, @RequestParam("mmail2") String mmail2,
			@RequestParam("caidx") int caidx, @RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3,
			@RequestParam("maccount") long account, @RequestParam("mkakao") String mkakao,
			@RequestParam("mquestion") String mquestion) {
		String email = mmail1 + "@" + mmail2;
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		ms.updateProfile(midx, pwd, phone, email, caidx, account, mkakao, mquestion);// 리턴값없이 void로 메소드 실행만
		return "redirect:index2.jsp";

	}

	// 로그인 할때 회원등급 검사를 하므로 구현하지 않아도됨
	/*
	 * @RequestMapping("memberMgrade.dobby") //회원등급 상승작동 public String
	 * memberUpgradeAction(@RequestParam("mgrade") String
	 * mgrade, @RequestParam("midx") int midx) {
	 * 
	 * 
	 * return null; }
	 */

	public String memberAutoLogin() { // 자동로그인

		return null;
	}

	@RequestMapping("deleteMember.dobby")
	public String memberDeleteAction(int midx) { // 회원탈퇴
		ms.deleteProfile(midx);

		return "redirect:index2.jsp";
	}

}
