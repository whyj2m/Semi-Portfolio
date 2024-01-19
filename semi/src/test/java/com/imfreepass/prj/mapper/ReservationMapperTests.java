package com.imfreepass.prj.mapper;

import org.junit.Test;

import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;


@Log4j
public class ReservationMapperTests {
	private ReservationMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(ReservationMapper.class);
	
//	@Test
//	public void selsectTest() {
//		mapper.selectList(66650L, 1L);
//	}
	
	@Test
	public void readTest() {
		log.info(mapper);
		mapper.get(1L);
	}
	
//	@Test
//	public void getListTest() {
//		mapper.getList(1L);
//	}
	
	@Test
	public void getTests() {
		mapper.get(1L);
	}
	
	@Test
	public void reservation() {
		ReservationVO vo = new ReservationVO();
		log.info(vo);
		vo.setRoomNo(2L);
		vo.setRoomNo(86L);
		vo.setBookState(0);
		vo.setId("1");
		vo.setHotelTel("123");
		vo.setRoomName("디럭스");
		vo.setRoomPrice(1170000);
		vo.setPayHow(0);
		log.info(vo);
		mapper.reservation(vo);
	}
	
	@Test
	public void delete() {
		mapper.delete(4L);
	}
	
	@Test
	public void listGetTests() {
		mapper.listGet("1");
	}
	
	@Test
	public void test() {
		mapper.list("1");
	}
}
