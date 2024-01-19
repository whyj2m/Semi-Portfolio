package com.imfreepass.prj.controller.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.MemberService;
import com.imfreepass.prj.util.WebUtils;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;

@WebServlet("/member/signin")
public class Signin extends HttpServlet{
	private MemberService service = MemberService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String href = req.getParameter("href");
		
//		String password = "1234";
//		String bcryptHashString = BCrypt.withDefaults().hashToString(12, pw.toCharArray());
//		Result result = BCrypt.verifyer().verify(pw.toCharArray(), bcryptHashString);
		MemberVO mem = service.findby(id);
		Result result = BCrypt.verifyer().verify(pw.toCharArray(), mem.getPw());
		if(mem != null && result.verified) { // 로그인 성공
			req.getSession().setAttribute("member", mem);
			//추가작업
			
			if(href != null) {
				href= URLDecoder.decode(href, "utf-8");
			}else {
				href = "/main";
			}
			resp.sendRedirect(href == null ? "/main" : href);
		}
		else { // 실패
			WebUtils.alert(resp, "로그인 실패",true);
		}
	}
}
