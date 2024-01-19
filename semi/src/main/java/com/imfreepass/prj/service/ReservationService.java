package com.imfreepass.prj.service;

import java.util.Date;
import java.util.List;

import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.mapper.HotelMapper;
import com.imfreepass.prj.mapper.ReplyMapper;
import com.imfreepass.prj.mapper.ReservationMapper;
import com.imfreepass.prj.mapper.RoomMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class ReservationService {
	RoomMapper roomMapper;
	HotelMapper hotelMapper;
	private ReservationMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(ReservationMapper.class);
	
	private static ReservationService instance = new ReservationService();
	
	private ReservationService() {}
	
	public static ReservationService getInstance() {
		return instance;
	}
	
//	bookNo;
//	roomNo;
//	hno;
//	id;
//	hotelTel;
//	roomName;
//	bookState;
//	checkIn;
//	checkOut;
//	roomPrice; 
//	payHow;
//	payTime;
	// 예약번호를 통한 방 정보 조회
//	public ReservationVO get(Long bookNo) {
//		// hno를 통해서 hotel 정보 불러오면 되는거 아닌가
//		ReservationVO vo = new ReservationVO();
//		vo.getBookNo();
//		roomMapper.get(vo.getRoomNo());
//		vo.getHno();
//		vo.getId();
//		vo.getHotelTel();
//		roomMapper.getRoom(vo.getRoomNo());
//		vo.getBookState();
//		vo.getCheckIn();
//		vo.getCheckOut();
//		vo.getRoomPrice();
//		vo.getPayHow();
//		vo.getPayTime();
//		return vo;
//	}
	
	public int reservation(ReservationVO vo) {
		return mapper.reservation(vo);
	}
	
	public List<ReservationVO> getList(Long bookNo){
		return mapper.getList(bookNo);
	}
		public boolean cancel(Long bookNo) {
		return mapper.delete(bookNo) > 0 ;
	}
		
	public List<ReservationVO> listGet(String id){
		return mapper.listGet(id);
	}
	
	
	public List<ReservationVO> getListall(){
		return mapper.getListall();
	}
	
	public List<ReservationVO> list(String id) {
		mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(ReservationMapper.class);
		return mapper.list(id);
	}
}
