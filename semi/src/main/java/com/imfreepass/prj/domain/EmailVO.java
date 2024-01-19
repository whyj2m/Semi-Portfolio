package com.imfreepass.prj.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmailVO {
	private String email;
	private String code;
	private Date expiresTime;
	private Date createdTime;
	
}
