package com.imfreepass.prj.controller.bossmember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.WebUtils;

@WebServlet("/bossmember")
public class BossMember extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = WebUtils.getMember(req);
		if (member == null) {
			resp.sendRedirect("/member/signin");
			return;
		}
		req.setAttribute("board", boardService.getlist(CriteriaVO.builder().category(2).amount(5).build()));
		req.setAttribute("faq", boardService.getlist(CriteriaVO.builder().category(1).amount(5).build()));
		req.getRequestDispatcher("/WEB-INF/views/bossmember/bossmember.jsp").forward(req, resp);
	}
	
}
