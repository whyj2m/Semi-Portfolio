package service;

import org.junit.Test;

import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.mapper.ReservationMapper;
import com.imfreepass.prj.util.MybatisUtils;

import lombok.extern.log4j.Log4j;

@Log4j
public class ReservationServiceTests {
	private ReservationMapper mapper = MybatisUtils.sessionFactory().openSession(true).getMapper(ReservationMapper.class);
	
	
	@Test
	public void test() {
		ReservationVO vo = new ReservationVO();
		vo.setRoomNo(86L);
		vo.setHno(6449L);
		vo.setRoomName("123");
		vo.setRoomPrice(1234);
		vo.setHotelTel("123");
		vo.setBookState(1);
				
				
				
		mapper.reservation(vo);
	}
	
	@Test
	public void cancleTests() {
		mapper.delete(5L);
	}
	
	@Test
	public void getTests() {
		mapper.listGet("1");
	}
	
	@Test
	public void list() {
		mapper.list("1");
	}
}
