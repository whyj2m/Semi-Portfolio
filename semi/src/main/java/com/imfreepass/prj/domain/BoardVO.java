package com.imfreepass.prj.domain;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private Date regDate;
	private String id;
	private Date updateDate;
	private int category;
	
	private String bookno; // 예약번호
	private String alram; // 연락 방법 
	private String asktype; // 문의 유형 
	
	@Builder.Default
	private List<AttachVO> attachs = new ArrayList<>();

	/*
	 * 1번 : 자주 찾는 질문 
	 * 2번 : 1대1문의 
	 * 3번 : 이벤트 
	 */
}