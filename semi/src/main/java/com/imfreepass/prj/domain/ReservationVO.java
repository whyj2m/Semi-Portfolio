package com.imfreepass.prj.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReservationVO {
	private Long bookNo;
	private Long roomNo;
	private Long hno;
	private String id;
	private int bookState;
	private String hotelTel;
	private String roomName;
	private Date checkin;
	private Date checkout;
	private int roomPrice; 
	private int payHow;
	private Date payTime;
	
	RoomVO room;
	HotelVO hotel;
}
