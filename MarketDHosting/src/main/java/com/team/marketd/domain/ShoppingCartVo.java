package com.team.marketd.domain;

import lombok.Data;

@Data
public class ShoppingCartVo {

	private int sidx;
	private int midx;
	private int pidx;
	private String sdate;
	private int svol;
	
	private int pmoney;
	private int pfee;
	private String psubject;
	
	private String mname;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
}
