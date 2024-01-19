package com.imfreepass.prj.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class MemberMapperTests {
	private MemberMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(MemberMapper.class);
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
		log.info(mapper);
	}
	
	@Test
	public void testGetList() {
		mapper.getList();
	}
	
	@Test
	public void bossinserttest() {
		MemberVO vo = new MemberVO();
		vo.setId("탕후루23");
		vo.setGrade(1);
		vo.setPw("1234");
		vo.setName("이웃주민");
		vo.setEmail("123@123.com");
		vo.setTell("111-1111-1111");
		log.info(vo);
		mapper.insert(vo);
		
	}

	@Test
	public void insertTest() {
		MemberVO vo = new MemberVO();
		vo.setId("탕후루23");
		vo.setPw("1234");
		vo.setName("이웃주민");
		vo.setEmail("123@123.com");
		vo.setTell("111-1111-1111");
		log.info(vo);
		mapper.insert(vo);
	}
	
	
	@Test
	public void selectOneTest() {
		mapper.selectOne("test");
	}
	
	@Test
	public void jebal() {
		mapper.idSearch("이웃주민","111-1111-1111");
	}
	
	
	@Test
	public void pwTest() {
		mapper.pwSearch("탕후루23", "이웃주민", "111-1111-1111");
	}
	
	@Test
	public void deleteTest() {
		mapper.delete("탕후루23");
	}
	
	@Test
	public void update() {
		MemberVO vo = mapper.selectOne("1");
		vo.setName("원주민");
		vo.setEmail("123");
		vo.setTell("123");
		mapper.update(vo);
	}

}
