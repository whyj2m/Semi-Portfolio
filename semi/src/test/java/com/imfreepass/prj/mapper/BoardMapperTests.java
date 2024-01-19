package com.imfreepass.prj.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class BoardMapperTests {
	private BoardMapper boardMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(BoardMapper.class);

	@Test
	public void testExist() {
		assertNotNull(boardMapper);
		log.info(boardMapper);
	}

	@Test
	public void testGetList() {
		CriteriaVO criteria = new CriteriaVO();
		criteria.setPageNum(2);
		boardMapper.getList(criteria).forEach(i->log.info(i));
	}

	@Test
	public void testGet() {
		log.info(boardMapper.get(10L));
	}

	@Test
	public void testInsertSelectkey() {
		BoardVO boardvo = new BoardVO();
		boardvo.setTitle("등록테스트");
		boardvo.setContent("등록내용확인 ");
		boardvo.setId("1");
		
		boardvo.setCategory(3);
		boardvo.setBookno("test123");
		boardvo.setAlram("1111");
		boardvo.setAsktype("1");
		log.info(boardvo);
		boardMapper.insertSelectKey(boardvo);
		log.info(boardvo);
	}

	@Test
	public void testDelete() {
		boardMapper.delete(16L);
	}

	@Test
	public void testUpdate() {
		BoardVO boardvo = boardMapper.get(15L);
		boardvo.setTitle("수루루루루정");
		boardvo.setContent("수정해보자");

		boardMapper.update(boardvo);
	}
}
