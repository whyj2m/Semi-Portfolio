package com.imfreepass.prj.service;

import java.util.List;
import java.util.Map;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.mapper.HotelMapper;
import com.imfreepass.prj.util.MybatisUtils;


public class HotelService {
	
	private HotelMapper hotelmapper = MybatisUtils.sessionFactory().openSession(true).getMapper(HotelMapper.class);
	
	private static HotelService instance = new HotelService();
	
	private HotelService() {}
	
	public static HotelService getInstance() {
		return instance;
	}
	
	// 호텔 등록 
	public int register(HotelVO hotelVO) {
		return hotelmapper.insertSelectKeyHotel(hotelVO);
	}

	
	public HotelVO get(Long hno) {
		return hotelmapper.get(hno);
	}

	
	public boolean modify(HotelVO hotelVO) {
		return hotelmapper.update(hotelVO);
	}

	
	public boolean delete(Long hno) {
		return hotelmapper.delete(hno);
	}

	
	public List<HotelVO> getlist(Long ano) {
		hotelmapper = MybatisUtils.sessionFactory().openSession(true).getMapper(HotelMapper.class);
		return hotelmapper.getList(ano);
	}
	
	// 메인 리스트
	public List<Map<String, Object>> mainList() {
		hotelmapper = MybatisUtils.sessionFactory().openSession(true).getMapper(HotelMapper.class);
		return hotelmapper.list();
	}
	
	public List<HotelVO> getHotel(String id){
		return hotelmapper.getHotel(id);
	}
}
