package com.team.marketd.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.team.marketd.domain.NoticeVo;

public interface NoticeService_Mapper {
	
	public ArrayList<NoticeVo> selectNoticeList(int page);
	public NoticeVo selectNoticeOne(int nidx);
	public int insertNotice(HashMap<String, Object> hm);
	public int deleteNotice(int nidx);
	public int selectNoticeTotal();

}
