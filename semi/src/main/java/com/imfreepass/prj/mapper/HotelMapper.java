package com.imfreepass.prj.mapper;

import java.util.List;
import java.util.Map;

import com.imfreepass.prj.domain.HotelVO;

public interface HotelMapper {
	
	List<HotelVO> getList(Long ano);
	HotelVO get(Long hno);
	
	// 호텔 등록 (사장님) > id 추가 
	int insertSelectKeyHotel(HotelVO hotelVO);
	
	boolean delete(Long hno);
	boolean update(HotelVO hotelVO);
	
	// main 페이지 사용 목적
	List<Map<String, Object>> list();
	
	// 객실 등록할 때 호텔 정보 불러오기 
	List<HotelVO> getHotel(String id);
	
	
}
