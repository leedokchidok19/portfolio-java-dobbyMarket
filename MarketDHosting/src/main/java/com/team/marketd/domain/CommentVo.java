package com.team.marketd.domain;

import lombok.Data;

@Data
public class CommentVo {

	int cidx;
	int midx;
	int pidx;
	String cwriter;
	String ccontent;
	String cwridate;
	int corigincidx;
	int cleftright;
	int cupdown;
	String cip;
	String cdelip;
	String cdelyn;
}
