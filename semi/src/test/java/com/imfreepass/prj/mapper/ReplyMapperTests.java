package com.imfreepass.prj.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.imfreepass.prj.domain.ReplyVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class ReplyMapperTests {
	private ReplyMapper replyMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(ReplyMapper.class);

	@Test
	public void testExist() {
		assertNotNull(replyMapper);
		log.info(replyMapper);
	}

	@Test
	public void testGetList() {
	    Long hno = 6449L; // 적절한 hno 값으로 변경
	    
	    replyMapper.getList(hno).forEach(i -> log.info(i));
	}

	@Test
	public void testGet() {
		log.info(replyMapper.get(10L));
	}

	@Test
	public void insertReply() {
		ReplyVO replyVO = new ReplyVO();
		replyVO.setId("jung");
		replyVO.setReplyTitle("5점드립니다!");
		replyVO.setBookNo(1L);
		replyVO.setRoomNo(126L);
		replyVO.setReplyContent("6616 댓글 갯수 증가 테스트 총댓글? 증가하나요!");
		replyVO.setReplyPoint(5);
		replyVO.setReplyTitle("제목입니다");
		replyVO.setHno(6616L);
		
		
		
		replyMapper.insertReply(replyVO);
	}

	@Test
	public void testDelete() {
		replyMapper.delete(1L);
	}

	@Test
	public void testUpdate() {
		ReplyVO replyvo = replyMapper.get(13L);
		replyvo.setReplyPoint(5);
		replyvo.setReplyContent("수정해보자");

		replyMapper.update(replyvo);
	}
	// 댓글 총갯수확인
	@Test
	public void testGetTotal() {
		log.info(replyMapper.getTotal(6449L));
	}
	
	@Test
	public void testGetReply() {
		log.info(replyMapper.getReply("jung"));
	}
}
