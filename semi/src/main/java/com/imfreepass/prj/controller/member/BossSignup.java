package com.imfreepass.prj.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.mapper.MemberMapper;
import com.imfreepass.prj.service.MemberService;
import com.imfreepass.prj.util.WebUtils;

import at.favre.lib.crypto.bcrypt.BCrypt;

@WebServlet("/member/bossSignup")
public class BossSignup extends HttpServlet {
	private MemberService service = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/bossSignup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String grade = req.getParameter("grade");
		String pw = BCrypt.withDefaults().hashToString(12,req.getParameter("pw").toCharArray());
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String tell = req.getParameter("tell");
		String businessNo = req.getParameter("businessNo");
		
		MemberVO member = MemberVO.builder().id(id).grade(1).pw(pw).name(name).email(email).tell(tell).businessNo(businessNo).build();
		System.out.println(member);

		if (service.regist(member) > 0) {
			WebUtils.alert(resp, "회원 가입을 축하합니다", "/");

		} else {
			WebUtils.alert(resp, "이미 가입된 ID 입니다", true);

		}
	}
}
