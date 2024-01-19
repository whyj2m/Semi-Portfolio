package com.imfreepass.prj.domain;

import lombok.Data;

/*
 * 김정연
 * 공지사항, 자주찾는 질문 페이징 
 */
@Data
public class PageDto {
	private final int SHOW_PAGE_COUNT = 10;

	private CriteriaVO cri;
	private int total;

	private int startPage;
	private int endPage;

	
	// resultset audit 
	private boolean next;
	private boolean prev;

	public PageDto(CriteriaVO cri, int total) {
		this.cri = cri;
		this.total = total;
		
		endPage = (cri.getPageNum() + (SHOW_PAGE_COUNT-1)) / SHOW_PAGE_COUNT * SHOW_PAGE_COUNT;
		startPage = endPage - (SHOW_PAGE_COUNT-1);
		
		int realEnd = (total + (cri.getAmount()-1)) / cri.getAmount();
		
		if(endPage > realEnd) {
			endPage = realEnd;
		}
		
		next = cri.getPageNum() < realEnd;
		prev=cri.getPageNum()>1&&cri.getPageNum()<=realEnd;
		
		//offset = (cri.getPageNum() - 1) * cri.getAmount()
	}
}
