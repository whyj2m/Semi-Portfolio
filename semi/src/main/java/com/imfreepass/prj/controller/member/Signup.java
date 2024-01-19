package com.imfreepass.prj.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.MemberService;
import com.imfreepass.prj.util.WebUtils;

@WebServlet("/member/signup")
public class Signup extends HttpServlet {
	MemberService service = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String tell = req.getParameter("tell");
		
		MemberVO vo = MemberVO.builder().id(id).pw(pw).name(name).email(email).tell(tell).build();

		if (service.regist(vo) > 0) {
			WebUtils.alert(resp, "회원 가입을 축하합니다", "/");

		} else {
			WebUtils.alert(resp, "이미 가입된 ID 입니다", true);

		}
	}
}
