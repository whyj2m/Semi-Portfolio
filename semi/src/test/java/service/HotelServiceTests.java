package service;

import org.junit.Test;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.service.HotelService;

import lombok.extern.log4j.Log4j;

@Log4j
public class HotelServiceTests {
	private HotelService hotelservice = HotelService.getInstance();
	
	@Test
	public void testGet() {
		log.info(hotelservice.get(76150L));
	}
	// 테스트 완료 
	@Test
	public void testRegister() {
		HotelVO hotelVO = new HotelVO();
		hotelVO.setAno(1L);
		hotelVO.setHotelName("?? 테스트 호텔22");
		hotelVO.setHotelTel("1111-1111");
		hotelVO.setHotelAddr("제주시 애월읍 어딘가");
		hotelVO.setHotelInfo("테스트 10월 24일");
		hotelVO.setHotelDesc("오시는길");
		hotelVO.setId("jung");
		hotelVO.setHotelGrade("3");
		
		hotelservice.register(hotelVO);
		log.info(hotelVO);
	}
	
	
	@Test
	public void testModify() {
		HotelVO vo = hotelservice.get(2L);
		
		vo.setHotelAddr("호텔 서비스 테스트시");
		vo.setHotelInfo("서버테스트 호텔");
		vo.setHotelTel("1111-1111");
		vo.setHotelName("서비스테스트");
		hotelservice.modify(vo);
		log.info(2L);
	}
	
	@Test
	public void testdelete() {
		hotelservice.delete(16L);
	}
	
	@Test
	public void testGetList() {
		hotelservice.getlist(2051L).forEach(i->log.info(i));
	}
	@Test
	public void testGetHotel() {
		log.info(hotelservice.getHotel("jung"));
	}
}