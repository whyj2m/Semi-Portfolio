package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.AskBoardVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.mapper.AttachMapper;
import com.imfreepass.prj.mapper.BoardMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class BoardService {
	
	private BoardMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(BoardMapper.class);
	private AttachMapper attachmapper = MybatisUtils.sessionFactory().openSession(true).getMapper(AttachMapper.class);
	
	private static BoardService instance = new BoardService();
	
	private BoardService() {}
	
	public static BoardService getInstance() {
		return instance;
	}
	
	public int register(BoardVO boardvo) {
		int ret = mapper.insertSelectKey(boardvo);
		boardvo.getAttachs().stream().map(attach -> {
			attach.setBno(boardvo.getBno());		
			return attach;
		}).forEach(attach -> attachmapper.insert(attach));
		return ret;
		
	}

	public BoardVO get(Long bno) {
		return mapper.get(bno);
	}

	
	public boolean modify(BoardVO boardvo) {
		return mapper.update(boardvo);
	}

	
	public boolean delete(Long bno) {
		return mapper.delete(bno);
	}

	
	public List<BoardVO> getlist(CriteriaVO criteria) {
		return mapper.getList(criteria);
	}
	
	public int getCount(CriteriaVO criteria) {
		return mapper.getTotal(criteria);
	}

	public BoardVO findBy(Long bno) {
		BoardVO vo = mapper.get(bno);
		return vo;
		
	}

	
}
