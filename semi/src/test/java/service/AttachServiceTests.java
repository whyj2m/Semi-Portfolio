package service;

import org.junit.Test;

import com.imfreepass.prj.domain.AttachVO;
import com.imfreepass.prj.service.AttachService;

import lombok.extern.log4j.Log4j;

@Log4j
public class AttachServiceTests {
	private AttachService service = AttachService.getInstance();
	
	@Test
	public void testRegister() {
		AttachVO vo = new AttachVO();
		vo.setBno(100L);
		vo.setAskuuid("호진아정신차려!");
		vo.setOrigin("배고프다 슬슬 ");
		vo.setAskpath("집에가장");
		
		service.register(vo);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		service.delete("dd");
	}
	
	@Test
	public void testAllDelete() {
		service.deleteAll(100L);
	}
	@Test
	public void testFindByBno() {
		service.getList(99L);
	}
}
