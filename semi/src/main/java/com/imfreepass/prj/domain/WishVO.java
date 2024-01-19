package com.imfreepass.prj.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class WishVO {
	private Long wno;
	private Long hno;
	private String id;
}
