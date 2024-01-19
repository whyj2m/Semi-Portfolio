package com.imfreepass.prj.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AreaVO {
	private int ano = 1;
	private String cname; // 영어이름
	private String cdesc; // 한글이름
} 
