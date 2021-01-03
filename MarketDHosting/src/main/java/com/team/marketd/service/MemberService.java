package com.team.marketd.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.team.marketd.domain.MemberVo;

public interface MemberService {


	public int selectDoubleIdCheck(String id); // 아이디 중복확인
	
	public MemberVo login(String id,String pwd); //로그인
	
	public MemberVo checkAutoLogin(String sessionKey); // 자동 로그인 체크
	
	public void keepLogin(int midx,String sessionKey,String sessionLimit);
	
	public MemberVo selectIdFind(String name,int birth,String question); //아이디찾기
	
	public MemberVo selectPwdFind(String id,String name,String question); //비밀번호찾기
	
	public int updatePwd(String npwd,int midx); //비밀번호 변경
	
	public MemberVo selectProfile(int midx); //회원정보 보기
	
	public MemberVo checkPwd(int midx,String pwd); // 회원정보 수정으로 이동하기전 비밀번호 체크
	
	public void updateProfile(int midx, String pwd,String phone, String email,int caidx,long account,String mkakao, String mquestion); //회원정보수정
	
	public void updateUpgrade(String mgrade,int midx); //멤버등급
	
	public void deleteProfile(int midx); //회원삭제
	
	public int insertProfile(String id, String pwd, String name, int birth, String sex, String mail, String phone,
			int caidx, long maccount, String kakao, String mqeustion,String ip); //회원가입
	
	public void dropCookie(int midx);


}
