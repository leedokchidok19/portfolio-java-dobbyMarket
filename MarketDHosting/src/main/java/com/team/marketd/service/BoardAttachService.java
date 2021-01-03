package com.team.marketd.service;

import java.util.HashMap;

import com.team.marketd.domain.ProductVo;

public interface BoardAttachService {

	public int insert(HashMap<String, Object> hm);
	
	public void delete(String uuid);
	
	public ProductVo findByPidx(int pidx);
	
	public int checkproduct(int midx,int caidx,String psubject,String pcontent,int pmoney,int pfee,String pip);
	
}
