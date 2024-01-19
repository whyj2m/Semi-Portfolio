package com.imfreepass.prj.mapper;

import org.junit.Test;

import com.imfreepass.prj.domain.AttachVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class AttachMapperTests {
	private AttachMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(AttachMapper.class);
	
	@Test
	public void testInsert() {
		AttachVO vo = new AttachVO();
		vo.setAskuuid("attach test");
		vo.setOrigin("attach origin");
		vo.setAskpath("c:~~~");
		
		mapper.insert(vo);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		mapper.delete("attach test");
	}
	
	@Test
	public void testDeleteAll() {
		mapper.deleteAll(96L);
	}
	
	@Test
	public void testFindbyBno() {
		mapper.findByBno(100L);
	}
}
