package com.imfreepass.prj.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.service.MemberService;

@WebServlet("/member/checkId")
public class CheckId extends HttpServlet {
	private MemberService service = MemberService.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
        boolean isAvailable = service.idAvailable(id);
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        if (isAvailable) {
            resp.getWriter().write("AVAILABLE");
        } else {
            resp.getWriter().write("UNAVAILABLE");
        }
	}
	
}
