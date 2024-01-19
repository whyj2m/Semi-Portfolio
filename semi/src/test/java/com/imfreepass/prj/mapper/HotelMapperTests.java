package com.imfreepass.prj.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class HotelMapperTests {
	private HotelMapper hotelMapper = MybatisUtils.sessionFactory().openSession(true).getMapper(HotelMapper.class);
	
	@Test
	public void testExist() {
		assertNotNull(hotelMapper);
		log.info(hotelMapper);
	}
	
	@Test
	public void testGetList() {
		hotelMapper.getList(2051L).forEach(i->log.info(i));
	}
	
	@Test
	public void testGet() {
		log.info(hotelMapper.get(6449L));
	}
	// 테스트 완 
	@Test
	public void testSelectInsertHotel() {
		HotelVO hotelVO = new HotelVO();
		hotelVO.setAno(1L);
		hotelVO.setHotelName("제주어때 테스트 호텔");
		hotelVO.setHotelTel("1111-1111");
		hotelVO.setHotelAddr("제주시 애월읍 어딘가");
		hotelVO.setHotelInfo("테스트 10월 24일");
		hotelVO.setHotelDesc("오시는길");
		hotelVO.setHotelGrade("3");
		hotelVO.setId("jung");
		log.info(hotelVO);
		hotelMapper.insertSelectKeyHotel(hotelVO);
		log.info(hotelVO);
	}
	
	@Test
	public void testDelete() {
		hotelMapper.delete(10L);
	}
	@Test
	public void testUpdate() {
		HotelVO hotelVO = hotelMapper.get(11L);
		
		hotelVO.setHotelName("제주 수정완료");
		hotelVO.setHotelAddr("제주시 수정 어딘가");
		hotelVO.setHotelInfo("수정완료글");
		
		hotelMapper.update(hotelVO);
	}
	
	@Test
	public void testGetHotel() {
		log.info(hotelMapper.getHotel("jung"));
		
	}
}

