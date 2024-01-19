package com.imfreepass.prj.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.ReservationVO;
import com.imfreepass.prj.service.HotelService;
import com.imfreepass.prj.service.MemberService;
import com.imfreepass.prj.service.ReservationService;
import com.imfreepass.prj.util.WebUtils;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;

@WebServlet("/member/mypage")
public class MyPage extends HttpServlet {
	private MemberService service = MemberService.getInstance();
	private ReservationService rsService = ReservationService.getInstance();
	private HotelService hotelService = HotelService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = WebUtils.getMember(req);
		
		if (member == null) { // 비로그인시 로그인으로
			resp.sendRedirect("/member/signin");
			return;
		}
		List<ReservationVO> reservations = rsService.list(member.getId());
		req.setAttribute("reservations", reservations);
		req.setAttribute("myMember", service.findby(member.getId()));
		req.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String tell = req.getParameter("tell");
		String oldpw = req.getParameter("oldpw");
		String pw = req.getParameter("pw");

		MemberVO mem = (MemberVO)req.getSession().getAttribute("member");
//		Result result = BCrypt.verifyer().verify(pw.toCharArray(), mem.getPw());
		if (mem == null) { // mypage에 로그인이 안되어있으면 main으로 보내버리기
			resp.sendRedirect("/main");
			return;
		}
		
		MemberVO updateMember = service.findby(mem.getId());
		// 비밀번호 변경 눌러서 변경했을때
		if("changePassword".equals(action)) {
			Result result = BCrypt.verifyer().verify(oldpw.toCharArray(), updateMember.getPw());
			if(!result.verified) {
				WebUtils.alert(resp, "현재 비밀번호가 일치하지않습니다");
			} else {
				String hashpw = BCrypt.withDefaults().hashToString(12, pw.toCharArray());
				updateMember = MemberVO.builder()
						.id(updateMember.getId())
						.name(updateMember.getName())
						.email(updateMember.getEmail())
						.tell(updateMember.getTell())
			            .pw(hashpw) // Hash the new password
			            .build();
				
				service.modifyPw(updateMember);
			}
		} else if ("updateInfo".equals(action)){
			updateMember = MemberVO.builder()
					.id(updateMember.getId())
					.name(name)
					.email(email)
					.tell(tell)
					.build();
			service.modify(updateMember);
		}
		
		System.out.println(updateMember);
		
		req.getSession().setAttribute("member", updateMember);
		resp.sendRedirect("/member/mypage");
	}
}
