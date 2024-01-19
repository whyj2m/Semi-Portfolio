package service;

import org.junit.Test;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.mapper.MemberMapper;
import com.imfreepass.prj.service.MemberService;

import at.favre.lib.crypto.bcrypt.BCrypt;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemberServiceTests {
	MemberService memberService = MemberService.getInstance(); 
	
	@Test
	public void registTest() {
		MemberVO vo = new MemberVO();
		vo.setId("44321");
		vo.setPw("1234");
		vo.setName("이웃주민");
		vo.setEmail("www@naver.com");
		vo.setGrade(1);
		vo.setTell("111-1111-1111");
		
		memberService.regist(vo);
		log.info(vo);
	}
	
	@Test
	public void updatePw() {
		MemberVO vo = memberService.findby("1");
		String as = "1234";
		// 이렇게 하는게 아닌가 왜 업데이트가안되는거지
		 vo.setPw(BCrypt.withDefaults().hashToString(12, as.toCharArray()));
		
		memberService.modifyPw(vo);
		log.info(vo);
	}
	
	@Test
	public void updateTest() {
		MemberVO vo = memberService.findby("1");
		vo.setName("엄주민23");
		vo.setEmail("123");
		vo.setTell("222");
		
		memberService.modify(vo);
		log.info(vo);
	}
//	@Test
//	public void testUpdateHotel() {
//		MemberVO vo = new MemberVO();
//		vo.setId("jung");
//		vo.setHno(6572L);
//		memberService.UpdateHotel(vo);
//		log.info(vo);
//	}
}