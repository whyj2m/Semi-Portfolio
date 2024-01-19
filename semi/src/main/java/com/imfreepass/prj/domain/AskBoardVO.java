package com.imfreepass.prj.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AskBoardVO {
	private Long adminno;
	private Long bno;
	String content;
	

}
