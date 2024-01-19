package com.imfreepass.prj.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class ReplyVO {
	
	// Setter오류가 떠서 추가해봅니다..
	private Long replyNo;
	
	public void setReplyno(Long replyNo) {
	    this.replyNo = replyNo;
	}

	private String id;
	private Long bookNo;
	private Long roomNo;
	private String replyContent;
	private int replyPoint;
	private Date replyDate;
	private String replyTitle;
	
	private Long hno;
	
}
