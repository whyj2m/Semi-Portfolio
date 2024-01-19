package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.RoomImageVO;
import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.mapper.RoomImageMapper;
import com.imfreepass.prj.mapper.RoomMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class RoomImageService {
	private RoomImageMapper imageMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(RoomImageMapper.class);
	private RoomMapper roomMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(RoomMapper.class);
	
	private static RoomImageService instance = new RoomImageService();
	
	private RoomImageService() {}
	
	public static RoomImageService getInstance() {
		return instance;
	}
	
	
	
	public RoomImageVO get(Long roomNo) {
		return imageMapper.selectGet(roomNo);
	}
	
	public boolean modify(RoomVO roomVO, List<String>uuids) {
		boolean b = roomMapper.update(roomVO) > 0;
		
		if(b) {
			imageMapper.deleteOption(roomVO.getRoomNo(), uuids);
			
			roomVO.getAttachs().forEach(attach -> {
				attach.setRoomNo(roomVO.getRoomNo());
				imageMapper.insert(attach);
			});
		}
		return b;
	}
	
	public boolean delete(Long roomNo) {
		return imageMapper.deleteRoomNo(roomNo);
	}
}
