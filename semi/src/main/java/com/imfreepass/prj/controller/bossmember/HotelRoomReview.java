package com.imfreepass.prj.controller.bossmember;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.ReplyVO;
import com.imfreepass.prj.service.HotelService;
import com.imfreepass.prj.service.ReplyService;
import com.imfreepass.prj.service.RoomService;
import com.imfreepass.prj.util.WebUtils;

@WebServlet("/bossmember/roomreview")
public class HotelRoomReview extends HttpServlet{
	private RoomService roomService = RoomService.getInstance();
	private HotelService hotelService = HotelService.getInstance();
	private ReplyService replyService = ReplyService.getInstance();
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  MemberVO member = WebUtils.getMember(req);
		  	
		  	System.out.println(member);
		  	
		    List<HotelVO> hotelVOs = hotelService.getHotel(member.getId());
		    List<ReplyVO> replyVOs = replyService.getReply(member.getId());

		    req.setAttribute("hotel", hotelVOs);

		    System.out.println(replyVOs);
		    System.out.println(hotelVOs);

		    // hno로 분리
		    req.setAttribute("room", hotelVOs.stream().map(hotel -> roomService.getlist(hotel.getHno())).collect(Collectors.toList()));
		    req.setAttribute("reply", replyVOs.stream().map(reply -> replyService.getlist(reply.getHno())).collect(Collectors.toList()));
		    req.getRequestDispatcher("/WEB-INF/views/bossmember/roomreview.jsp").forward(req, resp);
		}
	
	// 체크박스 딜리트 용도
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] nos = req.getParameterValues("box");
		System.out.println(Arrays.toString(nos));
		
		Arrays.asList(nos).forEach(no -> roomService.delete(Long.valueOf(no)));
		
		resp.sendRedirect("roomreview");

	}
}
