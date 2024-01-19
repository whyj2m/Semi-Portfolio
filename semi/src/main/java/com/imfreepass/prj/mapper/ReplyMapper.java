package com.imfreepass.prj.mapper;

import java.util.List;

import com.imfreepass.prj.domain.ReplyVO;




public interface ReplyMapper {
	int insertReply(ReplyVO vo);

	ReplyVO get(Long replyno);
	
	List<ReplyVO> getList(Long hno);

	int delete(Long replyno);

	int update(ReplyVO vo);
	
	int getTotal(Long hno);
	
	// null값도 처리하기위하여..?
	int getAvg(Long hno);

	// 사장님 댓글리뷰 확인
	List<ReplyVO> getReply(String id);

//	List<ReplyVO> getListWithPaging(@Param("cri") CriteriaVO criteria, @Param("bno") Long bno);
//
//	int getTotal(@Param("cri") CriteriaVO criteria, @Param("bno") Long bno);
}
