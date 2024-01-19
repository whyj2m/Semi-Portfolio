package service;

import org.junit.Test;

import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.service.BoardService;
import lombok.extern.log4j.Log4j;
/*
 * 김정연 테스트 완료 
 */
@Log4j
public class BoardServiceTests {
	private BoardService service = BoardService.getInstance();
	
	@Test
	public void testGet() {
		log.info(service.get(10L));
	}
	
	@Test
	public void testRegister() {
		BoardVO boardvo = new BoardVO();
		boardvo.setTitle("등록테스트2");
		boardvo.setContent("등록내용확인 ");
		boardvo.setId("1");
		
		boardvo.setCategory(3);
		boardvo.setBookno("test123");
		boardvo.setAlram("1111");
		boardvo.setAsktype("1");
		log.info(boardvo);
		service.register(boardvo);
		log.info(boardvo);
	}
	@Test
	public void testModify() {
		BoardVO vo = service.get(20L);
		
		vo.setTitle("쌀국수");
		vo.setContent("너무배불렁");
		vo.setId("test");
		service.modify(vo);
		log.info(20L);
	}
	@Test
	public void testdelete() {
		service.delete(19L);
	}
//	@Test
//	public void testGetList() {
//		service.getlist(1).forEach(i->log.info(i));
//	}
}