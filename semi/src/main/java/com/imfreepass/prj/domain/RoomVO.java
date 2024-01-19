package com.imfreepass.prj.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RoomVO {
	private Long roomNo;
	private Long hno;
	private String roomName;
	private int roomPrice;
	private String comment;
	private int roomimgcount;
	
	@Builder.Default
	private List<RoomImageVO> attachs = new ArrayList<RoomImageVO>(); 
}
