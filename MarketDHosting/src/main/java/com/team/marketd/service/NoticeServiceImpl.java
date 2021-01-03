package com.team.marketd.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.marketd.domain.NoticeVo;
import com.team.marketd.persistence.NoticeService_Mapper;

@Service("NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	NoticeService_Mapper nsm;
	
	@Autowired
	NoticeServiceImpl(SqlSession session) {
		this.nsm = session.getMapper(NoticeService_Mapper.class);
	}
	
	NoticeVo resultNv = null;
	int nv = 0;
	
	@Override
	public ArrayList<NoticeVo> selectNoticeList(int page) { // 공지사항 리스트
		page= (page-1)*10;
		ArrayList<NoticeVo> nv = nsm.selectNoticeList(page);
		return nv;
	}

	@Override
	public NoticeVo selectNoticeOne(int nidx) { //공지사항 콘텐츠
		resultNv = nsm.selectNoticeOne(nidx);
		return resultNv;
	}

	@Override
	public int insertNotice(int midx, String nsubject, String ncontent) { //공지사항 입력
		HashMap<String, Object> hm = new HashMap<String, Object>();
								hm.put("midx", midx);
								hm.put("nsubject", nsubject);
								hm.put("ncontent", ncontent);
				
				nv = nsm.insertNotice(hm);
		return nv;
	}

	@Override
	public int deleteNotice(int nidx) { //공지사항 삭제
		nv = nsm.deleteNotice(nidx);
		return nv;
	}

	@Override
	public int selectNoticeTotal() { //공지사항 페이징용 토탈
		
		int tcount = nsm.selectNoticeTotal();
		
		return tcount;
	}
	
}

