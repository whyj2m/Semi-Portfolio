package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.mapper.RoomImageMapper;
import com.imfreepass.prj.mapper.RoomMapper;
import com.imfreepass.prj.util.MybatisUtils;


public class RoomService {
	
	private RoomMapper roomMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(RoomMapper.class);
	private RoomImageMapper imageMapper = 	MybatisUtils.sessionFactory().openSession(true).getMapper(RoomImageMapper.class);
	
	private static RoomService instance = new RoomService();
	
	private RoomService() {}
	
	public static RoomService getInstance() {
		return instance;
	}
	
	public RoomVO getRoom(Long roomNo) {
		return roomMapper.get(roomNo);
	}

	
	public RoomVO get(Long roomNo) {
		return roomMapper.get(roomNo);
	}

	
	public int modify(RoomVO roomVO) {
		return roomMapper.update(roomVO);
	}

	
	public boolean delete(Long roomNo) {
		imageMapper.deleteRoomNo(roomNo);
		return roomMapper.delete(roomNo);
	}

	
	public List<RoomVO> getlist(Long hno) {
		return roomMapper.getList(hno);
	}
	
	public RoomVO getPrice(Long hno) {
		return roomMapper.getPrice(hno);
	}
	
	public int register(RoomVO roomvo) {
		int ret = roomMapper.insertRoom(roomvo);
		roomvo.getAttachs().stream().map(attach -> {
			attach.setRoomNo(roomvo.getRoomNo());
			return attach;
		}).forEach(attach -> imageMapper.insert(attach));
		return ret;
	}
	
}
