package com.team.marketd.persistence;

import java.util.HashMap;
import com.team.marketd.domain.ProductVo;

public interface BoardAttachService_Mapper {
	
	public int insert(HashMap<String, Object> hm);
	
	public void delete(String uuid);
	
	public ProductVo findByPidx(int pidx);
	
	public int checkproduct(HashMap<String, Object> hm);
}
