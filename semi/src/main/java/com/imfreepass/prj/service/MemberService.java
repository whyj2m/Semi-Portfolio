package com.imfreepass.prj.service;

import java.util.List;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.mapper.HotelMapper;
import com.imfreepass.prj.mapper.MemberMapper;
import com.imfreepass.prj.util.MybatisUtils;

import at.favre.lib.crypto.bcrypt.BCrypt;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemberService {
	private MemberMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(MemberMapper.class);
	
	private static MemberService instance = new MemberService();
	
	private MemberService() {}
	
	public static MemberService getInstance() {
		return instance;
	}
	
	
	public int regist(MemberVO vo) {
		vo.setPw(BCrypt.withDefaults().hashToString(12, vo.getPw().toCharArray()));
		return mapper.insert(vo);
	}

	// 회원 정보 수정
	public boolean modify(MemberVO vo) {
		return mapper.update(vo) > 0;
	}
	
	// 회원 비번 변경 
	public boolean modifyPw(MemberVO vo) {
		return mapper.updatePw(vo) > 0;
	}
	
	public void idSearch(String name, String tell) {
		mapper.idSearch(name, tell);
	}
	
	public void pwSearch(String id, String name, String tell) {
		mapper.pwSearch(id, name, tell);
	}
	
	public boolean remove(String id) {
		return mapper.delete(id);
	}
	
	public MemberVO findby(String id) {
		return mapper.selectOne(id);
	}
	
	public MemberVO login(String id, String pw) {
		return mapper.login(id, pw);
	}
	
	public boolean signup(MemberVO vo) {
		return mapper.insert(vo) > 0;
	}
	
	public List<MemberVO> getList() {
		return mapper.getList();
	}
	
	public void updateHotel(String id, Long hno) {
		mapper.updateHotel(id, hno);
	}
	
	public boolean idAvailable(String id) {
		return mapper.selectOne(id) == null;
	}
}
