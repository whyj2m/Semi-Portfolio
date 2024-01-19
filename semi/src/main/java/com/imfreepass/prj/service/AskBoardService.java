package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.AskBoardVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.mapper.AskBoardMapper;
import com.imfreepass.prj.mapper.AttachMapper;
import com.imfreepass.prj.mapper.BoardMapper;
import com.imfreepass.prj.util.MybatisUtils;

public class AskBoardService {
	

	private AskBoardMapper askboardMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(AskBoardMapper.class);
	
	private static AskBoardService instance = new AskBoardService();
	
	private AskBoardService() {}
	
	public static AskBoardService getInstance() {
		return instance;
	}
	

	public int askinsert(AskBoardVO vo) {
		return askboardMapper.insertAsk(vo);
	}
	
	public AskBoardVO get(Long bno) {
		return askboardMapper.getAsk(bno);
	}
}
