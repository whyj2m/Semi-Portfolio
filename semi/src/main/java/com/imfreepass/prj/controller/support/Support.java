package com.imfreepass.prj.controller.support;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imfreepass.prj.domain.CriteriaVO;
import com.imfreepass.prj.service.BoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/support")
public class Support extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String category = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		// 문자열을 integer로 형변환 
		CriteriaVO.CriteriaVOBuilder cb = CriteriaVO.builder();
		if(category == null) {
			cb.category(2); 
		}
		if(pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if(amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		CriteriaVO criteriaVO = cb.build();
		log.info(criteriaVO);
		
		req.setAttribute("supportlist", boardService.getlist(criteriaVO));
		req.setAttribute("faq", boardService.getlist(criteriaVO.builder().category(1).amount(7).build()));
		req.getRequestDispatcher("/WEB-INF/views/support/support.jsp").forward(req, resp);
	}
	
}
