package com.imfreepass.prj.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class RoomMapperTests {
	private RoomMapper roomMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(RoomMapper.class);
	
	@Test
	public void testExist() {
		assertNotNull(roomMapper);
		log.info(roomMapper);
	}
	
	@Test
	public void testGetList() {
		roomMapper.getList(66650L).forEach(i->log.info(i));
	}
	
	@Test
	public void testRoom() {
		roomMapper.getRoom(1L);
	}
	
	@Test
	public void testGet() {
		log.info(roomMapper.get(2L));
	}
//	@Test
//	public void testInsertRoom() {
//		RoomVO roomVO = new RoomVO();
//		roomVO.setHno(2L);
//		roomVO.setRoomName("테스트");
//		roomVO.setRoomPrice("190,000");
//		roomVO.setComment("코멘트");
//
//		roomMapper.insertRoom(roomVO);
//		log.info(roomVO);
//	}
	@Test
	public void testDelete() {
		roomMapper.delete(11L);
	}
//	@Test
//	public void testUpdate() {
//		RoomVO roomVO = roomMapper.get(11L);
//		
//		roomVO.setRoomName("메퍼 수정 룸");
//		roomVO.setRoomPrice("111,111");
//		
//		roomMapper.update(roomVO);
//	}
	
	@Test
	public void testGetPrice() {
		RoomVO roomVO = roomMapper.getPrice(6637L);
	}
}

