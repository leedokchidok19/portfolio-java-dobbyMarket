package com.team.marketd.persistence;

import java.util.HashMap;

import com.team.marketd.domain.MemberVo;

public interface MemberService_Mapper {
	

	public int selectDoubleIdCheck(HashMap<String,Object>hm); //아이디 중복확인
	
	public void dropCookie(HashMap<String,Object>hm);//쿠키삭제
	
	public int insertProfile(HashMap<String,Object>hm); //회원가입
	
	public MemberVo login(HashMap<String,Object>hm); //로그인
	
	public MemberVo checkAutoLogin(HashMap<String,Object>hm); //자동로그인  체크
	
	public void keepLogin(HashMap<String,Object>hm); //자동로그인 보관
	
	public MemberVo selectIdFind(HashMap<String, Object>hm); //아이디찾기
	
	public MemberVo selectPwdFind(HashMap<String,Object>hm); //비밀번호 찾기
	
	public int updatePwd(HashMap<String,Object>hm); //비밀번호 수정
	
	public MemberVo selectProfile(HashMap<String,Object>hm); //회원정보 보기
	
	public MemberVo checkPwd(HashMap<String,Object>hm); //수정전 비밀번호 체크
	
	public void updateProfile(HashMap<String,Object>hm); //회원정보 수정
	
	public void updateUpgrade(HashMap<String,Object>hm); //멤버 등급업
	
	public void deleteProfile(HashMap<String,Object>hm); //회원탈퇴

	public int checkGB2(int midx, int chidx);
	

	
}
