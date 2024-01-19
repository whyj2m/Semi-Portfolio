package com.imfreepass.prj.mapper;

import java.util.List;

import com.imfreepass.prj.domain.RoomVO;

public interface RoomMapper {
	
	// 객실 리스트 
	List<RoomVO> getList(Long hno);
	
	// 1개 가져오기 
	RoomVO get(Long roomNo);
	
	boolean delete(Long roomNo);
	
	int insertRoom(RoomVO roomVO);
	
	// 수정 
	int update(RoomVO roomVO);
	
	// 가격
	RoomVO getPrice(Long hno);
	
	RoomVO getRoom(Long roomNo);
}
