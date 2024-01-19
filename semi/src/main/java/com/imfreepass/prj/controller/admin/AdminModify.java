package com.imfreepass.prj.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.CriteriaVO.CriteriaVOBuilder;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.WebUtils;
import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/adminList/modify")
public class AdminModify extends HttpServlet {
	private BoardService boardService = BoardService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = WebUtils.getMember(req);
		if (member.getId().equals("admin")) {
			String bno = req.getParameter("bno");
			if (bno != null) {
				BoardVO board = boardService.findBy(Long.valueOf(bno));
				if (board.getId().equals(member.getId())) {

					String category = req.getParameter("category");
					String pageNum = req.getParameter("pageNum");
					String amount = req.getParameter("amount");
					
					CriteriaVOBuilder cb = CriteriaVO.builder();
					if (category != null) {
						cb.category(Integer.parseInt(category));
					}
					if (pageNum != null) {
						cb.pageNum(Integer.parseInt(pageNum));
					}
					if (amount != null) {
						cb.amount(Integer.parseInt(amount));
					}
					CriteriaVO criteria = cb.build();
					req.setAttribute("cri", criteria);
					req.setAttribute("board", board);
					
					req.getRequestDispatcher("/WEB-INF/views/admin/AdminModify.jsp").forward(req, resp);
				}

			}
		}
		WebUtils.alert(resp, "비정상적인 접근입니다");
		resp.sendRedirect("/main");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String category = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String id = req.getParameter("id");

		CriteriaVO.CriteriaVOBuilder cb = CriteriaVO.builder();
		if (category != null) {
			cb.category(Integer.parseInt(category));
		}
		if (pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if (amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		CriteriaVO criteria = cb.build();

		BoardVO board = BoardVO.builder().id(id).title(title).content(content).bno(Long.valueOf(bno))
				.category(criteria.getCategory()).build();

		boardService.modify(board);
		// 수정 완료 팝업 예정 
		// http://localhost:8080/adminList/modify?bno=162
		resp.sendRedirect("get?bno=" + board.getBno());
	}
}
