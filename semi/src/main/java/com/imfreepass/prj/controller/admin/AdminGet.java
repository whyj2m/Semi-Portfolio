package com.imfreepass.prj.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.AttachVO;
import com.imfreepass.prj.domain.BoardVO;
import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.PageDto;
import com.imfreepass.prj.service.AttachService;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

@WebServlet("/adminList/get")
public class AdminGet extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();
	private AttachService attachService = AttachService.getInstance();
	
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			MemberVO member = WebUtils.getMember(req);
			if (member == null || !member.getId().equals("admin")) { // 비로그인시 로그인으로
				resp.sendRedirect("/member/signin");
				return;
			}
			
			String category = req.getParameter("category");
			String pageNum = req.getParameter("pageNum");
			String amount = req.getParameter("amount");
			
			CriteriaVO.CriteriaVOBuilder cb = CriteriaVO.builder();
			if(category != null) {
				cb.category(Integer.parseInt(category)); 
			}
			if(pageNum != null) {
				cb.pageNum(Integer.parseInt(pageNum));
			}
			if(amount != null) {
				cb.amount(Integer.parseInt(amount));
			}
			CriteriaVO criteria = cb.build();
			if(req.getParameter("bno") == null) {
				WebUtils.alert(resp, "없는 게시글 번호입니다", "admin/adminList?" + criteria.getQs());
				return;
			}
			Long bno = Long.valueOf(req.getParameter("bno"));
			BoardVO boardVO = boardService.get(bno);
			attachService.getList(bno);
			
			
			req.setAttribute("cri", criteria);
			req.setAttribute("board", boardVO);
			req.setAttribute("attach", attachService.getList(bno));
			req.getRequestDispatcher("/WEB-INF/views/admin/AdminGet.jsp").forward(req, resp);
		}
	}

