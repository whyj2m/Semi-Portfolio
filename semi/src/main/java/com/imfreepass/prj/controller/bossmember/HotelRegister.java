package com.imfreepass.prj.controller.bossmember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.MemberVO.MemberVOBuilder;
import com.imfreepass.prj.service.HotelService;
import com.imfreepass.prj.service.MemberService;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

@WebServlet("/bossmember/hotelregister")
@Log4j
public class HotelRegister extends HttpServlet {
	HotelService hotelService = HotelService.getInstance();
	MemberService memberService = MemberService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO member = WebUtils.getMember(req);
		if(member == null) {
			resp.sendRedirect("/member/signin");
			return;
		}
		req.getRequestDispatcher("/WEB-INF/views/bossmember/hotelregister.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = WebUtils.getMember(req);
		String id = member.getId();
		String hotelName = req.getParameter("hotelName");
		String hotelGrade = req.getParameter("hotelGrade");
		String hotelAddr = req.getParameter("roadFullAddr"); // 주소 
		String hotelTel = req.getParameter("hotelTel"); // 전화번호 
		String hotelDesc = req.getParameter("hotelDesc"); // 오시는 길 
		String ano = req.getParameter("ano");
		String hotelInfo = req.getParameter("hotelInfo"); // 설명 
		String zipCode = req.getParameter("detBdNmList");

		HotelVO vo = HotelVO.builder().id(id).ano(Long.valueOf(ano)).hotelName(hotelName).hotelGrade(hotelGrade)
				.hotelAddr(hotelAddr).hotelTel(hotelTel).hotelInfo(hotelInfo).hotelDesc(hotelDesc).zipCode(zipCode)
				.build();

		log.info(vo);

		if (hotelService.register(vo) > 0) {
			log.info(vo);
			WebUtils.alert(resp, "등록이 완료되었습니다", "/bossmember/roomlist");
		}
	}
}
