package com.imfreepass.prj.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Alias("member")
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String id;
	private int grade;
	private String pw;
	private String name;
	private String email;
	private String tell;
	private String businessNo;
	
	private Long hno; // 호텔 정보 > 사업자용 

	public MemberVO(String id, Long hno) {
		this.id = id;
		this.hno = hno;
	}
}
