package com.team.marketd.domain;

import lombok.Data;

@Data
public class PaymentSaleDTO {
		// Product
	private int pidx;
	private int caidx;
	private int midx;
	private String psubject;
	private String mname;
	private String pwridate;
	private String pcontent;
	private int pmoney;
	private int pfee;
	private String pip;
	private String psaleYn;
	private String pdelYn;
		// Delivery
	int didx;
		//	int oidx;
	String drecipt;
	String dtell;
	String daddr;
	String ddetails;
	String dmemo;
	int dwaybill;
	String dsenddate;
	String dcancle;
		// Order
	int oidx;
//	int pidx;
//	int midx;
	String oid;
	String obuydate;
	int omoney;
	String oip;
	String ofinal;
	String ocancle;
	String odelyn;
	//Pay
	String pacomplete;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
}
