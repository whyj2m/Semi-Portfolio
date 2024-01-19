package com.imfreepass.prj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imfreepass.prj.domain.RoomImageVO;
import com.imfreepass.prj.domain.RoomVO;




public interface RoomImageMapper {
		

		void insert(RoomImageVO vo); 
		boolean delete(String uuid);  
		boolean deleteAll(Long hno); 
		
		List<RoomVO> findByBno(Long hno);
		
		List<RoomVO> getOldFiles(); // ??
		
		RoomImageVO selectGet(Long roomNo); // attach 불러오기 
		
		// 첨부파일 수정용
		void deleteOption(@Param("roomNo") Long roomNo, @Param("uuids") List<String> uuids);
		
		boolean deleteRoomNo(Long roomNo);
	}
