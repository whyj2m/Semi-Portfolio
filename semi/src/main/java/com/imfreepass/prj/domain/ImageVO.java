package com.imfreepass.prj.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ImageVO {
	private Long ino;
	private Long hno;
	private String hotelName;
	private String path;
	
}
