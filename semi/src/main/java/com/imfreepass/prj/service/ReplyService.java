package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.ReplyVO;
import com.imfreepass.prj.mapper.ReplyMapper;
import com.imfreepass.prj.util.MybatisUtils;


public class ReplyService {
	
	private ReplyMapper replyMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(ReplyMapper.class);
		
	private static ReplyService instance = new ReplyService();
	
	private ReplyService() {}
	
	public static ReplyService getInstance() {
		return instance;
	}
	
	public void register(ReplyVO replyVO, Long hno) {
		replyVO.setHno(hno);
		replyMapper.insertReply(replyVO);
	}

	
	public ReplyVO get(Long replyNo) {
		return replyMapper.get(replyNo);
	}

	
	public int modify(ReplyVO replyVO) {
		return replyMapper.update(replyVO);
	}

	
	public int delete(Long replyNo) {
		return replyMapper.delete(replyNo);
	}

	
	public List<ReplyVO> getlist(Long hno) {
		return replyMapper.getList(hno);
	}
	
	public int getTotal(Long replyNO) {
		return replyMapper.getTotal(replyNO);
	}
	
	// 리턴타입을 integer? 로 하면 null도 받을수있다? 뭐지
	public int getAvg(Long hno) {
		return replyMapper.getAvg(hno);
	}
	
	// 사장님 댓글확인
	public List<ReplyVO> getReply(String id){
		return replyMapper.getReply(id);
	}
}
