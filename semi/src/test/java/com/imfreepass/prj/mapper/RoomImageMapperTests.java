package com.imfreepass.prj.mapper;

import org.junit.Test;

import com.imfreepass.prj.domain.RoomImageVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class RoomImageMapperTests {
	private RoomImageMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(RoomImageMapper.class);
	
	@Test
	public void testInsert() {
		RoomImageVO vo = new RoomImageVO();
		vo.setUuid("유유");
		vo.setRoomNo(1L);
		vo.setOrigin("오리지널");
		vo.setPath("경로");
		
		mapper.insert(vo);
		log.info(vo);
	}
	
	@Test
	public void testGet() {
		log.info(mapper.selectGet(991L));
	}
}
