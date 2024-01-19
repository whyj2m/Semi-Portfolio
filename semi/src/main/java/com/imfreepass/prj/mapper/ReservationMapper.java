package com.imfreepass.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.domain.RoomVO;

public interface ReservationMapper {
	ReservationVO selectOne(Long bookNo);
	
//	List<ReservationVO> selectList(@Param("hno") Long hno, @Param("roomNo") Long roomNo);
	
	ReservationVO get(Long bookNo);
	
	int reservation(ReservationVO vo);
	
	List<ReservationVO> getList(Long bookNo);
	
	List<ReservationVO> getListall();
	
	int delete(Long bookNo);
	
	List<ReservationVO> listGet(String id);
	
	List<ReservationVO> list(String id);
	
}
