package com.team.marketd.service;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.marketd.domain.MemberVo;
import com.team.marketd.persistence.MemberService_Mapper;

@Service("MemberSerivceImpl")
public class MemberServiceImpl implements MemberService {
	@Autowired
	SqlSession sqlSession;
	@Override
	public int selectDoubleIdCheck(String id) { //아이디 중복확인
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("id", id);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		int exec = msm.selectDoubleIdCheck(hm);
		return exec;
	}

	@Override
	public int insertProfile(String id,String pwd,String name,int birth,String sex,String mail,
			String phone,int caidx,long maccount,String kakao,
			String mquestion,String ip) { //회원정보 추가
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("id", id);
		hm.put("pwd",pwd);
		hm.put("name", name);
		hm.put("birth", birth);
		hm.put("sex", sex);
		hm.put("mail", mail);
		hm.put("tell", phone);
		hm.put("caidx", caidx);
		hm.put("maccount", maccount);
		hm.put("kakao", kakao);
		hm.put("mquestion", mquestion);
		hm.put("ip", ip);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		int exec = msm.insertProfile(hm);
		return exec;
	}

	@Override
	public MemberVo login(String id,String pwd) {  //아이디 비밀번호 정보 일치 확인 후 로그인
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("id", id);
		System.out.println("아이디"+id);
		hm.put("pwd", pwd);
		System.out.println("아이디"+pwd);
		
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);//mapper瑜� msm蹂��닔濡� 留뚮뱾�뼱二쇨퀬 sqlSesion.getMapper瑜� ���엯�떆�궓�떎
		MemberVo mv = msm.login(hm);
		System.out.println("아이디 매퍼"+mv);
		return mv;
	}

	@Override
	public MemberVo checkAutoLogin(String sessionKey) { //자동 로그인 검사
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("mkey", sessionKey);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		MemberVo mv = msm.checkAutoLogin(hm);
		return mv;
	}

	@Override
	public void keepLogin(int midx,String sessionKey,String sessionLimit) {  //자동 로그인 지정
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("midx", midx);
		hm.put("mkey", sessionKey);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		msm.keepLogin(hm);
	}

	@Override
	public MemberVo selectIdFind(String name,int birth,String question) { //아이디 찾기
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("name", name);
		hm.put("birth", birth);
		hm.put("question", question);
		
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		MemberVo mv = msm.selectIdFind(hm);
		return mv;
	}

	@Override
	public MemberVo selectPwdFind(String id,String name,String question) { //비밀번호 찾기
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("id", id);
		hm.put("name", name);
		hm.put("question", question);
		System.out.println("HID"+id);
		System.out.println("Hname"+name);
		System.out.println("Hquestion"+question);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		MemberVo mv = msm.selectPwdFind(hm);
		return mv;
	}

	@Override
	public int updatePwd(String npwd,int midx) { //비밀번호 변경
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("npwd", npwd);
		hm.put("midx", midx);
		System.out.println("바꿀 새비밀번호는"+npwd);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		int exec = msm.updatePwd(hm);
		return exec;
	}

	@Override
	public MemberVo selectProfile(int midx) { //회원정보 불러오기
		HashMap<String, Object>hm = new HashMap<String,Object>();
		hm.put("midx", midx);
		System.out.println("MemberServiceImpl midx:"+midx);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		MemberVo mv = msm.selectProfile(hm);
		return mv;
	}

	@Override
	public MemberVo checkPwd(int midx,String pwd) { //회원정보 비밀번호 체크
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("midx", midx);
		hm.put("pwd", pwd);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		MemberVo mv = msm.checkPwd(hm);
		return mv;
	}

	@Override
	public void updateProfile(int midx, String pwd,String phone, String email,int caidx,long account,String mkakao, String mquestion) { //회원정보 수정
		HashMap<String, Object>hm = new HashMap<String,Object>();

		hm.put("midx", midx);
		hm.put("pwd", pwd);
		hm.put("phone", phone);
		hm.put("email",email);
		hm.put("caidx", caidx);
		hm.put("account",account);
		hm.put("mkakao", mkakao);
		hm.put("mquestion", mquestion);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		System.out.println("실행전");
		msm.updateProfile(hm);
		System.out.println("실행후");
	}

	@Override
	public void updateUpgrade(String mgrade,int midx) { //멤버 등급 상승 작동
		HashMap<String, Object> hm = new HashMap<String,Object>();
		System.out.println("Impl mgrage:"+mgrade);
		hm.put("mgrade", mgrade);
		hm.put("midx", midx);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		msm.updateUpgrade(hm);
	}

	@Override
	public void deleteProfile(int midx) { // 회원탈퇴 작동
		HashMap<String, Object> hm = new HashMap<String,Object>();
		hm.put("midx", midx);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		msm.deleteProfile(hm);
	}



	@Override
	public void dropCookie(int midx) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("midx", midx);
		MemberService_Mapper msm = sqlSession.getMapper(MemberService_Mapper.class);
		
		msm.dropCookie(hm);
		
	}


}
