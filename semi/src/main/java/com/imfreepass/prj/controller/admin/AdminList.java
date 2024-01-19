package com.imfreepass.prj.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.domain.MemberVO;
import com.imfreepass.prj.domain.PageDto;
import com.imfreepass.prj.service.BoardService;
import com.imfreepass.prj.util.WebUtils;

import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/admin/adminList")
public class AdminList extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			MemberVO member = WebUtils.getMember(req);
			if (member == null || !member.getId().equals("admin")) { // 비로그인시 로그인으로
				WebUtils.alert(resp, "비정상적인 접근입니다");
				return;
			}
			
			String category = req.getParameter("category");
			String pageNum = req.getParameter("pageNum");
			String amount = req.getParameter("amount");
			
			// 문자열을 integer로 형변환 
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
			log.info(criteria);
			
			req.setAttribute("pageDto", new PageDto(criteria, boardService.getCount(criteria)));
			req.setAttribute("cri", criteria);
			req.setAttribute("list", boardService.getlist(criteria));
			req.getRequestDispatcher("/WEB-INF/views/admin/AdminList.jsp").forward(req, resp);
		}
	}

