package com.imfreepass.prj.mapper;

import java.util.List;

import com.imfreepass.prj.domain.AskBoardVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;


public interface BoardMapper {
		

		BoardVO get(Long bno); // 문의 1개 조회 
		int insertSelectKey(BoardVO boardVO); // 문의 등록 
		boolean delete(Long bno); // 문의 1개 삭제 
		boolean update(BoardVO boardvo); // 문의 수정 
		
		// 게시글 갯수 
		int getTotal(CriteriaVO criteria);
		
		// 카테고리별 게시글 리스트 조회 		
		List<BoardVO> getList(CriteriaVO criteria);
		
		// 삭제는 첨부파일 지우고 게시글 지워야 한다. 
		

	}
