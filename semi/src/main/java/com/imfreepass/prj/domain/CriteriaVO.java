package com.imfreepass.prj.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CriteriaVO {
	
	@Builder.Default
	private int pageNum = 1; // 페이지 넘버 
	@Builder.Default
	private int amount = 10; // 게시물 갯수 
	@Builder.Default
	private int category = 1; // 카테고리 
	
	// 페이징
	public int getOffset(){
		return (pageNum - 1) * amount;
	}
	
	public String getQs() {
		List<String> list = new ArrayList<String>();
		list.add("pageNum=" + pageNum);
		list.add("amount=" + amount);
		list.add("category=" + category);
		return String.join("&", list); // join은 구분자를 이용해서 문자열로 반환 
		
	}
	public String getQs2() {
		List<String> list = new ArrayList<String>();
//		list.add("pageNum=" + pageNum);
		list.add("amount=" + amount);
		list.add("category=" + category);
		return String.join("&", list);
	}
}
