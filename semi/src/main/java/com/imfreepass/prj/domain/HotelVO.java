package com.imfreepass.prj.domain;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HotelVO {
	private Long hno;
	private Long ano; // 제주시국제공항 애월 서귀포 중문 
					//   2051       2053  2052  2055   
 	private String hotelName;
	private String hotelTel;
	private String hotelAddr;
	private String hotelInfo; 
	private String hotelGrade;
	private String hotelDesc;
	private String zipCode; // 우편번호
	private String id;
	private int hotelImgCount;
	
	// 룸(댓글갯수,평점평균,가격)
	private int replyCnt;
	private Integer avg;
	private long price;
	
}
