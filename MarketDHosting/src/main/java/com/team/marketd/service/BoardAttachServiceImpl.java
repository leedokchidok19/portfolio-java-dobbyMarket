package com.team.marketd.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.marketd.domain.ProductVo;
import com.team.marketd.persistence.BoardAttachService_Mapper;

@Service
public class BoardAttachServiceImpl implements BoardAttachService {

	BoardAttachService_Mapper bam;
	
	@Autowired
	BoardAttachServiceImpl(SqlSession session){
		this.bam = session.getMapper(BoardAttachService_Mapper.class);
	}

	@Override
	public int insert(HashMap<String, Object> hm) {
		
		String o = (String) hm.get("fileName");
		
		System.out.println("파일 이름이?"+o);
		
			int result =bam.insert(hm);
		return result;
	}

	@Override
	public void delete(String uuid) {
		bam.delete(uuid);
		
	}

	@Override
	public ProductVo findByPidx(int pidx) {
		ProductVo result = bam.findByPidx(pidx);
		
		String uploadPath = result.getUploadPath();
		if(uploadPath!=null) {
			
		String uploadPath2 = uploadPath.replaceAll("\\\\", "/");
		
		result.setUploadPath(uploadPath2);
		}
		System.out.println(result+": findbyPidxd ?");
		return result;
	}

	@Override
	public int checkproduct(int midx,int caidx,String psubject,String pcontent,int pmoney,int pfee,String pip) {
		HashMap<String, Object> hm =new HashMap<String, Object>();
						hm.put("midx", midx);
						hm.put("caidx", caidx);
						hm.put("psubject", psubject);
						hm.put("pcontent", pcontent);
						hm.put("pmoney", pmoney);
						hm.put("pfee", pfee);
						hm.put("pip", pip);
				int result = bam.checkproduct(hm);
		return result;
	}
	
	
}
