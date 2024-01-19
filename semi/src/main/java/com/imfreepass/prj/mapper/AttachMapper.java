package com.imfreepass.prj.mapper;

import java.util.List;

import com.imfreepass.prj.domain.AttachVO;


public interface AttachMapper {
		

		void insert(AttachVO vo); // 첨부파일 등록 
		boolean delete(String uuid); // 첨부파일 1개 삭제 
		boolean deleteAll(Long bno); // bno 1개당 첨부파일 전부 삭제 
		
		List<AttachVO> findByBno(Long bno); // bno로 첨부파일 조회 
		
		List<AttachVO> getOldFiles(); // ??
	}
