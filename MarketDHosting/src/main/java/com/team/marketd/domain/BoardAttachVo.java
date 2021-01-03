package com.team.marketd.domain;

import lombok.Data;

@Data
public class BoardAttachVo {
	//쿼리 등과 관련된 문제 중에 값은 있는데 자리를 못 찾으면 대소문자 바꿔주기 uploadPath fileName fileType
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int pidx;
}
