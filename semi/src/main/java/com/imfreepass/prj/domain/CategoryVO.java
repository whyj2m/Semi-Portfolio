package com.imfreepass.prj.domain;

import lombok.Data;

@Data
public class CategoryVO {
	private int cno = 1; // 번호 
	private String cname; // 영어이름 
	private String cdesc; // 제목 
}
