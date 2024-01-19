package com.imfreepass.prj.controller.payment;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.HotelVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.domain.RoomVO;
import com.imfreepass.prj.service.MemberService;
import com.imfreepass.prj.service.ReservationService;
import com.imfreepass.prj.service.RoomService;
import com.imfreepass.prj.util.WebUtils;

@WebServlet("/payment")
public class Payment extends HttpServlet {
	private ReservationService service = ReservationService.getInstance();
	private RoomService roomService = RoomService.getInstance();
	private MemberService memberService = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/payment/payment.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotelName = req.getParameter("hotelName");
		String roomNoParam = req.getParameter("roomNo");
		String hno = req.getParameter("hno");
		String roomName = req.getParameter("roomName");
		String roomPrice = req.getParameter("roomPrice");
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		String id = req.getParameter("id");
		String tel = req.getParameter("tel");
		String action = req.getParameter("action");
		String bookNoParam = req.getParameter("bookNo");
		boolean isRedirect = false;
//	    System.out.println("hotel name : "  + hotelName);
//		Long bookNo = Long.valueOf(bookNoParam);
//		req.setAttribute("bookNo", bookNo);
//		List<ReservationVO> reservations = service.getList(bookNo);
//		req.setAttribute("books", reservations);

		if (roomNoParam != null) {
			Long roomNo = Long.parseLong(roomNoParam);
			req.setAttribute("hotelName", hotelName);
			req.setAttribute("roomName", roomName);
			req.setAttribute("roomPrice", roomPrice);
			req.setAttribute("start", start);
			req.setAttribute("end", end);
			req.setAttribute("roomNo", roomNo);

			MemberVO mem = (MemberVO) req.getSession().getAttribute("member");
//		Result result = BCrypt.verifyer().verify(pw.toCharArray(), mem.getPw());
			if (mem == null) { // mypage에 로그인이 안되어있으면 main으로 보내버리기
				resp.sendRedirect("/main");
				return;
			}
			RoomVO rvo = roomService.get(roomNo);
			MemberVO mvo = memberService.findby(mem.getId());
			try {
				ReservationVO vo = ReservationVO.builder()
						.roomNo(rvo.getRoomNo())
						.hno(rvo.getHno())
						.id(mvo.getId())
						.hotelTel(tel)
						.roomName(rvo.getRoomName())
						.bookState(1)
						.checkin(new SimpleDateFormat("yyyy/MM/dd").parse(start))
						.checkout(new SimpleDateFormat("yyyy/MM/dd").parse(end))
						.roomPrice(rvo.getRoomPrice())
						.payHow(0)
						.build();
				 if ("makeReservation".equals(action)) {
				        service.reservation(vo);
				        // 결제가 완료되면 메인 페이지로 리디렉션합니다.
				        WebUtils.alert(resp, "결제가 완료되었습니다.",req.getContextPath() + "/main");
				        return;
				    }else if ("cancel".equals(action)) {
				        // 취소 처리 로직 (예약 취소 등)
				        // 취소 처리 후 메인 페이지로 리디렉션합니다.
				        WebUtils.alert(resp, "예약이 취소되었습니다.", req.getContextPath() + "/main");
				        return;
				    }
			} catch (NumberFormatException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			if ("cancel".equals(action)) {
//				if (bookNoParam != null && !bookNoParam.isEmpty()) {
//					Long bookNo = Long.parseLong(bookNoParam);
//					req.setAttribute("bookNo", bookNo);
//					service.cancel(bookNo);
//					resp.sendRedirect("/main");
//					return;
//				}
//			if ("cancel".equals(action)) {
//		        if (bookNoParam != null) {
//		            Long bookNo = Long.parseLong(bookNoParam);
//		            service.cancel(bookNo);
//		            // 취소 후 /main으로 리디렉션
//		            resp.sendRedirect("/main");
//		            return;
//		        }
//		    }
		}
	    if (isRedirect) {
	        resp.sendRedirect("/main");
	    } else {
	        req.getRequestDispatcher("/WEB-INF/views/payment/payment.jsp").forward(req, resp);
	    }
	}
}
