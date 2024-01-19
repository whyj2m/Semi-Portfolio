package com.imfreepass.prj.mapper;

import java.util.List;

import com.imfreepass.prj.domain.AskBoardVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;


public interface AskBoardMapper {
		

		
		int insertAsk(AskBoardVO vo);
		
		// admin 답변 불러오기 
		AskBoardVO getAsk(Long bno);
	}
