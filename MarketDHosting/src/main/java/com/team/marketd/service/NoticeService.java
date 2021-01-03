package com.team.marketd.service;

import java.util.ArrayList;

import com.team.marketd.domain.NoticeVo;

public interface NoticeService {

	public ArrayList<NoticeVo> selectNoticeList(int page);
	public NoticeVo selectNoticeOne(int nidx);
	public int insertNotice(int midx, String nsubject, String ncontent);
	public int deleteNotice(int nidx);
	public int selectNoticeTotal();
	
}
