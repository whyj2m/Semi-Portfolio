package com.imfreepass.prj.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RoomImageVO {
	String uuid;
	Long roomNo;
	String path;
	String origin;
	
}
