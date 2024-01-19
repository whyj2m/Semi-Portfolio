package service;

import org.junit.Test;


import com.imfreepass.prj.domain.RoomVO;

import com.imfreepass.prj.service.RoomService;

import lombok.extern.log4j.Log4j;

@Log4j
public class RoomServiceTests {
	private RoomService roomService = RoomService.getInstance();
	
	@Test
	public void testGet() {
		log.info(roomService.get(11L));
	}
	
	@Test
	public void testRegister() {
		RoomVO vo = new RoomVO();
		vo.setHno(55L);
		vo.setRoomName("서비스");
		vo.setRoomPrice(111111);
		vo.setComment("코멘트");
		roomService.register(vo);
		log.info(vo);
	}
//	@Test
//	public void testModify() {
//		RoomVO vo = roomService.get(11L);
//		
//		vo.setRoomName("교체룸");
//		vo.setRoomPrice("1111-111");
//
//		roomService.modify(vo);
//		log.info(11L);
//	}
	
	@Test
	public void testdelete() {
		roomService.delete(16L);
	}
	
	@Test
	public void testGetList() {
		roomService.getlist(6449L).forEach(i->log.info(i));
	}
	

	
}