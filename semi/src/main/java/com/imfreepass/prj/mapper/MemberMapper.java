package com.imfreepass.prj.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.imfreepass.prj.domain.MemberVO;

public interface MemberMapper {
	int insert(MemberVO vo);
	
	void bossInsert(MemberVO vo);
	
	boolean delete(String id);
	
	int update(MemberVO vo);
	
	int updatePw(MemberVO vo);
	
	MemberVO selectOne(String id);
	
	List<MemberVO> idSearch(@Param("name")String name,@Param("tell")String tell);
	
	List<MemberVO> pwSearch(@Param("id")String id,@Param("name") String name,@Param("tell") String tell); 
	
	List<MemberVO> getList();
	
	MemberVO login(@Param("id") String id,@Param("pw") String pw);
	
	int updateHotel(MemberVO vo);

	void updateHotel(@Param("id")String id, @Param("hno")Long hno);
	
}
